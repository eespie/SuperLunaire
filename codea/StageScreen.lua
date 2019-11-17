StageScreen = class()

function StageScreen:init()
end

function StageScreen:start()
    local st = stages[currStage]
    self.missingStars = st.minStars - totalStars
    currIndex = st.startLevel
    self.bg = Background(levels[currIndex].bg)
    quitButton:start()
    self.title = Title(st.presentationMsg[1])
    currScreen = self
    
    if self.missingStars <= 0 then
        self.nextBtn = Button(followMsg, 512, 128, BTNARROW)
        local i = 1
        while st.presentationMsg[i] do
            local pres = st.presentationMsg[i]
            speech.say(pres)
            i = i + 1
        end
    else
        speech.say(st.presentationMsg[1])
        self.mmsg = missingMsg[1]
        if self.missingStars > 1 then
            self.mmsg = string.format(missingMsg[2], self.missingStars)
        end
        speech.say(self.mmsg)
        local i = 1
        while notEnoughStarsMsg[i] do
            speech.say(notEnoughStarsMsg[i])
            i = i + 1
        end
        if showAd then
            self.lastAd = readLocalData("lastAd", 0)
            local t2 = os.time()
            saveLocalData("lastAd", t2)
            self.showAd = os.difftime(t2, self.lastAd) > 30
            if self.showAd then
                self.nextBtn = Button(followMsg, 512, 128)
                -- speech.say(adMsg)
                self.adBtn = Button(earnStarMsg, 512, 256, BTNARROW)
                if initAd then
                    initAd()
                end
            else
                self.nextBtn = Button(followMsg, 512, 128, BTNARROW)
            end
        else
            self.nextBtn = Button(followMsg, 512, 128, BTNARROW)
            self.showAd = false
        end
    end
    self.elapse = ElapsedTime
end

function StageScreen:draw()
    local st = stages[currStage]
    self.bg:draw()
    quitButton:draw()
    self.nextBtn:draw()
    self.title:draw()
    
    pushMatrix()
    pushStyle()
    fill(253, 253, 253, 255)
    local d = 50
    fontSize(30)
    if self.missingStars <= 0 then
        local i = 2
        while st.presentationMsg[i] do
            text(st.presentationMsg[i], 512, 580-i*d)
            i = i + 1
        end
    else
        local totst = string.format(starsMsg, totalStars, st.minStars)
        text(totst, 512, 550)
        local i = 0
        text(self.mmsg, 512, 500-i*d)
        i = i + 1
        while notEnoughStarsMsg[i] do
            text(notEnoughStarsMsg[i], 512, 500-i*d)
            i = i + 1
        end
        if self.showAd and canShowAd() then
            text(adMsg, 512, 500-i*d)
            self.adBtn:draw()
        end
    end
    popStyle()
    popMatrix()
end

function StageScreen:stop()
    speech.stop(true)
    speech.continue()
end

function StageScreen:touched(touch)
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    local max = readLocalData("levelIndex", 1)
    if self.nextBtn:check(t, touch.state) then
        self:stop()
        local st = stages[currStage]
        music.paused = false
        if self.missingStars <= 0 and max >= st.startLevel then
            playScreen:start()
        else
            selectScreen:start()
        end
    end
    
    if self.showAd and self.missingStars > 0  and canShowAd() then
        if self.adBtn:check(t, touch.state) then
            self:stop()
            music.paused = true
            showAd()
            totalStars = totalStars + 1
            saveLocalData("totalStars", totalStars)
            
            -- CHECK IF UNLOCK NEXT LEVEL
            local stars = readLocalData("stars-"..max, 0)
            if stars > 0 then
                if levels[max+1] then
                    local st = getStage(max+1)
                    if totalStars >= st.minStars then
                        saveLocalData("levelIndex", max+1)
                    end
                end
            end
            selectScreen:start()
        end
    end
    
    if quitButton:touched(touch) then
        self:stop()
        music.paused = false
        selectScreen:start()
    end
end
