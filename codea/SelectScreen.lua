SelectScreen = class()

function SelectScreen:init()
    self.bg = Background("Dropbox:starfield-select-03")
    self.bgSz = self.bg:getImgSz()
    fontSize(30)
    self.optionW = imgUIGear.width
    self.optionH = imgUIGear.height
    self.optionPos = vec2(1024-self.optionW/2-5, 768-self.optionH/2-5)
    self.trans = vec2(0,0)
    self.mx = 0
    self.my = 0
    self.moved = false
end

function SelectScreen:start()
    self.levpos = {}
    self.levstars = {}
    self.currLev = readLocalData("levelIndex", 1)
    -- self.currLev = 58
    -- totalStars = 90
    self.currTouch = 0
    self.optionTouch = false
    local screenRatio = 0.75
    self.radiusl = 80
    self.radiush = self.radiusl * screenRatio
    
    local s = 1
    while stages[s] do
        local st = stages[s]
        local center = st.pos
        if self.currLev >= st.startLevel and self.currLev <= st.endLevel then
            self:setTranslation(-center.x+512,-center.y+384)
        end
        local radius = 220
        local angle = math.rad(st.angle)
        local k1 = self.radiusl/1.5
        local k2 = k1/math.pi
        local delta = math.asin(k1/radius) * 2 * st.rotation
        local i = st.startLevel
        while levels[i] and i <= st.endLevel do
            local pos = vec2(center.x+math.cos(angle)*radius, center.y+math.sin(angle)*radius*screenRatio)
            table.insert(self.levpos, pos)
            -- local delta = math.asin(k1/radius) * 2
            angle = angle + delta
            -- radius = radius + k2 * delta
            local stars = readLocalData("stars-"..i)
            table.insert(self.levstars, stars)
            i = i + 1
        end
        s = s + 1
    end
    currScreen = self
end

function SelectScreen:draw()
    pushMatrix()
    translate(self.trans.x, self.trans.y)
    self.bg:draw()
    pushStyle()
    strokeWidth(3)
    fontSize(30)
    pushStyle()
    textMode(CENTER)
    local i = 1
    while stages[i] do
        local st = stages[i]
        sprite(imgPlanetSelect[i], st.pos.x, st.pos.y)
        if totalStars < st.minStars then
            fill(255, 0, 0, 255)
            text(st.name, st.pos.x, st.pos.y+20)
            tint(255, 0, 0, 255)
            local minScr = string.format("%d",st.minStars)
            local minScrW = textSize(minScr)
            sprite(imgWhiteStar, st.pos.x-minScrW/2-15, st.pos.y-20, 25, 25)
            noTint()
            text(minScr, st.pos.x+15, st.pos.y-20)
        else
            fill(255, 255, 255, 255)
            text(st.name, st.pos.x, st.pos.y)
        end
        i = i + 1
    end
    popStyle()
    
    i = 1
    while self.levpos[i] do
        if i == self.currTouch then
            stroke(244, 244, 244, 255)
            fill(148, 26, 119, 255)
            ellipse(self.levpos[i].x, self.levpos[i].y, self.radiusl, self.radiush)
            fill(255, 255, 255, 255)
            text(i, self.levpos[i].x, self.levpos[i].y)
        elseif i < self.currLev then
            stroke(28, 218, 200, 255)
            fill(27, 39, 148, 255)
            ellipse(self.levpos[i].x, self.levpos[i].y, self.radiusl, self.radiush)
            fill(28, 218, 200, 255)
            text(i, self.levpos[i].x, self.levpos[i].y)
        elseif i == self.currLev then
            stroke(255, 0, 0, 255)
            fill(101, 31, 90, 255)
            ellipse(self.levpos[i].x, self.levpos[i].y, self.radiusl, self.radiush)
            fill(255, 0, 0, 255)
            text(i, self.levpos[i].x, self.levpos[i].y)
        else
            stroke(127, 127, 127, 255)
            fill(60, 60, 60, 255)
            ellipse(self.levpos[i].x, self.levpos[i].y, self.radiusl, self.radiush)
            fill(127, 127, 127, 255)
            text(i, self.levpos[i].x, self.levpos[i].y)
        end
        if self.levstars[i] then
            for j = -1,1 do
                local pos = vec2(self.levpos[i].x+j*25, self.levpos[i].y-30)
                if (j+2) > self.levstars[i] then
                    sprite(imgEmptyStar, pos.x, pos.y, 25, 25)
                else
                    sprite(imgFilledStar, pos.x, pos.y, 25, 25)
                end
            end
        end
        i = i + 1
    end
    if self.optionTouch then
        fill(255, 0, 0, 255)
    else
        fill(251, 251, 251, 255)
    end
    translate(-self.trans.x, -self.trans.y)
    sprite(imgUIGear, self.optionPos.x, self.optionPos.y)
    fontSize(40)
    fill(255, 255, 255, 255)
    sprite(imgFilledStar, 30, 738, 40, 40)
    local scr = string.format("%d",totalStars)
    local scrw = textSize(scr)
    text(scr, 60+scrw/2, 738)
    popStyle()
    popMatrix()
    if self.moved then
        self.moved = false
    else
        self.mx = self.mx * 0.94
        if math.abs(self.mx) < 5 then self.mx = 0 end
        self.my = self.my * 0.94
        if math.abs(self.my) < 5 then self.my = 0 end
        self:setTranslation(self.trans.x+self.mx,self.trans.y+self.my)
    end
end

function SelectScreen:touched(touch)
    self.moved = true
    local i = 1
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    local tt = t - self.trans
    while i < (self.currLev + 1) do
        if tt:dist(self.levpos[i]) < self.radiusl/2 then
            if touch.state == ENDED then
                currIndex = i
                startLevel(true)
                return nil
            else
                self.currTouch = i
                return nil
            end
        end
        i = i + 1
    end
    self.currTouch = 0
    
    if touch.state == BEGAN then
        local s = 1
        while stages[s] do
            local st = stages[s]
            if tt:dist(st.pos) < 100 then
                if levels[st.startLevel] then
                    currIndex = st.startLevel
                    startLevel(true)
                    return nil
                end
                speech.say(st.presentationMsg[1].msg)
            end
            s = s + 1
        end
    end
    
    self.optionTouch = t.x > (self.optionPos.x-self.optionW/2) and t.x < (self.optionPos.x+self.optionW/2) and t.y > (self.optionPos.y-self.optionH/2) and t.y < (self.optionPos.y+self.optionH/2)
    if self.optionTouch then
        if touch.state == ENDED then
            optionScreen:start()
            return nil
        end
    end
    
    if touch.state == MOVING then
        self.mx = touch.deltaX
        self.my = touch.deltaY
        local tx = self.trans.x + touch.deltaX
        local ty = self.trans.y + touch.deltaY
        self:setTranslation(tx,ty)
    end
end

function SelectScreen:setTranslation(tx,ty)
    if tx < -self.bgSz.x/2+512+screenMargin.x then tx = -self.bgSz.x/2+512+screenMargin.x end
    if tx > self.bgSz.x/2-512-screenMargin.x then tx = self.bgSz.x/2-512-screenMargin.x end
    if ty < -self.bgSz.y/2+384+screenMargin.y then ty = -self.bgSz.y/2+384+screenMargin.y end
    if ty > self.bgSz.y/2-384-screenMargin.y then ty = self.bgSz.y/2-384-screenMargin.y end
    
    self.trans.x = tx
    self.trans.y = ty
end
