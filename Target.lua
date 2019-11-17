Target = class()

function Target:init(data)
    self.x = data.x
    self.y = data.y
    self.w = data.w
    self.h = data.h
    self.box = createBox(data.x,data.y,data.w,data.h,targetInfo)
    self.box.restitution = .2
    self.box.type = STATIC
    self.box.friction = 5
    self.contactCount = 0
    if data.time then
        if data.ymax then
            self.tween = tween(data.time, self.box, {y=data.ymax}, {easing=data.easing, loop=data.loop})
        end
        if data.xmax then
            self.tween = tween(data.time, self.box, {x=data.xmax}, {easing=data.easing, loop=data.loop})
        end
    end
end

function Target:draw()
    pushMatrix()
    pushStyle()
    stroke(47, 109, 31, 255)
    fill(9, 255, 0, 255)
    strokeWidth(5)
    
    rectMode(CENTER)
    rect(self.box.position.x, self.box.position.y, self.w, self.h)
    popStyle()
    popMatrix()
end

function Target:clear()
    if self.tween then
        tween.stop(self.tween)
    end
    self.box = removeBody(self.box)
end

function Target:collide(contact)
    if contact.state == BEGAN and state == "running" then
        if getBodyInfo(contact.bodyA) == targetInfo or getBodyInfo(contact.bodyB) == targetInfo then
            self.contactCount = self.contactCount + 1
            if self.contactCount == 2 then
                Events.trigger("win")
                if self.tween then
                    tween.stop(self.tween)
                    self.tween = nil
                end
            end
        end
    end
    if contact.state == ENDED then
        if getBodyInfo(contact.bodyA) == targetInfo or getBodyInfo(contact.bodyB) == targetInfo then
            self.contactCount = self.contactCount - 1
        end
    end
end
