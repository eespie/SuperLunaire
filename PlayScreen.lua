PlayScreen = class()

function PlayScreen:init()
    self.bg = Background("Dropbox:starfield-ee-09")
end

function PlayScreen:start()
    -- RANDOM AD...
    if lostCount%5 == 4 then
        if showAd and canShowAd() then
            music.paused = true
            showAd()
        end
    elseif math.random(1,12) == 5 then
        if showAd and canShowAd() then
            music.paused = true
            showAd()
        end
    else
        music.paused = false
    end
    self.data = levels[currIndex]
    self.bestTime = readLocalData("best-"..currIndex)
    self.stars = readLocalData("stars-"..currIndex, 0)
    fontSize(50)
    self.playBtn = Button(playMsg, 512, 768/5, BTNARROW)
    local max = readLocalData("levelIndex", 1)
    quitButton:start()
    self.starsMsg = {
    winthelevelMsg,
    formatTime(self.data.stars[2]),
    formatTime(self.data.stars[3])
    }
    self.starsMsgPos = {}
    fontSize(30)
    for i=1,3 do
        local w = textSize(self.starsMsg[i])
        table.insert(self.starsMsgPos, w)
    end
    if speechOn then speech.say(self.data.name) end
    currScreen = self
    self.elapse = ElapsedTime
end

function PlayScreen:draw()
    self.bg:draw()
    self.playBtn:draw()
    quitButton:draw()
    pushMatrix()
    pushStyle()
    fill(253, 253, 253, 255)
    fontSize(30)
    textMode(CENTER)
    for i=1,3 do
        local y = 760-i*30
        text(i, 20, y)
        sprite(imgWhiteStar, 50, y, 25, 25)
        text(self.starsMsg[i], 70+self.starsMsgPos[i]/2, y)
    end
    fontSize(50)
    text(self.data.name, 512, 768*4/5)
    for i = -1,1 do
        local pos = vec2(512+i*150, 768*3/5)
        if (i+2) > self.stars then
            sprite(imgEmptyStar, pos.x, pos.y)
        else
            sprite(imgFilledStar, pos.x, pos.y)
        end
    end
    if self.bestTime then
        fontSize(50)
        local tm = formatTime(self.bestTime)
        local time = string.format(recordMsg, tm)
        text(time, 512, 768*2/5)
    end    
    popStyle()
    popMatrix()
end

function PlayScreen:touched(touch)
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    if self.playBtn:check(t, touch.state) then
        music.paused = false
        currLevel:start()
    end
    if quitButton:touched(touch) then
        music.paused = false
        selectScreen:start()
    end
end
