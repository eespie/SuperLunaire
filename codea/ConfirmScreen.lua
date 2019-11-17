ConfirmScreen = class()

function ConfirmScreen:init()
    self.bg = Background("Dropbox:starfield-ee-08")
end

function ConfirmScreen:start()
    quitButton:start()
    self.okBtn = Button(confirmOkMsg, 350, 300, BTNARROW)
    self.cancelBtn = Button(confirmCancelMsg, 800, 300)
    currScreen = self
end

function ConfirmScreen:draw()
    self.bg:draw()
    quitButton:draw()
    self.okBtn:draw()
    self.cancelBtn:draw() 
    pushMatrix()
    pushStyle()
    fill(253, 253, 253, 255)
    fontSize(50)
    textMode(CENTER)
    text(confirmTitleMsg, 512, 640)
    fontSize(30)
    fill(253, 253, 253, 255)
    text(confirmExplMsg, 512, 550)
    popStyle()
    popMatrix()
end

function ConfirmScreen:touched(touch)
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    if self.okBtn:check(t, touch.state) then
            self:resetScores()
    end
    if self.cancelBtn:check(t, touch.state) then
            selectScreen:start()
    end
    if quitButton:touched(touch) then
        selectScreen:start()
    end
end

function ConfirmScreen:resetScores()
    clearLocalData()
    totalStars = 0
    selectScreen:start()
end
