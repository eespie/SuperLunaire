WinScreen = class()

function WinScreen:init()
    self.bg = Background("Dropbox:starfield-ee-01")
end

function WinScreen:start(time, isBest)
    self.time = time
    self.isBest = isBest
    self.data = levels[currIndex]
    self.bestTime = readLocalData("best-"..currIndex)
    self.stars = readLocalData("stars-"..currIndex, 0)
    self.nextBtn = Button(nextMsg, 1024*3/4, 128, BTNARROW)
    self.replayBtn = Button(replayMsg, 1024*1/4, 128)
    quitButton:start()
    currScreen = self
end

function WinScreen:draw()
    self.bg:draw()
    quitButton:draw()
    self.nextBtn:draw()
    self.replayBtn:draw()
    pushMatrix()
    pushStyle()
    fill(255, 255, 255, 255)
    fontSize(50)
    text(self.data.name, 512, 640)
    for i = -1,1 do
        local pos = vec2(512+i*150, 512)
        if (i+2) > self.stars then
            sprite(imgEmptyStar, pos.x, pos.y)
        else
            sprite(imgFilledStar, pos.x, pos.y)
        end
    end
    local max = readLocalData("levelIndex", 1)
    local totst = string.format(starsMsg, totalStars, max*3)
    text(totst, 512, 416)
    local tm = formatTime(self.time)
    local time = string.format(timeMsg,tm)
    text(time, 512, 320)
    if self.isBest then
        text(newRecordMsg, 512, 224)
    else
        tm = formatTime(self.bestTime)
        time = string.format(recordMsg,tm)
        text(time, 512, 224)
    end
    popStyle()
    popMatrix()
end

function WinScreen:touched(touch)
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    
    if self.nextBtn:check(t, touch.state) then
        nextLevel()
    end
    if self.replayBtn:check(t, touch.state) then
        startLevel(false)
    end
    
    if quitButton:touched(touch) then
        selectScreen:start()
    end
end
