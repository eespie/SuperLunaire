Level = class()

function startLevel(okStage)
    lostCount = lostCount + 1
    currLevel:resetData()
    if okStage and beginStage(currIndex) then
        stageScreen:start()
    else
        playScreen:start()
    end
end

function nextLevel()
    lostCount = 0
    if levels[currIndex+1] then
        local st = getStage(currIndex+1)
        if totalStars < st.minStars then 
            selectScreen:start()
            return nil
        end
        currIndex = currIndex + 1
        local max = readLocalData("levelIndex", 1)
        if currIndex > max then
            saveLocalData("levelIndex", currIndex)
        end
    else
        -- FINISHED
        endGameScreen:start()
        return nil
    end
    -- print(currIndex.."  "..levels[currIndex].name)
    currLevel:resetData()
    if beginStage(currIndex) then
        stageScreen:start()
    else
        playScreen:start()
    end
end

function getStage(level)
    local s = 1
    while stages[s] do
        if level <= stages[s].endLevel then
            return stages[s]
        end
        s = s + 1
    end
    return nil 
end

function beginStage(level)
    local s = 1
    while stages[s] do
        if level == stages[s].startLevel then
            currStage = s
            return true
        end
        s = s + 1
    end
    return false
end

function winMenu(time, isBest)
    winScreen:start(time, isBest)
end

function Level:init()
    self.decor = {}
    self.crashMsg = {}
    self.altMsg = {}
    self.winMsg = {}
end

function Level:resetData()
    resetId()
    if Table.size(self.crashMsg) == 0 then
        self.crashMsg = Table.clone(crashMsg)
    end
    if Table.size(self.altMsg) == 0 then
        self.altMsg = Table.clone(altMsg)
    end
    if Table.size(self.winMsg) == 0 then
        self.winMsg = Table.clone(winMsg)
    end
    self:bindEvents()
    if self.lander then
        self.lander:clear()
    end
    if self.target then
        self.target:clear()
    end
    for _,decor in pairs(self.decor) do
        decor:clear()
    end
    self.ground = removeBody(self.ground)
    self.decor = {}
    display:clear()
    collectgarbage()
    physics.gravity(vec2(0,0))
end

function Level:start()
    local data = levels[currIndex]
    self.levelData = data
    self.name = data.name
    -- for Display
    self.bg = Background(data.bg)
    maxSpeed = data.maxSpeed
    self.timer = {t=0}
    self.message = nil
    self:createGround()
    self.lander = Lander(data.lander.x, data.lander.y, data.maxSpeed)
    self.target = Target(data.target)
    if data.decor then
        for _,ddata in pairs(data.decor) do
            table.insert(self.decor, Decor(ddata))
        end
    end
    self.elapsedTime = 0
    self.bestTime = readLocalData("best-"..currIndex)
    self.dispTuto = not self.bestTime and tutoMsg[currIndex]
    self.msgSaid = false
    currScreen = self
    Events.trigger("starting")
end

function Level:startLevel()
    state = "starting"
end

function Level:bindEvents()
    Events.unbindAll()
    Events.bind("crash", self, self.crash)
    Events.bind("win", self, self.win)
    Events.bind("starting", self, self.startLevel)
end

function Level:crash()
    if initAd then
        initAd()
    end
    state = "crash"
    self.elapsedTime = self.elapsedTime + DeltaTime
    local msg = "perdu"
    if lostCount % 3 == 0 then
        msg = Table.random(self.altMsg)
        Table.remove(self.altMsg, msg)
    else
        msg = Table.random(self.crashMsg)
        Table.remove(self.crashMsg, msg)
    end
    if speechOn then speech.say(msg) end
    self:newMessage(msg, startLevel, 3, false)
end

function Level:win()
    if initAd then
        initAd()
    end
    state = "win"
    self.elapsedTime = self.elapsedTime + DeltaTime
    local time = math.floor((self.elapsedTime)*100)/100
    local isBest = false
    if not self.bestTime or time < self.bestTime then
        saveLocalData("best-"..currIndex, time)
        isBest = true
        local stars = 0
        if self.levelData.stars then
            for i = 1,3 do
                if time <= self.levelData.stars[i] then
                    stars = i
                end
            end
            local prevLvlStars = readLocalData("stars-"..currIndex, 0)
            saveLocalData("stars-"..currIndex, stars)
            if prevLvlStars ~= stars then
                totalStars = totalStars + (stars - prevLvlStars)
                saveLocalData("totalStars", totalStars)
            end
        end
    end
    local msg = Table.random(self.winMsg)
    Table.remove(self.winMsg, msg)
    
    local max = math.floor(readLocalData("levelIndex", 1))
    if (currIndex+1) > max then
        if levels[currIndex+1] then
            local st = getStage(currIndex+1)
            if totalStars >= st.minStars then
                saveLocalData("levelIndex", currIndex+1)
            end
        end
        if gamecenter and gamecenter.enabled then
            gamecenter.submitScore(currIndex, "superlunaire")
        end
    end
    
    -- CHECK IF UNLOCK NEW LEVEL
    local stars = readLocalData("stars-"..max, 0)
    if stars > 0 then
        if levels[max+1] then
            local st = getStage(max+1)
            if totalStars >= st.minStars then
                saveLocalData("levelIndex", max+1)
            end
        end
    end
    
    if speechOn then speech.say(msg) end
    self:newMessage(msg, winMenu, 2, time, isBest)
end

function Level:draw()
    self.lander:preDraw()
    self.bg:draw()
    self.target:draw()
    for _,decor in pairs(self.decor) do
        decor:draw()
    end
    self.lander:draw()
    if state == "running" then
        local gd = self.lander:getGravityDistortion()
        self.elapsedTime = self.elapsedTime + DeltaTime*gd
    end
    self:displayTime()
    self:drawMessage()
    if state == "starting" and self.dispTuto then
        if not self.msgSaid then
            self.msgSaid = true
            local t = tutoMsg[currIndex]
            local i = 1
            while t[i] do
                speech.say(t[i])
                i = i + 1
            end
        end
        pushStyle()
        fontSize(30)
        fill(255)
        local t = tutoMsg[currIndex]
        local i = 1
        local d = 50
        while t[i] do
            text(t[i], 512, 500-i*d)
            i = i + 1
        end
        sprite(imgTuto[currIndex], 1024*3/4, 768/4)
        popStyle()
    end
end

function Level:displayTime()
    local t = math.floor((self.elapsedTime)*100)/100
    local tm = formatTime(t)
    local time = string.format(timeMsg, tm)
    if self.bestTime then
        tm = formatTime(self.bestTime)
        time = time.."  "..string.format(recordMsg, tm)
    end
    pushMatrix()
    pushStyle()
    fill(255, 255, 255, 255)
    fontSize(30)
    textMode(CORNER)
    text(time, 20, 768-50)
    popStyle()
    popMatrix()
end

function Level:touched(touch)
    if state == "starting" then
        if self.dispTuto then
            self.dispTuto = false
        else
            speech.stop(true)
            speech.continue()
            state = "running"
            physics.gravity(defaultGravity)
        end
    end
    if state == "running" or touch.state == ENDED then
        self.lander:touched(touch)
    end
end

function Level:collide(contact)
    if state == "running" or state == "starting" then
        if contact.state == BEGAN then
            if getBodyInfo(contact.bodyA) == decorInfo or getBodyInfo(contact.bodyB) == decorInfo then
                physics.gravity(defaultGravity)
                Events.trigger("crash")
            end
        end
        if getBodyInfo(contact.bodyA) == decorDetectInfo or getBodyInfo(contact.bodyB) == decorDetectInfo then
            for _,decor in pairs(self.decor) do
                decor:collide(contact)
            end
        end
    end
    if state == "running" then
        self.lander:collide(contact)
    end
    if state == "running" then
        self.target:collide(contact)
    end
end

function Level:newMessage(msg, callback, timeout, ...)
    if self.tween then
        tween.stop(self.tween)
    end
    local tmout = timeout or 3
    local args = {...}
    self.message = msg
    self.timer.t = 0
    self.tween = tween(tmout, self.timer, {t=100}, tween.easing.linear, function()
        self.message = nil
        self.tween = nil
        if callback then callback(unpack(args)) end
    end)
end

function Level:drawMessage()
    if self.message then
        pushMatrix()
        pushStyle()
        fontSize(50)
        fill(255, 255, 255, 255)
        textAlign(CENTER)
        translate(512, 384)
        text(self.message, 0, 0)
        popStyle()
        popMatrix()
    end
end

function Level:createGround()
    local ground = physics.body(CHAIN, true, vec2(0,0), vec2(1024,0), vec2(1024,768), vec2(0,768))
    ground.type = STATIC
    ground.restitution = .5
    ground.info = decorInfo*bodyInfo+getId()
    display:addBody(ground)
    self.ground = ground
end
