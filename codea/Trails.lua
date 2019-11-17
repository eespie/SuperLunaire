Trails = class()

function Trails:init()
    -- Initialising our bubble emitter
    self.bubbles = {}
    self.maxbubbles = 100
    self.bubblecount = 0
end

function Trails:clear()
    self.bubbles = {}
    self.bubblecount = 0
end

function Trails:emit(x, y, speed, isFire)
    -- Make sure we don't emit more than maxbubbles
    self.x = x
    self.y = y
    if self.bubblecount < self.maxbubbles then
        local dir = speed
        local size = math.random(2, 10)
        local life = math.random(10, math.floor(15 + 0.3 * speed:len()))
        local bubble = {pos = vec2(self.x, self.y),
                        dir = dir,
                        size = size,
                        life = life,
                        isFire = isFire}
        
        -- Bubbles have the following properties
        --  dir: direction
        --  size: size of the bubble
        --  life: how many frames the bubble lives
        --  pos: the initial position of the bubble 
        --   (all bubbles start at the emitter position)
        
        -- Add the bubble to our table of bubbles
        table.insert(self.bubbles, bubble)

        -- Keep track of how many bubbles we have
        self.bubblecount = self.bubblecount + 1
    end
end

-- This function updates all the bubbles in the system
function Trails:update()
    -- Loop through bubbles
    for k,v in pairs(self.bubbles) do
        -- Add direction of bubble to its
        --  position, to generate new position
        v.pos = v.pos + v.dir
        
        -- Subtract one from its life
        v.life = v.life - 1
        
        -- If this bubble's life is 0
        if v.life == 0 then
            -- Remove it from the tablep
            self.bubbles[k] = nil
            
            -- Reduce our bubble count
            --  (we can emit more now!)
            self.bubblecount = self.bubblecount - 1
        end
    end
end

-- This function draws all the bubbles in the system
function Trails:draw()
    -- Store current style
    pushStyle()
    
    -- Set up our bubble style
    ellipseMode(CENTER)
    strokeWidth(4)

    stroke(255, 229, 0, 255)
    fill(255, 0, 2, 100)
    local prev = true
    
    -- Loop through bubbles and draw them
    for k,v in pairs(self.bubbles) do
        if v.isFire and not prev then
            stroke(255, 229, 0, 255)
            fill(255, 0, 2, 100)
            prev = true
        end
        if not v.isFire and prev then
            stroke(255, 255, 255, 255)
            fill(255, 255, 255, 100)
            prev = false          
        end
        ellipse(v.pos.x, v.pos.y, v.size)
    end
    
    -- Restore original style
    popStyle()
end

