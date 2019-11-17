Background = class()

function Background:init(imgName)
    self.img = readImage(imgName)
    self.pos = vec2(512,384)
    self.szx = self.img.width
    self.szy = self.img.height
end


function Background:draw()
    pushMatrix()
    pushStyle()
    spriteMode(CENTER)
    local p = self.pos + vec2(RotationRate.y/2, RotationRate.x/2)
    local mx = (self.szx-1024)/2
    local my = (self.szy-768)/2
    if p.x < 512-mx then p.x = 512-mx end
    if p.x > 512+mx then p.x = 512+mx end
    if p.y < 384-my then p.y = 384-my end
    if p.y > 384+my then p.y = 384+my end
    self.pos = p
    sprite(self.img,p.x, p.y)
    popStyle()
    popMatrix()
end

function Background:getImgSz()
    return vec2(self.szx, self.szy)
end

