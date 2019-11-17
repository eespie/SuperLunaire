Slider = class()

function Slider:init(value, x, y, continuous)
    self.continuous = continuous
    self.value = value
    self.x = x
    self.y = y
    self.sz = 350
    self.pts = 10
    self.pos = vec2(self.x-self.sz/2+self.sz/self.pts*self.value, self.y)
end

function Slider:draw()
    pushMatrix()
    pushStyle()
    strokeWidth(3)
    stroke(148, 148, 148, 255)
    line(self.x-self.sz/2, self.y, self.x+self.sz/2, self.y)
    sprite(imgUISliderEnd, self.x-self.sz/2, self.y)
    sprite(imgUISliderEnd, self.x+self.sz/2, self.y)
    sprite(imgUISlider, self.pos.x, self.pos.y)
    popStyle()
    popMatrix()
end

function Slider:touched(touch)
    local ret = false
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    if touch.state == BEGAN then
        self.touch = t:dist(self.pos) < 50
    end
    if touch.state == ENDED then
        ret = self.touch
        self.touch = false
    end
    if self.touch then
        local v = math.floor((t.x - (self.x-self.sz/2))/self.sz*self.pts)
        v = math.max(v, 0)
        v = math.min(v, self.pts)
        self.value = v
        self.pos.x = self.x-self.sz/2+self.sz/self.pts*self.value
    end
    if self.continuous then
        return self.touch
    end
    return ret
end
