-- Data.codea

imgEmptyStar = readImage("Cargo Bot:Star Empty")
imgFilledStar = readImage("Cargo Bot:Star Filled")
imgWhiteStar = readImage("Cargo Bot:Star")


imgShip = readImage("Dropbox:spaceship-ee")
imgShipup = readImage("Dropbox:spaceship-ee-up")
imgShipdn = readImage("Dropbox:spaceship-ee-down")
imgShipBurnt = readImage("Dropbox:spaceship-ee-bunrt")

ptsShip = {vec2(-37,-50),vec2(-13,-29),vec2(0,-35),vec2(12,-29),vec2(36,-50),
vec2(56,-7),vec2(56,1),vec2(28,49),vec2(-29,49),vec2(-57,1),vec2(-57,-7)}

imgCockpit = readImage("Dropbox:cockpitBlue_6")
imgWing1 = readImage("Dropbox:wingYellow_3")
imgWing2 = readImage("Dropbox:wingYellow_1")

ptsCockpit = {vec2(0,-33), vec2(17,-24),vec2(20,6),vec2(8,33),vec2(-8,33),
vec2(-20,6),vec2(-19,-24)}
ptsWing1r = {vec2(25,-37),vec2(12,-9),vec2(20,37),vec2(2,37),vec2(-25,-11),
vec2(-25,-20),vec2(-8,-20),vec2(12,-37)}
ptsWing1l = {vec2(-12,-37),vec2(8,-20),vec2(25,-20),vec2(25,-11),vec2(-2,37),
vec2(-20,37),vec2(-12,-9), vec2(-25,-37)}
ptsWing2r = {vec2(-2,-36),vec2(18,7),vec2(-11,36),vec2(-18,36),vec2(-5,7),
vec2(-15,-3),vec2(-15,-25)}
ptsWing2l = {vec2(2,-36),vec2(15,-25),vec2(15,-3),vec2(5,7),vec2(18,36),
vec2(11,36),vec2(-18,7)}

imgCap = readImage("Dropbox:engine2")

imgExplosion = {}
for i = 0, 8 do
    local name = string.format("Dropbox:explosion%02d", i)
    local img = readImage(name)
    table.insert(imgExplosion, img)    
end

imgPlanetCount = 19
imgPlanet = {}
for i = 1, imgPlanetCount do
    local name = string.format("Dropbox:planete-%02d-b", i)
    local img = readImage(name)
    table.insert(imgPlanet, img)    
end

imgSun = {
{img=readImage("Dropbox:sun-01"), tint=color(255, 213, 0, 255)},
{img=readImage("Dropbox:sun-02"), tint=color(255, 0, 17, 255)},
{img=readImage("Dropbox:sun-03"), tint=color(120, 165, 225, 255)},
{img=readImage("Dropbox:sun-04"), tint=color(164, 117, 24, 255)},
{img=readImage("Dropbox:sun-05"), tint=color(255, 235, 0, 255)},
{img=readImage("Dropbox:sun-06"), tint=color(255, 214, 0, 255)},
{img=readImage("Dropbox:sun-07"), tint=color(118, 144, 226, 255)},
{img=readImage("Dropbox:sun-08"), tint=color(255, 0, 17, 255)},
}
imgSunCount = 8
imgCorona = readImage("Dropbox:sun-corona-white")
imgBlackhole = readImage("Dropbox:blackhole-corona")

imgPlanetSplash1 = readImage("Dropbox:planete-09")
imgPlanetSplash2 = readImage("Dropbox:planete-05")

imgPlanetSelect = {}
for i = 1, 8 do
    local name = string.format("Dropbox:planete-select-%02d", i)
    local img = readImage(name)
    table.insert(imgPlanetSelect, img)    
end

ptsOtherShip = {{vec2(9,-31),vec2(48,-27),vec2(50,6),vec2(13,10),vec2(9,37),
vec2(-9,37),vec2(-13,10),vec2(-50,6),vec2(-48,-24),vec2(-9,-37)},
{vec2(12,-36),vec2(37,-34),vec2(55,-6),vec2(9,21),vec2(3,37),
vec2(-3,37),vec2(-9,21),vec2(-55,-6),vec2(-37,-34),vec2(-12,-36)},
{vec2(13,-36),vec2(21,-28),vec2(48,-28),vec2(48,-22),vec2(9,24),vec2(3,38),
vec2(-3,38),vec2(-9,24),vec2(-48,-22),vec2(-48,-28),vec2(-21,-28),vec2(-13,-36)}
}

imgOtherShip = {}
for i = 1, 3 do
    imgOtherShip[i] = {}
    for j = 1, 4 do
        local name = string.format("Dropbox:ship%d_%d",i,j)
        imgOtherShip[i][j] = readImage(name)
    end
end

imgUfo = {}
for i = 1, 4 do
    local name = string.format("Dropbox:ufo%d",i)
    imgUfo[i] = readImage(name)
end

imgTuto = {
readImage("Dropbox:hand-gesture-03"),
readImage("Dropbox:hand-gesture-05")
}

imgUIBox = readImage("Dropbox:ui-box")
imgUIBoxCheck = readImage("Dropbox:ui-boxCheckmark")
imgUISlider = readImage("Dropbox:ui-sliderDown")
imgUISliderEnd = readImage("Dropbox:ui-sliderEnd")
imgUIArrowLeft = readImage("Dropbox:ui-arrowLeft")
imgUIArrowRight = readImage("Dropbox:ui-arrowRight")
imgUIGear = readImage("Dropbox:ui-gear2")
