DecorShip = class()

function DecorShip:init()
end

function DecorShip:create(data)
    self.data = data
    self.iShip = math.random(1,3)
    self.iColor = math.random(1,4)
    self.box = physics.body(POLYGON, unpack(ptsOtherShip[self.iShip]))
    self.box.x = data.x
    self.box.y = data.y
    self.box.angle = data.rot
    self.box.categories = {1}
    self.box.mask = {2,3,4,5}
    self.box.info = decorInfo*bodyInfo+getId()
    self.box.type = STATIC
    self.box.restitution = .5
    
    self.trails = Trails()
    return self.box
end

function DecorShip:draw()
    pushMatrix()
    pushStyle()
    self.trails:update()
    self.trails:emit(0, -30, vec2((math.random(0,200)-100)/200,-3), true)
    translate(self.box.x, self.box.y)
    rotate(self.box.angle)
    self.trails:draw()
    sprite(imgOtherShip[self.iShip][self.iColor], 0, 0)
    popStyle()
    popMatrix()
end
