Lander = class()

function Lander:init(x, y, maxSpeed)
    self.id = getId()
    -- print("create lander "..self.id)
    
    self.maxSpeed = maxSpeed
    self.contact = false
    
    self.box = physics.body(POLYGON, unpack(ptsShip))
    self.box.x = x
    self.box.y = y
    self.box.mass = 3
    self.box.interpolate = true
    self.box.restitution = 0
    self.box.sleepingAllowed = false
    self.box.fixedRotation = true
    self.box.bullet = true
    self.box.info = landerInfo*bodyInfo+getId()
    self.box.categories = {2}
    
    self.thrust = false
    self.lthr = false
    self.rthr = false
    self.trails = Trails()
    self.offset = 0
    self.rebound = 0
    self.lastSpeed = 0
    self.lastVelocity = vec2(0,0)
    
    self.cockpit = nil
    self.wing1r = nil
    self.wing1l = nil
    self.wing2r = nil
    self.wing2l = nil
    
    self.explodePos = vec2(self.box.x,self.box.y)
    self.indexExplosion = 1
    self.scaleExplosion = 0.2
    self.scaleExplFactor = 1
    self.burnt = false
    self.burnCount = 0
    self.maxBurn = 2
    
    self:bindEvents()
end

function Lander:clear()
    self.box = removeBody(self.box)
    self.cockpit = removeBody(self.cockpit)
    self.wing1l = removeBody(self.wing1l)
    self.wing1r = removeBody(self.wing1r)
    self.wing2l = removeBody(self.wing2l)
    self.wing2r = removeBody(self.wing2r)
end

function Lander:bindEvents()
    Events.bind("crash", self, self.crash)
    Events.bind("win", self, self.win)
    Events.bind("burning", self, self.burning)
    Events.bind("blackhole", self, self.blackhole)
end

function Lander:preDraw()
    self.gravitationForce = vec2(0,0)
    self.BHFactor = 0
    self.BHCrashPos = nil
end

function Lander:getGravityDistortion()
    return 1+self.BHFactor/500;
end

function Lander:draw()
    if state == "running" then
        self.explodePos.x = self.box.x
        self.explodePos.y = self.box.y
        self.lastSpeed = math.abs(self.box.linearVelocity.y)
        self.lastVelocity = vec2(self.box.linearVelocity.x,self.box.linearVelocity.y)
        self:applyThrust()
        self.box:applyForce(self.gravitationForce)
    end
    
    if state == "running" and self.box.linearVelocity.y < -self.maxSpeed then
        local len = 3
        self.trails:emit(30, 80, vec2((math.random(0,200)-100)/200,len), false)
        self.trails:emit(-30, 80, vec2((math.random(0,200)-100)/200,len), false)
    end
    
    self.trails:update()
    
    pushMatrix()
    
    if state == "running" or state == "starting" then
        pushStyle()
        translate(self.box.x, self.box.y)
        -- rotate(self.box.angle)
        local v = (255*self.burnCount/self.maxBurn)
        sprite(imgShip, 0, 0)
        tint(255, 255, 255, v)
        sprite(imgShipBurnt, 0, 0)
        translate(0,-30)
        popStyle()
        self.trails:draw()
    elseif state == "win" then
        pushStyle()
        translate(self.box.x, self.box.y)
        sprite(imgShipdn, 0, 0)
        translate(0,-self.rebound*math.sin(math.rad(self.offset)))
        sprite(imgShipup, 0, 0)
        local v = (255*self.burnCount/self.maxBurn)
        tint(255, 255, 255, v)
        sprite(imgShipBurnt, 0, 0)
        popStyle()
    elseif state == "crash" then
        self.trails:draw()
        i = math.floor(self.indexExplosion)
        if imgExplosion[i+2] then
            pushMatrix()
            pushStyle()
            translate(self.explodePos.x, self.explodePos.y)
            scale(self.scaleExplosion)
            sprite(imgExplosion[i],0,0)
            sprite(imgExplosion[i+1],0,0)
            sprite(imgExplosion[i+2],0,0)
            popStyle()
            popMatrix()
        end
        if not self.burnt then
            pushMatrix()
            translate(self.cockpit.x, self.cockpit.y)
            rotate(self.cockpit.angle)
            sprite(imgCockpit,0,0)
            popMatrix()
            pushMatrix()
            if self.wing1l.linearVelocity:len() > 20 then
                local dir = vec2(-self.wing1l.linearVelocity.x,-self.wing1l.linearVelocity.y)
                dir = dir:normalize()
                dir = dir+vec2((math.random(0,200)-100)/200,(math.random(0,200)-100)/200)
                self.trails:emit(self.wing1l.x, self.wing1l.y, dir, false)
            end
            translate(self.wing1l.x, self.wing1l.y)
            rotate(self.wing1l.angle)
            scale(-1,1)
            sprite(imgWing1,0,0)
            popMatrix()
            pushMatrix()
            if self.wing1r.linearVelocity:len() > 20 then
                local dir = vec2(-self.wing1r.linearVelocity.x,-self.wing1r.linearVelocity.y)
                dir = dir:normalize()
                dir = dir+vec2((math.random(0,200)-100)/200,(math.random(0,200)-100)/200)
                self.trails:emit(self.wing1r.x, self.wing1r.y, dir, false)
            end
            translate(self.wing1r.x, self.wing1r.y)
            rotate(self.wing1r.angle)
            sprite(imgWing1,0,0)
            popMatrix()
            pushMatrix()
            if self.wing2l.linearVelocity:len() > 20 then
                local dir = vec2(-self.wing2l.linearVelocity.x,-self.wing2l.linearVelocity.y)
                dir = dir:normalize()
                dir = dir+vec2((math.random(0,200)-100)/200,(math.random(0,200)-100)/200)
                self.trails:emit(self.wing2l.x, self.wing2l.y, dir, false)
            end
            translate(self.wing2l.x, self.wing2l.y)
            rotate(self.wing2l.angle)
            sprite(imgWing2,0,0)
            popMatrix()
            pushMatrix()
            if self.wing2r.linearVelocity:len() > 20 then
                local dir = vec2(-self.wing2r.linearVelocity.x,-self.wing2r.linearVelocity.y)
                dir = dir:normalize()
                dir = dir+vec2((math.random(0,200)-100)/200,(math.random(0,200)-100)/200)
                self.trails:emit(self.wing2r.x, self.wing2r.y, dir, false)
            end
            translate(self.wing2r.x, self.wing2r.y)
            rotate(self.wing2r.angle)
            scale(-1,1)
            sprite(imgWing2,0,0)
            popMatrix()
        end
    end
    popMatrix()
end

function Lander:applyThrust()
    if self.thrust then
        self.trails:emit(0, 0, vec2((math.random(0,200)-100)/200,-3), true)
        self.box:applyForce(vec2(0,DeltaTime*(7750-250*difficulty)))
        -- print(DeltaTime*7000)
    end
    if self.rthr then
        self.trails:emit(-57, 30, vec2(-3,(math.random(0,200)-100)/200), true)
        self.box:applyForce(vec2(DeltaTime*3000,0))
    end
    if self.lthr then
        self.trails:emit(57, 30, vec2(3,(math.random(0,200)-100)/200), true)
        self.box:applyForce(vec2(-DeltaTime*3000,0))
    end
    if not self.rthr and not self.lthr then
        self.box:applyForce(vec2(-self.box.linearVelocity.x/3,0))
    end
end

function Lander:touched(touch)
    local rthr = false
    local lthr = false
    if touch.state == BEGAN then
        self.thrust = true
    elseif touch.state == ENDED then
        self.thrust = false
    elseif touch.state == MOVING then
        self.thrust = true
        if (touch.deltaX > 1 and self.rthr) or touch.deltaX > 5 then
            rthr = true
        end
        if (touch.deltaX < -1 and self.lthr) or touch.deltaX < -5 then
            lthr = true
        end
    end
    self.rthr = rthr
    self.lthr = lthr
end

function Lander:win()
    self.rebound = self.lastSpeed/self.maxSpeed*10
    tween(1, self, {offset=180}, tween.easing.cubicOut)
    self.box.active = false
end

function Lander:crash(reason)
    self.trails:clear()
    local x = self.box.x
    local y = self.box.y
    local int1 = math.floor(self.lastSpeed/5)
    self.box:destroy()
    self.box = nil
    
    if self.burnCount > 0 then
        self.burnt = true
    end
    if reason == "blackhole" then
        self.burnt = true
        tween(1, self, {indexExplosion=10, scaleExplosion=0.02})
    else
        tween(1, self, {indexExplosion=10, scaleExplosion=0.5})
    end
    
    self.cockpit = physics.body(POLYGON, unpack(ptsCockpit))
    self.cockpit.x = x
    self.cockpit.y = y
    self.cockpit:applyAngularImpulse(10+math.random(0,int1)/800)
    self.cockpit.linearVelocity= self.lastVelocity
    self.cockpit.restitution = .5
    self.cockpit.categories = {2}
    self.cockpit.mask = {1}
    
    self.wing1l = physics.body(POLYGON, unpack(ptsWing1l))
    self.wing1l.x = x-31
    self.wing1l.y = y+13
    self.wing1l:applyAngularImpulse(10+math.random(0,int1)/800)
    self.wing1l.linearVelocity= self.lastVelocity
    self.wing1l.restitution = .5
    self.wing1l.categories = {2}
    self.wing1l.mask = {1}
    
    self.wing1r = physics.body(POLYGON, unpack(ptsWing1r))
    self.wing1r.x = x+31
    self.wing1r.y = y+13
    self.wing1r:applyAngularImpulse(-10-math.random(0,int1)/800)
    self.wing1r.linearVelocity= self.lastVelocity
    self.wing1r.restitution = .5
    self.wing1r.categories = {2}
    self.wing1r.mask = {1}
    
    self.wing2l = physics.body(POLYGON, unpack(ptsWing2l))
    self.wing2l.x = x-39
    self.wing2l.y = y-15
    self.wing2l:applyAngularImpulse(10+math.random(0,int1)/800)
    self.wing2l.linearVelocity= self.lastVelocity
    self.wing2l.restitution = .5
    self.wing2l.categories = {2}
    self.wing2l.mask = {1}
    
    self.wing2r = physics.body(POLYGON, unpack(ptsWing2r))
    self.wing2r.x = x+39
    self.wing2r.y = y-15
    self.wing2r:applyAngularImpulse(-10-math.random(0,int1)/800)
    self.wing2r.linearVelocity= self.lastVelocity
    self.wing2r.restitution = .5
    self.wing2r.categories = {2}
    self.wing2r.mask = {1}
    
end

function Lander:burning(delta, pos, diam)
    if state == "running" or state == "starting" then
        local d = self.box.position:dist(pos)
        self.burnCount = self.burnCount + delta/d*diam
        if self.burnCount > self.maxBurn then
            Events.trigger("crash", "burnt")
        end
    end
end

function Lander:blackhole(pos, width, collided)
    if state == "running" then
        local d = self.box.position:dist(pos)
        local g = width*width*width/(d*d)
        self.BHFactor = self.BHFactor + g
        local dir = pos - self.box.position
        local f = g / d * dir / 5
        self.gravitationForce = self.gravitationForce + f
    elseif collided then
        self.explodePos = (9*self.explodePos+pos)/10
    end
end

function Lander:collide(contact)
    if getBodyInfo(contact.bodyA) == decorDetectInfo or getBodyInfo(contact.bodyB) == decorDetectInfo then
        return nil
    end
    if getBodyInfo(contact.bodyA) == landerInfo or getBodyInfo(contact.bodyB) == landerInfo then
        if contact.state == BEGAN then
            self.contact = true
        elseif contact.state == ENDED then
            self.contact = false
        end
        if contact.state == BEGAN and state == "running" then
            -- print(math.abs(self.box.linearVelocity:len()))
            if self.lastSpeed > self.maxSpeed then
                Events.trigger("crash")
            end
        end
    end
end
