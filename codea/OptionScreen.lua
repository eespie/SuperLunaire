OptionScreen = class()

function OptionScreen:init()
    -- global options
    speechLvl = readLocalData("speechLvl", 8)
    speech.volume = speechLvl/10
    speechOn = (speechLvl > 0)
    musicLvl = readLocalData("musicLvl", 5)
    musicOn = (musicLvl > 0)
    sfxLvl = readLocalData("sfxLvl", 10)
    sfxOn = (sfxLvl > 0)
    difficulty = readLocalData("difficulty", 2)
    -- end of global options
end

function OptionScreen:start()
    self.bg = Background("Dropbox:starfield-ee-08")
    fontSize(50)
    local w,h = textSize(optionMsg)
    self.titlePos = vec2(512, 768-h)
    local offset = 3*h
    self.sliders = {}
    self.msg = {
    {msg=speechMsg, slider=speechLvl, sldcb=self.updateSpeech, refresh=false},
    {msg=musicMsg, slider=musicLvl, sldcb=self.updateMusic, refresh=true},
    {msg=langMsg, callback=self.changeLang},
    {msg=difficultyMsg, callback=self.changeDifficulty},
    {msg=resetMsg, callback=self.resetScores},
    {msg=creditMsg, callback=self.credits}}
    self.pos = {}
    self.size = {}
    self.touch = {}
    self.count = Table.size(self.msg)
    local c = self.count
    for i = 1, self.count do
        local pos = vec2(512, 768-offset)
        if self.msg[i].slider then pos.x = 1024/4 end
        offset = offset + h*1.5
        local sizeW, sizeH = textSize(self.msg[i].msg)
        table.insert(self.pos, pos)
        table.insert(self.size, vec2(sizeW, sizeH))
    end
    currScreen = self
    for i = 1, self.count do
        self.touch[i] = false
        if self.msg[i].slider then
            self.sliders[i] = Slider(self.msg[i].slider,self.pos[i].x+512, self.pos[i].y, self.msg[i].refresh)
        end
    end
    quitButton:start()
end

function OptionScreen:draw()
    self.bg:draw()
    quitButton:draw()
    pushMatrix()
    pushStyle()
    fontSize(50)
    text(optionMsg, self.titlePos.x, self.titlePos.y)
    for i = 1, self.count do
        if not self .msg[i].callback then
            fill(150)
        elseif self.touch[i] then
            fill(255, 0, 0, 255)
        else
            fill(255)
        end
        text(self.msg[i].msg, self.pos[i].x, self.pos[i].y)
        if self.msg[i].slider then
            text(string.format("%d",self.msg[i].slider), 512, self.pos[i].y)
            self.sliders[i]:draw()
        end
    end
    popStyle()
    popMatrix()
end

function OptionScreen:touched(touch)
    if quitButton:touched(touch) then
        selectScreen:start()
    end
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    for i = 1, self.count do
        if self.msg[i].slider then
            if self.sliders[i]:touched(touch) then
                self.msg[i].slider = self.sliders[i].value
                self.msg[i].sldcb(self.msg[i].slider)
            end
        else
            self.touch[i] = t.x > (self.pos[i].x-self.size[i].x/2) and t.x < (self.pos[i].x+self.size[i].x/2) and t.y > (self.pos[i].y-self.size[i].y/2) and t.y < (self.pos[i].y+self.size[i].y/2)
        end
    end
    
    if touch.state == ENDED then
        for i = 1, self.count do
            if self.touch[i] then
                if self.msg[i].callback then self.msg[i].callback() end
            end
        end
    end
end

function OptionScreen.resetScores()
    confirmScreen:start()
end

function OptionScreen.credits()
    creditsScreen:start()
end

function OptionScreen:changeDifficulty()
    difficultyScreen:start()
end

function OptionScreen:changeLang()
    langScreen:start()
end

function OptionScreen.updateSpeech(v)
    saveLocalData("speechLvl", v)
    speech.volume = v/10
    speechOn = (v > 0)
    if speechOn and speechLvl ~= v then
        speech.stop()
        speech.say("O.K.")
    end
    speechLvl = v
end

function OptionScreen.updateMusic(v)
    saveLocalData("musicLvl", v)
    music.volume = v/10
    musicLvl = v
    musicOn = (v > 0)
end

