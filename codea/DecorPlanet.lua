DecorPlanet = class()

function DecorPlanet:init()
end

function DecorPlanet:create(data)
    self.data = data
    if data.x then
        self.box = createCircle(data.x, data.y, data.w, decorInfo)
    else
        self.currAngle = data.angle
        self.currRadius = data.radius
        local x = self.data.cx + self.currRadius * math.cos(math.rad(self.currAngle))
        local y = self.data.cy + self.currRadius * math.sin(math.rad(self.currAngle))
        self.box = createCircle(x,y, data.w, decorInfo)
    end
    self.img = image(data.w,data.w)
    local p = imgPlanet[math.random(1,imgPlanetCount)]
    setContext(self.img)
    pushMatrix()
    scale(data.w/p.width)
    sprite(p, p.width/2, p.width/2)
    popMatrix()
    setContext()
    self.box.type = STATIC
    self.box.restitution = .5
    
    return self.box
end

function DecorPlanet:draw()
    pushMatrix()
    pushStyle()
    local d = self.data
    if self.data.cx then
        local x = self.data.cx + self.currRadius * math.cos(math.rad(self.currAngle))
        local y = self.data.cy + self.currRadius * math.sin(math.rad(self.currAngle))
        self.box.x = x
        self.box.y = y
    end
    translate(self.box.position.x, self.box.position.y)
    sprite(self.img, 0,0)
    popStyle()
    popMatrix()
end
