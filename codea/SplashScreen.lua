SplashScreen = class()

function SplashScreen:init()
    self.bg = Background("Dropbox:starfield-ee-01")

    fontSize(150)
    fill(255, 255, 255, 255)
    local w, h = textSize(titleMsg)
    local timg = image(w, h)
    setContext(timg)
    text(titleMsg, w / 2, h / 2)
    setContext()
    
    self.m = mesh()
    self.m.texture = timg
    self.m:addRect(1024 / 2, 768 / 2, w, h)
    self.m.shader = shader("Effects:Ripple")
    self.m.shader.freq = 0.06
    
    self.titleSaid = false
    self.shipStarted = false
    self.shipSlide = false
    self.pos = vec2(1024/4, 768+100)
    self.tween = nil
    self.trails = Trails()
end

function SplashScreen:draw()
    if ElapsedTime>1 and not self.titleSaid then
        if speechOn then speech.say(titleMsg) end
        self.titleSaid = true
    end
    if not self.shipStarted then
        self.tween = tween(2, self.pos, {y=768*2/3})
        self.shipStarted = true
    end
    if not self.shipSlide and ElapsedTime>2 then
        self.tween = tween(3,self.pos, {y=-100, x=1024*3/4})
        self.shipSlide = true
    end
    if ElapsedTime>5 then
        self:out()
    end
    self.bg:draw()
    sprite(imgPlanetSplash1, 200, 0)
    sprite(imgPlanetSplash2, 800, 768-200)
        
    if self.shipStarted then
        self.trails:update()
        pushMatrix()
        translate(self.pos.x, self.pos.y)
        sprite(imgShip,0,0)
        self.trails:emit(0, -30, vec2((math.random(0,200)-100)/200,-3), true)
        if self.shipSlide then
            self.trails:emit(-57, 0, vec2(-3,(math.random(0,200)-100)/200), true)
        end
        self.trails:draw()
        popMatrix()
    end
    self.m.shader.time = ElapsedTime
    self.m:draw()
    
end

function SplashScreen:touched(touch)
    if touch.state == ENDED then
        self:out()
    end
end

function SplashScreen:out()
    -- dailyBonusScreen:start()
    if totalStars == 0 then
        langScreen:start()
    else
        selectScreen:start()
    end
end
