EndGameScreen = class()

function EndGameScreen:init()
    self.bg = Background("Dropbox:starfield-ee-04")
end

function EndGameScreen:start()
    fontSize(50)
    local w,h = textSize(endGameMsg)

    local offset = 3*h
    self.titlePos = vec2(512, 640)
    fontSize(30)
    w,h = textSize("w")
    self.count = Table.size(endGameLineMsg)
    local c = self.count+1
    self.pos = {}
    for i = 1, self.count do
        table.insert(self.pos, vec2(512, 768-offset))
        offset = offset + h
    end    
    quitButton:start()
    self.nextBtn = Button(endGameActionMsg, 512, 128, BTNARROW)
    speech.say(endGameMsg)
    for i = 1, self.count do
        speech.say(endGameLineMsg[i])
    end    
    currScreen = self
end

function EndGameScreen:draw()
    self.bg:draw()
    quitButton:draw()
    self.nextBtn:draw()

    pushStyle()
    fontSize(50)
    fill(255)
    text(endGameMsg, self.titlePos.x, self.titlePos.y)
    fontSize(30)
    for i = 1, self.count do
        text(endGameLineMsg[i], self.pos[i].x, self.pos[i].y)
    end
    popStyle()

end

function EndGameScreen:stop()
    speech.stop(true)
    speech.continue()
end

function EndGameScreen:touched(touch)
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    if self.nextBtn:check(t, touch.state) then
        self:stop()
        openURL("itms-apps://itunes.apple.com/app/id1027133124")
        selectScreen:start()
    end
    
    if quitButton:touched(touch) then
        self:stop()
        selectScreen:start()
    end
end
