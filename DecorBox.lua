DecorBox = class()

function DecorBox:init(data)
end

function DecorBox:create(data)
    self.data = data
    self.box = createBox(data.x, data.y, data.w, data.h, decorInfo)
    local w = self.data.w
    local h = self.data.h
    self.img = image(w, h)
    self.img.premultiplied = false
    local m = 15
    for x = 1, w do
        for y = 1, h do
            local n = math.floor((noise(x/30,y/30)+1.0)*128)
            local r,g,b,a = n,0,0,n
            if x<m or x>(w-m) or y<m or y>(h-m) then
                local t = math.min(x,y,w-x,h-y)/m
                a = math.min(a,math.floor(t*t*255.0))
            end
            self.img:set(x,y,r,g,b,a)
        end
    end
    
    self.m = mesh()
    self.m.texture = self.img
    self.m:addRect(0, 0, w, h)
    self.m.shader = shader("Effects:Ripple")
    self.m.shader.freq = 0.9
    
    -- cap
    local cw = imgCap.width
    local ch = imgCap.height
    w = math.min(w,h)
    
    -- beam cap
    self.imgCap = image(w, ch)
    pushMatrix()
    setContext(self.imgCap)
    scale(w/cw,1)
    sprite(imgCap,cw/2,ch/2)
    setContext()
    popMatrix()
    
    self.box.type = STATIC
    self.box.restitution = .5
    
    return self.box
end

function DecorBox:draw()
    pushMatrix()
    pushStyle()
    local d = self.data
    translate(self.box.position.x, self.box.position.y)
    self.m.shader.time = ElapsedTime
    self.m:draw()
    if d.w < d.h then
        -- vertical
        sprite(self.imgCap, 0,-(d.h-self.imgCap.height)/2)
        rotate(180)
        sprite(self.imgCap, 0,-(d.h-self.imgCap.height)/2)
    else
        rotate(90)
        sprite(self.imgCap, 0,-(d.w-self.imgCap.width)/2)
        rotate(180)
        sprite(self.imgCap, 0,-(d.w-self.imgCap.width)/2)
    end
    popStyle()
    popMatrix()
end
