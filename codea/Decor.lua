Decor = class()

function Decor:init(data)
    self.data = data
    local t = data.t or "box"
    if t == "ship" then
        self.currDecor = DecorShip()
    elseif t == "circle" then
        self.currDecor = DecorPlanet()
    elseif t == "ufo" then
        self.currDecor = DecorUfo()
    elseif t == "sun" then
        self.currDecor = DecorSun()
    elseif t == "blackhole" then
        self.currDecor = DecorBlackHole()
    else
        self.currDecor = DecorBox()
    end
    self.box = self.currDecor:create(self.data)
    
    if data.time then
        if data.wait then
            self.timeout=0
            self.tween = tween(data.wait, self, {timeout=10}, tween.easing.linear, 
                function()
                    self:startTween()
                end)
        else
            self:startTween()
        end
    end
end

function Decor:startTween()
    if self.data.xmax and self.data.ymax then
        self.tween = tween(self.data.time, self.box, {x=self.data.xmax, y=self.data.ymax}, {easing=self.data.easing, loop=self.data.loop})
    end
    if self.data.ymax then
        self.tween = tween(self.data.time, self.box, {y=self.data.ymax}, {easing=self.data.easing, loop=self.data.loop})
    end
    if self.data.xmax then
        self.tween = tween(self.data.time, self.box, {x=self.data.xmax}, {easing=self.data.easing, loop=self.data.loop})
    end
    if self.data.anglemax then
        self.tween = tween(self.data.time, self.currDecor, {currAngle=self.data.anglemax}, {easing=self.data.easing, loop=self.data.loop})
    end
    if self.data.radiusmax then
        self.tween = tween(self.data.time, self.currDecor, {currRadius=self.data.radiusmax}, {easing=self.data.easing, loop=self.data.loop})
    end
end

function Decor:clear()
    if self.tween then
        tween.stop(self.tween)
    end
    self.box= removeBody(self.box)
    if self.currDecor.clear then self.currDecor:clear() end
end

function Decor:draw()
    pushMatrix()
    pushStyle()
    self.currDecor:draw()
    popStyle()
    popMatrix()
end

function Decor:collide(contact)
    if self.currDecor.collide then self.currDecor:collide(contact) end
end

function createBox(x,y,w,h,info)
    -- polygons are defined by a series of points in counter-clockwise order
    local box = physics.body(POLYGON, vec2(-w/2,h/2), vec2(-w/2,-h/2), vec2(w/2,-h/2), vec2(w/2,h/2))
    box.interpolate = true
    box.x = x
    box.y = y
    box.restitution = .1
    box.sleepingAllowed = false
    box.fixedRotation = true
    box.info = info*bodyInfo+getId()
    box.categories = {1}
    box.mask = {2,3,4,5}
    -- display:addBody(box)
    return box
end

function createCircle(x,y,w,info)
    local box = physics.body(CIRCLE, w/2)
    box.interpolate = true
    box.x = x
    box.y = y
    box.restitution = .1
    box.sleepingAllowed = false
    box.fixedRotation = true
    box.info = info*bodyInfo+getId()
    display:addBody(box)
    box.categories = {1}
    box.mask = {2,3,4,5}
    return box
end
