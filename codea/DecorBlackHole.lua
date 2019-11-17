DecorBlackHole = class()

function DecorBlackHole:init()
end

function DecorBlackHole:create(data)
    self.data = data
    if data.x then
        self.box = createCircle(data.x, data.y, data.w, decorDetectInfo)
    else
        self.currAngle = data.angle
        self.currRadius = data.radius
        local x = self.data.cx + self.currRadius * math.cos(math.rad(self.currAngle))
        local y = self.data.cy + self.currRadius * math.sin(math.rad(self.currAngle))
        self.box = createCircle(x,y, data.w, decorDetectInfo)
    end
    self.box.type = STATIC
    self.box.restitution = .5
    self.collided = false
    local size = 1.153*data.w
    self.img = image(size,size)
    setContext(self.img)
    pushMatrix()
    scale(size/imgBlackhole.width)
    sprite(imgBlackhole, imgBlackhole.width/2, imgBlackhole.width/2)
    popMatrix()
    setContext()

    self.m = mesh()
    self.m.texture = self.img
    self.m:addRect(0, 0, size, size)
    self.m.shader = shader("Effects:Swirl")
    self.m.shader.radius = size/2
    self.m.shader.texSize = vec2(size,size)
    
    self.offset = ElapsedTime+math.random(1,1000)/1000

    return self.box
end

function DecorBlackHole:draw()
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
    fill(0, 0, 0, 255)
    stroke(104, 104, 104, 255)
    strokeWidth(2)
    ellipseMode(CENTER)
    self.m.shader.angle = ElapsedTime-self.offset
    self.offset = self.offset + (RotationRate.x+RotationRate.y)/10
    -- self.m.shader.angle = self.offset
    self.m:draw()
    ellipse(0,0,self.data.w)
    popStyle()
    popMatrix()
    Events.trigger("blackhole", self.box.position, self.data.w, self.collided)
end

function DecorBlackHole:collide(contact)
    if contact.bodyA == self.box or contact.bodyB == self.box then
        if state == "running" or state == "starting" then
            Events.trigger("crash", "blackhole")
            self.collided = true
        end
    end
end
