Title = class()

function Title:init(label)
    self.label = label
end

function Title:draw()
    pushStyle()
    fontSize(50)
    fill(255, 255, 255, 255)
    text(self.label, 512, 640)
    popStyle()
end
