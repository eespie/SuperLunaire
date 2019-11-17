CreditsScreen = class()

function CreditsScreen:init()
    self.bg = Background("Dropbox:starfield-ee-04")
end

function CreditsScreen:start()
    self.title = Title(creditMsg)
    fontSize(30)
    local w, h = textSize("w")
    local offset = 300
    self.count = Table.size(creditLineMsg)
    local c = self.count+1
    self.pos = {}
    for i = 1, self.count do
        table.insert(self.pos, vec2(512, 768-offset))
        offset = offset + h
    end
    quitButton:start()
    currScreen = self
end

function CreditsScreen:draw()
    self.bg:draw()
    quitButton:draw()
    self.title:draw()
    pushStyle()
    fill(255)
    fontSize(30)
    for i = 1, self.count do
        text(creditLineMsg[i], self.pos[i].x, self.pos[i].y)
    end
    popStyle()
end

function CreditsScreen:touched(touch)
    if quitButton:touched(touch) then
        selectScreen:start()
    end
end
