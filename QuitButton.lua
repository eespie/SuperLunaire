QuitButton = class()

function QuitButton:init()
    self.size = 64
    self.margin = 5
    self.len = 12
    self.pos = vec2(1024-(self.size/2+self.margin), 768-(self.size/2+self.margin))
    self.touch = false
end

function QuitButton:start()
    self.touch = false
end

function QuitButton:draw()
    pushMatrix()
    pushStyle()
    noStroke()
    if self.touch then
        fill(255, 255, 255, 255)
        stroke(255, 0, 0, 255)        
    else
        fill(255, 0, 0, 255)
        stroke(255, 255, 255, 255)
    end
    ellipse(self.pos.x, self.pos.y, self.size)
    strokeWidth(10)
    line(self.pos.x-self.len, self.pos.y-self.len,self.pos.x+self.len, self.pos.y+self.len)
    line(self.pos.x-self.len, self.pos.y+self.len,self.pos.x+self.len, self.pos.y-self.len)
    popStyle()
    popMatrix() 

end

function QuitButton:touched(touch)
    local t = vec2(touch.x/scaleX, touch.y/scaleY)
    self.touch = t:dist(vec2(self.pos.x, self.pos.y)) < (self.size/2)
    return self.touch and touch.state == ENDED
end
