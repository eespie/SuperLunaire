DifficultyScreen = class()

function DifficultyScreen:init(x)
    self.bg = Background("Dropbox:starfield-ee-04")
end

function DifficultyScreen:start()
    self.title = Title(difficultyMsg)
    quitButton:start()
    self.levBtn = {}
    self.count = Table.size(difficultLevelMsg)
    self.difficulty = difficulty
    for i = 1,self.count do
        local b = Button(difficultLevelMsg[i], 512, 384-(i-2)*90, BTNCHECK, self.difficulty==i)
        table.insert(self.levBtn, b)
    end
    self.okBtn = Button(okMsg, 1024*3/4, 128, BTNARROW)
    self.cancelBtn = Button(cancelMsg, 1024*1/4, 128)
    currScreen = self
end

function DifficultyScreen:draw()
    self.bg:draw()
    quitButton:draw()
    self.title:draw()
    for i = 1,self.count do
        self.levBtn[i]:setChecked(self.difficulty==i)
        self.levBtn[i]:draw()
    end
    self.okBtn:draw()
    self.cancelBtn:draw()
    pushStyle()
    fill(255, 255, 255, 255)
    textMode(CENTER)
    fontSize(30)
    text(difficultyInfoMsg, 512, 580)
    popStyle()
end

function DifficultyScreen:touched(touch)
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    for i = 1,self.count do
        if self.levBtn[i]:check(t, touch.state) then
            self.difficulty = i
        end
    end
    
    if self.okBtn:check(t, touch.state) then
        if self.difficulty ~= difficulty then
            difficulty = self.difficulty
            clearLocalData()
            totalStars = 0
            saveLocalData("difficulty", difficulty)
        end
        selectScreen:start()
    end
    
    if self.cancelBtn:check(t, touch.state) then
        selectScreen:start()        
    end
    
    if quitButton:touched(touch) then
        selectScreen:start()
    end
end
