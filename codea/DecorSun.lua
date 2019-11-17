DecorSun = class()

function DecorSun:init()
end

function DecorSun:create(data)
    self.data = data
    if data.x then
        self.box = createCircle(data.x, data.y, data.w, decorInfo)
        self.cbox = createCircle(data.x, data.y, data.w*2.5, decorDetectInfo)
    else
        self.currAngle = data.angle
        self.currRadius = data.radius
        local x = self.data.cx + self.currRadius * math.cos(math.rad(self.currAngle))
        local y = self.data.cy + self.currRadius * math.sin(math.rad(self.currAngle))
        self.box = createCircle(x,y, data.w, decorInfo)
        self.cbox = createCircle(x,y, data.w*2.5, decorDetectInfo)
    end
    self.box.type = STATIC
    self.box.restitution = .5
    self.cbox.type = STATIC
    self.cbox.sensor = true

    self.img = image(data.w,data.w)
    local p = imgSun[math.random(1,imgSunCount)]
    self.tint = p.tint
    setContext(self.img)
    pushMatrix()
    scale(data.w/p.img.width)
    sprite(p.img, p.img.width/2, p.img.width/2)
    popMatrix()
    setContext()
    
    self.corona = image(data.w*2.5, data.w*2.5)
    setContext(self.corona)
    pushMatrix()
    scale(data.w*2.5/imgCorona.width)
    sprite(imgCorona, imgCorona.width/2, imgCorona.width/2)
    popMatrix()
    setContext()    
    self.burning = false
    
    return self.box
end

function DecorSun:clear()
    self.cbox= removeBody(self.cbox)
end

function DecorSun:draw()
    pushMatrix()
    pushStyle()
    local d = self.data
    if self.data.cx then
        local x = self.data.cx + self.currRadius * math.cos(math.rad(self.currAngle))
        local y = self.data.cy + self.currRadius * math.sin(math.rad(self.currAngle))
        self.box.x = x
        self.box.y = y
        self.cbox.x = x
        self.cbox.y = y
    else
        self.cbox.x = self.box.position.x
        self.cbox.y = self.box.position.y
    end
    translate(self.box.position.x, self.box.position.y)
    pushStyle()
    tint(self.tint)
    sprite(self.corona,0,0)
    popStyle()

    sprite(self.img, 0,0)
    popStyle()
    popMatrix()
    if self.burning then
        Events.trigger("burning", DeltaTime, self.box.position, self.data.w)
    end
end

function DecorSun:collide(contact)
    if contact.bodyA == self.cbox or contact.bodyB == self.cbox then
        if contact.state == ENDED then
            self.burning = false
        else
            self.burning = true
        end
    end
end
