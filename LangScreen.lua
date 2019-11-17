LangScreen = class()

function LangScreen:init(x)
    self.bg = Background("Dropbox:starfield-ee-04")
    self.title = Title(langMsg)
 end

function LangScreen:start()
    quitButton:start()
    self.levBtn = {}
    self.count = Table.size(langSelectMsg)
    self.lang = lang
    for i = 1,self.count do
        local b = Button(langSelectMsg[i].display, 512, 384-(i-2)*90, BTNCHECK, self.lang==langSelectMsg[i].lang)
        table.insert(self.levBtn, b)
    end
    self.okBtn = Button(okMsg, 1024*3/4, 128, BTNARROW)
    self.cancelBtn = Button(cancelMsg, 1024*1/4, 128)
    currScreen = self
end

function LangScreen:draw()
    self.bg:draw()
    quitButton:draw()
    self.title:draw()
    for i = 1,self.count do
        self.levBtn[i]:setChecked(self.lang==langSelectMsg[i].lang)
        self.levBtn[i]:draw()
    end
    self.okBtn:draw()
    self.cancelBtn:draw()
    pushStyle()
    fill(255, 255, 255, 255)
    textMode(CENTER)
    fontSize(30)
    text(langInfoMsg, 512, 580)
    popStyle()
end


function LangScreen:touched(touch)
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    for i = 1,self.count do
        if self.levBtn[i]:check(t, touch.state) then
            self.lang = langSelectMsg[i].lang
        end
    end
    
    if self.okBtn:check(t, touch.state) then
        if self.lang ~= lang then
            lang = self.lang
            saveLocalData("lang", lang)
            if lang == "fr" then
                initMsgFr()
            elseif lang == "en" then
                initMsgEn()
            end
            resetId()
            initLevels()
            currLevel:init()
            currLevel:resetData()
        end
        self:out()
    end
    
    if self.cancelBtn:check(t, touch.state) then
        self:out()
    end
    
    if quitButton:touched(touch) then
        self:out()
    end
end

function LangScreen:out()
    if totalStars == 0 then
        difficultyScreen:start()
    else
        selectScreen:start()
    end
end