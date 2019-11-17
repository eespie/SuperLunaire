DailyBonusScreen = class()

function DailyBonusScreen:init()
    self.bg = Background("Dropbox:starfield-ee-08")
    fontSize(50)
    self.prevTime = readLocalData("time", os.time())
    saveLocalData("time", os.time())
    self.consecutiveDays = readLocalData("consecutiveDays",1)
end

function DailyBonusScreen:start()
    local d = daysFrom(self.prevTime)
    if d == 0 then
        selectScreen:start()
        return nil
    end
    local msg = nil
    if d == 1 then
        msg = welcomeBackMsg[1]
        self.consecutiveDays = self.consecutiveDays + 1
        saveLocalData("consecutiveDays", self.consecutiveDays)
    else
        msg = welcomeBackMsg[2]
        self.consecutiveDays = 1
        saveLocalData("consecutiveDays", self.consecutiveDays)
    end
    self.msg = string.format(msg, self.consecutiveDays)
    quitButton:start()
    currScreen = self
end

function DailyBonusScreen:draw()
    self.bg:draw()
    quitButton:draw()
    fontSize(50)
    fill(255)
    text(self.msg, 512, 384)
end

function DailyBonusScreen:touched(touch)
    if quitButton:touched(touch) then
        selectScreen:start()
    end
end
