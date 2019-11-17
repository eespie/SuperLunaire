Button = class()

BTNARROW = "BTNARROW"
BTNCHECK = "BTNCHECK"
BTNNONE = "BTNNONE"

function Button:init(label, x, y, buttonType, buttonChecked)
    fontSize(50)
    self.W,self.H = textSize(label)
    self.imgW = 0
    self.label = label
    self.x = x
    self.y = y
    self.buttonType = buttonType or BTNNONE
    self.buttonChecked = buttonChecke
    self.touch = false
    self.elapse = ElapsedTime
end

function Button:setChecked(buttonChecked)
    self.buttonChecked = buttonChecked
end

function Button:isChecked()
    return self.buttonChecked
end

function Button:draw()
    pushStyle()
    fontSize(50)
    if self.touch then
        fill(255, 0, 0, 255)
    else
        fill(255, 255, 255, 255)
    end
    text(self.label, self.x, self.y)
    if self.buttonType == BTNARROW and (ElapsedTime - self.elapse) > 2 then
        self.imgW = imgUIArrowLeft.width
        sprite(imgUIArrowRight, self.x-self.W/2-self.imgW/2, self.y)
    elseif self.buttonType == BTNCHECK then
        if self.buttonChecked then
            self.imgW = imgUIBoxCheck.width+20
           sprite(imgUIBoxCheck, self.x-self.W/2-self.imgW/2, self.y)
        else
            self.imgW = imgUIBox.width+20
           sprite(imgUIBox, self.x-self.W/2-self.imgW/2, self.y)
        end
    end
    popStyle()
end

function Button:check(t, tstate)
       if (ElapsedTime - self.elapse) > 0.5 then
        self.touch = t.x > (self.x-self.W/2-self.imgW/2) and t.x < (self.x+self.W/2) and t.y > (self.y-self.H/2) and t.y < (self.y+self.H/2)
        if self.touch and tstate == ENDED then
            self.touch = false
            return true
        end
    end
    return false
end
