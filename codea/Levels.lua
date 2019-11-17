function initLevels()
    stages = {
    {
    name = nameAthotaMsg,
    presentationMsg = athotaMsg,
    minStars = 0,
    pos = vec2(642, -830),
    angle = 270,
    rotation = 1,
    startLevel = 1,
    endLevel = 8
    },{
    name = nameLaihakoMsg,
    presentationMsg = laihakoMsg,
    minStars = 16,
    pos = vec2(382, -480),
    angle = 270,
    rotation = -1,
    startLevel = 9,
    endLevel = 16
    },{
    name = nameKristalMsg,
    presentationMsg = kristalMsg,
    minStars = 33,
    pos = vec2(662, -130),
    angle = 260,
    rotation = 1,
    startLevel = 17,
    endLevel = 24
    },{
    name = nameTriestienMsg,
    presentationMsg = triestienMsg,
    minStars = 50,
    pos = vec2(352, 220),
    angle = 300,
    rotation = -1,
    startLevel = 25,
    endLevel = 33
    },{
    name = nameLliawMsg,
    presentationMsg = lliawMsg,
    minStars = 70,
    pos = vec2(642, 570),
    angle = 270,
    rotation = 1,
    startLevel = 34,
    endLevel = 41
    },{
    name = nameJekdemilMsg,
    presentationMsg = jekdemilMsg,
    minStars = 100,
    pos = vec2(382, 920),
    angle = 270,
    rotation = -1,
    startLevel = 42,
    endLevel = 49
    },{
    name = nameJoulaikoMsg,
    presentationMsg = joulaikoMsg,
    minStars = 120,
    pos = vec2(642, 1270),
    angle = 270,
    rotation = 1,
    startLevel = 50,
    endLevel = 57
    },{
    name = nameMaristarMsg,
    presentationMsg = maristarMsg,
    minStars = 140,
    pos = vec2(382, 1620),
    angle = 270,
    rotation = -1,
    startLevel = 58,
    endLevel = 65
    }
    }
    
    levels = {
    {
    -- straight down 1
    name = levelMsg.." "..getId(),
    lander = {x=512, y=600},
    target = {x=512, y=10, w=300, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-01",
    stars={1000,5,3}
    },{
    -- Diagonal to the right 2
    name = levelMsg.." "..getId(),
    lander = {x=512-200, y=600},
    target = {x=512+200, y=10, w=300, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-01",
    stars={1000,6,4}
    }
    ,{
    -- Diagonal to the left 3
    name = levelMsg.." "..getId(),
    lander = {x=512+200, y=600},
    target = {x=512-200, y=10, w=300, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-01",
    stars={1000,6,4}
    },{
    -- vertical low 4
    name = levelMsg.." "..getId(),
    lander = {x=512-200, y=600},
    target = {x=512+200, y=10, w=300, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-01",
    stars={1000,7,5},
    decor = {
    {x=512, y=150, w=40, h=300}
    }
    },{
    -- vertical high 5
    name = levelMsg.." "..getId(),
    lander = {x=512-200, y=600},
    target = {x=512+200, y=10, w=300, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-01",
    stars={1000,6,4},
    decor = {
    {x=512, y=550, w=40, h=300}
    }
    },{
    -- tunnel 6
    name = levelMsg.." "..getId(),
    lander = {x=512-200, y=600},
    target = {x=762, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-01",
    stars={1000,8,5},
    decor = {
    {x=642, y=150, w=40, h=300},
    {x=882, y=150, w=40, h=300}
    }
    },{
    -- vertcial up and low 7
    name = levelMsg.." "..getId(),
    lander = {x=250, y=600},
    target = {x=762, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-01",
    stars={1000,10,6},
    decor = {
    {x=642, y=150, w=40, h=300},
    {x=400, y=550, w=40, h=300}
    }
    },{
    -- horizontal middle 8
    name = levelMsg.." "..getId(),
    lander = {x=512, y=600},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-02",
    stars={1000,9,6},
    decor = {
    {x=512, y=350, w=400, h=40}
    }
    },{
    -- horizontal left and right 9
    name = levelMsg.." "..getId(),
    lander = {x=250, y=680},
    target = {x=250, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-02",
    stars={1000,10,6.501},
    decor = {
    {x=300, y=470, w=400, h=40},
    {x=700, y=180, w=400, h=40}
    }
    },{
    -- labyrinth 3 horiz 10
    name = levelMsg.." "..getId(),
    lander = {x=100, y=650},
    target = {x=512, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-02",
    stars={1000,14,9},
    decor = {
    {x=220, y=500, w=400, h=40},
    {x=800, y=500, w=400, h=40},
    {x=512, y=250, w=400, h=40}
    }
    },{
    -- labyrinth 2 horiz 11
    name = levelMsg.." "..getId(),
    lander = {x=100, y=650},
    target = {x=924, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-02",
    stars={1000,18,13},
    decor = {
    {x=400, y=500, w=700, h=40},
    {x=625, y=250, w=700, h=40}
    }
    },{
    -- vertical high and low narrow 12
    name = levelMsg.." "..getId(),
    lander = {x=250, y=600},
    target = {x=762, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-02",
    stars={1000,15,10.501},
    decor = {
    {x=642, y=300, w=40, h=500},
    {x=400, y=480, w=40, h=500}
    }
    },{
    -- labyrinth 3 vert 13
    name = levelMsg.." "..getId(),
    lander = {x=100, y=150},
    target = {x=924, y=530, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-02",
    stars={1000,16,14},
    decor = {
    {x=250, y=300, w=40, h=500},
    {x=525, y=480, w=40, h=500},
    {x=800, y=300, w=40, h=500}
    }
    },{
    -- labyrinth 4 vert 14
    name = levelMsg.." "..getId(),
    lander = {x=100, y=650},
    target = {x=924, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-02",
    stars={1000,24,20},
    decor = {
    {x=200, y=480, w=40, h=500},
    {x=400, y=300, w=40, h=500},
    {x=600, y=480, w=40, h=500},
    {x=800, y=300, w=40, h=500}
    }
    },{
    -- labyrinth 2 horiz + 2 vert 15
    name = levelMsg.." "..getId(),
    lander = {x=200, y=650},
    target = {x=924, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-02",
    stars={1000,18,15},
    decor = {
    {x=200, y=500, w=300, h=40},
    {x=380, y=250, w=300, h=40},
    {x=575, y=530, w=40, h=400},
    {x=800, y=300, w=40, h=400}
    }
    },{
    -- labyrinth 16
    name = levelMsg.." "..getId(),
    lander = {x=100, y=100},
    target = {x=924, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-02",
    stars={1000,30,20},
    decor = {
    {x=200, y=350, w=40, h=500},
    {x=290, y=570, w=120, h=40},
    {x=290, y=130, w=120, h=40},
    {x=450, y=370, w=120, h=40},
    {x=520, y=430, w=40, h=500},
    {x=600, y=650, w=120, h=40},
    {x=600, y=200, w=120, h=40},
    {x=760, y=450, w=120, h=40},
    {x=830, y=350, w=40, h=500},
    }
    },{
    -- cloud center 17
    name = levelMsg.." "..getId(),
    lander = {x=512, y=600},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-01",
    stars={1000,7,5},
    decor = {
    {x=512, y=350, w=300, t="circle"}
    }
    },{
    -- clouds center + 4 corners 18
    name = levelMsg.." "..getId(),
    lander = {x=512, y=650},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-01",
    stars={1000,8,5.5},
    decor = {
    {x=512, y=350, w=300, t="circle"},
    {x=150, y=0, w=300, t="circle"},
    {x=874, y=0, w=300, t="circle"},
    {x=150, y=768, w=300, t="circle"},
    {x=874, y=768, w=300, t="circle"}
    }
    },{
    -- Planets 19
    name = levelMsg.." "..getId(),
    lander = {x=150, y=650},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-01",
    stars={1000,12,9},
    decor = {
    {x=350, y=600, w=150, t="circle"},
    {x=280, y=150, w=200, t="circle"},
    {x=700, y=400, w=200, t="circle"},
    {x=550, y=300, w=200, t="circle"},
    {x=900, y=130, w=150, t="circle"}
    }
    },{
    -- Planets 20
    name = levelMsg.." "..getId(),
    lander = {x=950, y=150},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-01",
    stars={1000,15,11.5},
    decor = {
    {x=470, y=680, w=150, t="circle"},
    {x=280, y=380, w=200, t="circle"},
    {x=750, y=450, w=200, t="circle"},
    {x=550, y=300, w=200, t="circle"},
    {x=750, y=130, w=150, t="circle"}
    }
    },{
    -- Planets 21
    name = levelMsg.." "..getId(),
    lander = {x=150, y=150},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-01",
    stars={1000,15,12},
    decor = {
    {x=100, y=350, w=120, t="circle"},
    {x=150, y=680, w=120, t="circle"},
    {x=400, y=200, w=180, t="circle"},
    {x=390, y=470, w=120, t="circle"},
    {x=550, y=350, w=120, t="circle"},
    {x=600, y=680, w=120, t="circle"},
    {x=710, y=350, w=120, t="circle"},
    {x=800, y=480, w=120, t="circle"},
    {x=880, y=100, w=120, t="circle"}
    }
    },{
    -- Planets 22
    name = levelMsg.." "..getId(),
    lander = {x=150, y=100},
    target = {x=160, y=400, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-01",
    stars={1000,16,12},
    decor = {
    {x=150, y=680, w=120, t="circle"},
    {x=160, y=320, w=120, t="circle"},
    {x=350, y=275, w=120, t="circle"},
    {x=440, y=630, w=120, t="circle"},
    {x=510, y=360, w=120, t="circle"},
    {x=600, y=80, w=120, t="circle"},
    {x=710, y=410, w=120, t="circle"},
    {x=890, y=150, w=120, t="circle"},
    {x=910, y=670, w=120, t="circle"}
    }
    },{
    -- Planets 23
    name = levelMsg.." "..getId(),
    lander = {x=750, y=90},
    target = {x=130, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-01",
    stars={1000,16,12},
    decor = {
    {x=275, y=470, w=200, t="circle"},
    {x=615, y=380, w=200, t="circle"},
    {x=250, y=270, w=120, t="circle"},
    {x=320, y=130, w=120, t="circle"},
    {x=510, y=700, w=120, t="circle"},
    {x=600, y=70, w=120, t="circle"},
    {x=890, y=160, w=120, t="circle"},
    {x=935, y=450, w=120, t="circle"},
    {x=910, y=670, w=120, t="circle"}
    }
    },{
    -- Planets 24
    name = levelMsg.." "..getId(),
    lander = {x=100, y=530},
    target = {x=130, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-01",
    stars={1000,20,15},
    decor = {
    {x=280, y=470, w=200, t="circle"},
    {x=500, y=390, w=200, t="circle"},
    {x=110, y=340, w=120, t="circle"},
    {x=320, y=120, w=120, t="circle"},
    {x=510, y=700, w=120, t="circle"},
    {x=680, y=480, w=120, t="circle"},
    {x=670, y=100, w=120, t="circle"},
    {x=790, y=350, w=120, t="circle"},
    {x=910, y=670, w=120, t="circle"}
    }
    },{
    -- vertical moving 25
    name = levelMsg.." "..getId(),
    lander = {x=512-200, y=600},
    target = {x=512+200, y=10, w=300, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-03",
    stars={1000,6,4},
    decor = {
    {x=512, y=150, w=40, h=300, t="box", time=5, ymax=618, loop=tween.loop.pingpong, easing=tween.easing.linear}
    }
    },{
    -- horizontal moving 26
    name = levelMsg.." "..getId(),
    lander = {x=512, y=600},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-03",
    stars={1000,5,3},
    decor = {
    {x=200, y=350, w=400, h=40, t="box", time=5, xmax=824, loop=tween.loop.pingpong, easing=tween.easing.linear}
    }
    },{
    -- 2 vertical moving opposite ways 27
    name = levelMsg.." "..getId(),
    lander = {x=250, y=600},
    target = {x=762, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-03",
    stars={1000,6,4},
    decor = {
    {x=642, y=150, w=40, h=300, t="box", time=5, ymax=550, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=400, y=550, w=40, h=300, t="box", time=5, ymax=150, loop=tween.loop.pingpong, easing=tween.easing.linear}
    }
    },{
    -- 2 vertical moving same way 28
    name = levelMsg.." "..getId(),
    lander = {x=512-200, y=600},
    target = {x=762, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-03",
    stars={1000,6,4},
    decor = {
    {x=642, y=150, w=40, h=300, t="box", time=5, ymax=550, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=882, y=150, w=40, h=300, t="box", time=5, ymax=550, loop=tween.loop.pingpong, easing=tween.easing.linear}
    }
    },{
    -- moving labyrinth 3 vert + 2 horiz 29
    name = levelMsg.." "..getId(),
    lander = {x=100, y=650},
    target = {x=924, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-03",
    stars={1000,16,13},
    decor = {
    {x=250, y=250, w=40, h=400, t="box", time=5, ymax=500, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=525, y=500, w=40, h=400, t="box", time=5, ymax=250, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=800, y=250, w=40, h=400, t="box", time=5, ymax=500, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=300, y=500, w=500, h=40, t="box", time=5, xmax=725, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=725, y=250, w=500, h=40, t="box", time=5, xmax=300, loop=tween.loop.pingpong, easing=tween.easing.linear}
    }
    },{
    -- Moving target 30
    name = levelMsg.." "..getId(),
    lander = {x=512, y=600},
    target = {x=300, y=10, w=200, h=20, time=5, xmax=724, loop=tween.loop.pingpong, easing=tween.easing.linear},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-03",
    stars={1000,6,4}
    },{
    -- horizontal left and right + Moving target 31
    name = levelMsg.." "..getId(),
    lander = {x=250, y=680},
    target = {x=250, y=10, w=150, h=20, time=5, xmax=774, loop=tween.loop.pingpong, easing=tween.easing.linear},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-03",
    stars={1000,9,6.5},
    decor = {
    {x=300, y=500, w=400, h=40},
    {x=700, y=250, w=400, h=40}
    }
    },{
    -- labyrinth 3 vert + Moving target 32
    name = levelMsg.." "..getId(),
    lander = {x=100, y=150},
    target = {x=924, y=530, w=200, h=20, time=5, ymax=10, loop=tween.loop.pingpong, easing=tween.easing.linear},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-03",
    stars={1000,18,15},
    decor = {
    {x=250, y=300, w=40, h=500},
    {x=525, y=480, w=40, h=500},
    {x=800, y=300, w=40, h=500}
    }
    },{
    -- moving labyrinth 3 vert + 2 horiz + Moving target 33
    name = levelMsg.." "..getId(),
    lander = {x=100, y=650},
    target = {x=924, y=10, w=150, h=20, time=5, xmax=100, loop=tween.loop.pingpong, easing=tween.easing.linear},
    maxSpeed = 200,
    bg="Dropbox:starfield-trn-03",
    stars={1000,6,4},
    decor = {
    {x=250, y=250, w=40, h=400, t="box", time=5, ymax=500, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=525, y=500, w=40, h=400, t="box", time=5, ymax=250, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=800, y=250, w=40, h=400, t="box", time=5, ymax=500, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=300, y=500, w=500, h=40, t="box", time=5, xmax=725, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=725, y=250, w=500, h=40, t="box", time=5, xmax=300, loop=tween.loop.pingpong, easing=tween.easing.linear}
    }
    },{
    -- moving clouds center + 4 corners + Moving target 34
    name = levelMsg.." "..getId(),
    lander = {x=512, y=650},
    target = {x=400, y=10, w=180, h=20, time=2, xmax=624, loop=tween.loop.pingpong, easing=tween.easing.linear},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-06",
    stars={1000,8,5},
    decor = {
    {x=512, y=350, w=300, t="circle"},
    {x=150, y=150, w=300, t="circle", time=5, ymax=0, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=874, y=0, w=300, t="circle", time=5, ymax=150, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=150, y=618, w=300, t="circle", time=5, ymax=768, loop=tween.loop.pingpong, easing=tween.easing.linear},
    {x=874, y=768, w=300, t="circle", time=5, ymax=618, loop=tween.loop.pingpong, easing=tween.easing.linear}
    }
    },{
    -- moving planet towards the ship 35
    name = levelMsg.." "..getId(),
    lander = {x=512, y=650},
    target = {x=512, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-06",
    stars={1000,8,4.1},
    decor = {
    {x=512, y=100, w=200, t="circle", time=8, ymax=900, easing=tween.easing.linear}
    }
    },{
    -- moving planet horizontal 36
    name = levelMsg.." "..getId(),
    lander = {x=512, y=768-100},
    target = {x=512, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-06",
    stars={1000,8,3},
    decor = {
    {x=-110, y=384, w=150, t="circle", time=8, xmax=1024+110, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=384, w=150, t="circle", time=4, xmax=1024+110, loop=tween.loop.once, easing=tween.easing.linear},
    {x=-110, y=384, w=150, t="circle", time=8, xmax=1024+110, wait=4, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    },{
    -- moving planet horizontal 2 lines 37
    name = levelMsg.." "..getId(),
    lander = {x=512, y=768-100},
    target = {x=512, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-06",
    stars={1000,8,3},
    decor = {
    {x=-75, y=768*2/3, w=150, t="circle", time=6, xmax=1024+75, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=768*2/3, w=150, t="circle", time=3, xmax=1024+75, loop=tween.loop.once, easing=tween.easing.linear},
    {x=-75, y=768*2/3, w=150, t="circle", time=6, xmax=1024+75, wait=3, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=1024+75, y=768/3, w=150, t="circle", time=6, xmax=-75, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=768/3, w=150, t="circle", time=3, xmax=-75, loop=tween.loop.once, easing=tween.easing.linear},
    {x=1024+75, y=768/3, w=150, t="circle", time=6, xmax=-75, wait=3, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    },{
    -- moving planet 38
    name = levelMsg.." "..getId(),
    lander = {x=150, y=768-100},
    target = {x=1024-250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-06",
    stars={1000,8,5},
    decor = {
    {cx=1024+75, cy=-75, w=100, t="circle", time=6, radius=768, angle=180, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=-75, w=100, t="circle", time=6, radius=768+300, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=-75, w=100, t="circle", time=6, radius=768-300, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    },{
    -- moving planet 39
    name = levelMsg.." "..getId(),
    lander = {x=150, y=768-100},
    target = {x=512, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-06",
    stars={1000,8,6},
    decor = {
    {cx=512, cy=-75, w=100, t="circle", time=5, radius=300, angle=0, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=768/3, w=150, t="circle", time=2.5, xmax=-75, loop=tween.loop.once, easing=tween.easing.linear},
    {x=1024+75, y=768/3, w=150, t="circle", time=4, xmax=-75, wait=2.5, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=-75, cy=-75, w=100, t="circle", time=5, radius=450, angle=0, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=-75, w=100, t="circle", time=5, radius=450, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=150, y=390, w=200, t="circle"},
    {x=850, y=390, w=200, t="circle"}
    }
    },{
    -- moving planet 40
    name = levelMsg.." "..getId(),
    lander = {x=150, y=768-100},
    target = {x=1024-250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-06",
    stars={1000,10,7},
    decor = {
    {cx=1024+75, cy=-75, w=150, t="circle", time=4, radius=450, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=768+75, w=150, t="circle", time=4, radius=450, wait=1, angle=180, anglemax=270, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=-75, cy=-75, w=150, t="circle", time=4, radius=450, angle=0, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=-75, cy=768+75, w=150, t="circle", time=4, radius=450, wait=1, angle=270, anglemax=360, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=384, w=200, t="circle"}
    }
    },{
    -- moving planet 41
    name = levelMsg.." "..getId(),
    lander = {x=150, y=768-100},
    target = {x=1024-250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-06",
    stars={1000,8,6},
    decor = {
    {cx=512, cy=384, w=150, t="circle", time=10, radius=450, angle=0, anglemax=360, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=512, cy=384, w=150, t="circle", time=10, radius=450, angle=180, anglemax=540, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=512, cy=384, w=150, t="circle", time=10, radius=250, angle=450, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=512, cy=384, w=150, t="circle", time=10, radius=250, angle=270, anglemax=-90, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=384, w=200, t="circle"}
    }
    },{
    -- moving planet 42
    name = levelMsg.." "..getId(),
    lander = {x=1024-150, y=768-100},
    target = {x=250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-07",
    stars={1000,10,6.1},
    decor = {
    {cx=512, cy=384, w=90, t="ufo", time=10, radius=100, angle=0, anglemax=360, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=812, cy=384, w=90, t="ufo", time=9, radius=100, angle=180, anglemax=540, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=212, cy=284, w=90, t="ufo", time=10, radius=100, angle=450, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=512, cy=384, w=90, t="ufo", time=9, radius=250, angle=270, anglemax=-90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=612, cy=184, w=90, t="ufo", time=8, radius=100, angle=450, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    }
    },{
    -- moving ships 43
    name = levelMsg.." "..getId(),
    lander = {x=150, y=768-100},
    target = {x=1024-250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-07",
    stars={1000,8,5},
    decor = {
    {x=512, y=384, w=200, t="circle"},
    {x=-75, y=384, rot=-90, t="ship", xmax=1024+75, time=6, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=1024+75, y=-75, rot=45, t="ship", xmax=-75, ymax=768+75, time=5, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=850, rot=150, t="ship", xmax=150, ymax=-75, time=5, wait=1, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=-75, rot=-30, t="ship", xmax=950, ymax=850, time=5, wait=2, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    },{
    -- Planets 44
    name = levelMsg.." "..getId(),
    lander = {x=150, y=650},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-07",
    stars={1000,10,8.501},
    decor = {
    {x=50, y=-75, rot=-45, t="ship", xmax=1100, ymax=750, time=5, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=-75, rot=-45, t="ship", xmax=1100, ymax=750, time=5, wait=2, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=280, y=150, w=200, t="circle"},
    {x=700, y=440, w=200, t="circle"},
    {x=550, y=330, w=200, t="circle"}
    }
    },{
    -- clouds center + 4 corners 45
    name = levelMsg.." "..getId(),
    lander = {x=512, y=650},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-07",
    stars={1000,8,5.5},
    decor = {
    {x=150, y=0, rot=-45, t="ship", xmax=874, ymax=768, time=4, wait=2, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=874, y=0, rot=45, t="ship", xmax=150, ymax=768, time=4, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=350, w=300, t="circle"},
    {x=150, y=0, w=300, t="circle"},
    {x=874, y=0, w=300, t="circle"},
    {x=150, y=768, w=300, t="circle"},
    {x=874, y=768, w=300, t="circle"}
    }
    },{
    -- clouds center + 4 corners 46
    name = levelMsg.." "..getId(),
    lander = {x=512, y=650},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-07",
    stars={1000,8,5.5},
    decor = {
    {x=-75, y=384, rot=-90, t="ship", xmax=1100, time=4, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=-75, rot=0, t="ship", ymax=850, time=4, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=350, w=300, t="circle"},
    {x=150, y=0, w=300, t="circle"},
    {x=874, y=0, w=300, t="circle"},
    {x=150, y=768, w=300, t="circle"},
    {x=874, y=768, w=300, t="circle"}
    }
    },{
    -- moving planet 47
    name = levelMsg.." "..getId(),
    lander = {x=150, y=768-100},
    target = {x=1024-250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-07",
    stars={1000,10,6},
    decor = {
    {cx=1024+75, cy=-75, w=100, t="circle", time=6, radius=768, angle=180, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=-75, w=100, t="circle", time=6, radius=768+300, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=-75, w=100, t="circle", time=6, radius=768-300, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=-75, y=384, rot=-90, t="ship", xmax=1100, time=4, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=-75, rot=-45, t="ship", xmax=1100, ymax=750, time=5, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=-75, rot=-45, t="ship", xmax=1100, ymax=750, time=5, wait=2, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=850, rot=-135, t="ship", xmax=1100, ymax=0, time=5, wait=1, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    },{
    -- moving planet 48
    name = levelMsg.." "..getId(),
    lander = {x=512, y=768-100},
    target = {x=1024-250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-07",
    stars={1000,10,5},
    decor = {
    {x=512, y=384, rot=-90, t="ship", xmax=1100, time=4, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=384, rot=45, t="ship", xmax=0, ymax=850, time=4, wait=1, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=384, rot=90, t="ship", xmax=-100, time=4, wait=2, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=384, rot=0, t="ship", ymax=850, time=4, wait=2, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=384, rot=-135, t="ship", xmax=1000, ymax=-75, time=4, wait=1, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=384, w=300, t="circle"}
    }
    },{
    -- moving planet 49
    name = levelMsg.." "..getId(),
    lander = {x=150, y=768-100},
    target = {x=1024-250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-07",
    stars={1000,12,7},
    decor = {
    {cx=1024+75, cy=-75, w=90, t="ufo", time=6, radius=450, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=768+75, w=90, t="ufo", time=6, radius=450, wait=1, angle=180, anglemax=270, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=-75, cy=-75, w=90, t="ufo", time=6, radius=450, angle=0, wait=1, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=-75, cy=768+75, w=90, t="ufo", time=6, radius=450, angle=270, wait=1, anglemax=360, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=384, w=200, t="circle"},
    {x=-75, y=384, rot=-90, t="ship", xmax=1100, time=6, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=-75, rot=-45, t="ship", xmax=1100, ymax=750, time=6, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=-75, rot=-45, t="ship", xmax=1100, ymax=750, time=6, wait=2, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=850, rot=-135, t="ship", xmax=1100, ymax=0, time=6, wait=1, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    },{
    -- sun center 50
    name = levelMsg.." "..getId(),
    lander = {x=512, y=700},
    target = {x=512, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-02",
    stars={1000,8,5},
    decor = {
    {x=512, y=350, w=180, t="sun"}
    }
    },{
    -- sun 51
    name = levelMsg.." "..getId(),
    lander = {x=150, y=700},
    target = {x=512, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-02",
    stars={1000,10,6},
    decor = {
    {x=350, y=400, w=200, t="sun"},
    {x=150, y=100, w=200, t="sun"},
    }
    },{
    -- sun 52
    name = levelMsg.." "..getId(),
    lander = {x=950, y=700},
    target = {x=150, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-02",
    stars={1000,12,7.501},
    decor = {
    {x=650, y=550, w=160, t="sun"},
    {x=350, y=150, w=160, t="sun"},
    }
    },{
    -- sun 53
    name = levelMsg.." "..getId(),
    lander = {x=950, y=700},
    target = {x=150, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-02",
    stars={1000,10,5},
    decor = {
    {x=650, y=-400, t="sun", w=160, ymax=1170, time=4, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=350, y=1170, t="sun", w=160, ymax=-400, time=4, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=-400, y=900, t="sun", w=160, ymax=-400, xmax=850, time=4, loop=tween.loop.forever, easing=tween.easing.linear},
    }
    },{
    -- sun 54
    name = levelMsg.." "..getId(),
    lander = {x=950, y=700},
    target = {x=200, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-02",
    stars={1000,12,7},
    decor = {
    {x=650, y=650, w=160, t="sun"},
    {x=450, y=100, w=250, t="sun"},
    {x=50, y=-75, rot=-45, t="ship", xmax=900, ymax=800, time=6, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=850, rot=-135, t="ship", xmax=1100, ymax=0, time=6, wait=1, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    },{
    -- sun 55
    name = levelMsg.." "..getId(),
    lander = {x=950, y=700},
    target = {x=200, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-02",
    stars={1000,12,7},
    decor = {
    {cx=1024+75, cy=-75, w=150, t="sun", time=6, radius=768, angle=180, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=-75, w=150, t="sun", time=6, radius=768+300, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=-75, w=150, t="sun", time=6, radius=768-300, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},   
    }
    },{
    -- sun 56
    name = levelMsg.." "..getId(),
    lander = {x=900, y=120},
    target = {x=170, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-02",
    stars={1000,12,8},
    decor = {
    {x=350, y=150, w=160, t="sun"},
    {cx=1024+75, cy=800, w=150, t="sun", time=6, radius=900, angle=170, anglemax=270, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=830, w=150, t="sun", time=4, radius=400, angle=160, anglemax=270, wait=2, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=-200, y=650, t="sun", w=100, xmax=1200, time=8, wait=1, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    },{
    -- sun 57
    name = levelMsg.." "..getId(),
    lander = {x=150, y=700},
    target = {x=350, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-02",
    stars={1000,12,8},
    decor = {
    {x=150, y=300, w=160, t="sun"},
    {x=500, y=430, w=150, t="sun"},
    {x=700, y=400, w=60, t="sun"},
    {x=1100, y=700, rot=90, t="ship", xmax=-50, time=6, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=960, y=-50, rot=0, t="ship", ymax=800, time=6, wait=1, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=350, y=-50, rot=0, t="ship", ymax=800, time=6, wait=2, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=-50, y=80, rot=-90, t="ship", xmax=1100, time=8, wait=4, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    },{
    -- sun center 58
    name = levelMsg.." "..getId(),
    lander = {x=512, y=700},
    target = {x=512, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-08",
    stars={1000,10,5.501},
    decor = {
    {x=512, y=350, w=250, t="blackhole"}
    }
    },{
    -- bh 59
    name = levelMsg.." "..getId(),
    lander = {x=950, y=700},
    target = {x=150, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-08",
    stars={1000,10,7},
    decor = {
    {x=650, y=550, w=250, t="blackhole"},
    {x=350, y=150, w=230, t="blackhole"},
    }
    },{
    -- moving bh 60
    name = levelMsg.." "..getId(),
    lander = {x=150, y=768-100},
    target = {x=1024-250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-08",
    stars={1000,20,10},
    decor = {
    {x=512, y=384, w=200, t="sun"},
    {cx=1024+75, cy=-75, w=200, t="blackhole", time=4, radius=450, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=768+75, w=200, t="blackhole", time=4, radius=450, wait=2, angle=160, anglemax=270, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=-75, cy=-75, w=200, t="blackhole", time=4, radius=450, angle=0, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=-75, cy=768+75, w=200, t="blackhole", time=4, radius=450, wait=1, angle=250, anglemax=360, loop=tween.loop.forever, easing=tween.easing.linear},
    }
    },{
    -- moving bh 61
    name = levelMsg.." "..getId(),
    lander = {x=1024-150, y=768-100},
    target = {x=250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-08",
    stars={1000,10,5},
    decor = {
    {cx=512, cy=384, w=150, t="blackhole", time=10, radius=100, angle=0, anglemax=360, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=812, cy=384, w=120, t="blackhole", time=9, radius=100, angle=180, anglemax=540, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=212, cy=284, w=120, t="blackhole", time=10, radius=100, angle=450, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=512, cy=384, w=150, t="blackhole", time=9, radius=250, angle=270, anglemax=-90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=612, cy=184, w=120, t="blackhole", time=8, radius=100, angle=450, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    }
    },{
    -- bh center + 4 corners 62
    name = levelMsg.." "..getId(),
    lander = {x=512, y=650},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-08",
    stars={1000,20,10},
    decor = {
    {x=512, y=350, w=300, t="blackhole"},
    {x=150, y=0, w=250, t="blackhole"},
    {x=874, y=0, w=250, t="blackhole"},
    {x=150, y=768, w=250, t="blackhole"},
    {x=874, y=768, w=250, t="blackhole"}
    }
    },{
    -- bh 63
    name = levelMsg.." "..getId(),
    lander = {x=950, y=700},
    target = {x=200, y=10, w=150, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-08",
    stars={1000,15,9.501},
    decor = {
    {cx=1024+75, cy=-75, w=200, t="blackhole", time=6, radius=768, angle=180, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=-75, w=200, t="blackhole", time=6, radius=768+300, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=-75, w=200, t="blackhole", time=6, radius=768-300, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},   
    }
    },{
    -- moving bh 64
    name = levelMsg.." "..getId(),
    lander = {x=150, y=768-100},
    -- lander = {x=1024-250, y=80},
    target = {x=1024-250, y=10, w=180, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-08",
    stars={1000,15,10},
    decor = {
    {cx=1024+75, cy=-75, w=90, t="blackhole", time=6, radius=450, angle=90, anglemax=180, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=1024+75, cy=768+75, w=90, t="blackhole", time=6, radius=450, wait=1, angle=180, anglemax=270, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=-75, cy=-75, w=90, t="blackhole", time=6, radius=450, angle=0, wait=1, anglemax=90, loop=tween.loop.forever, easing=tween.easing.linear},
    {cx=-75, cy=768+75, w=90, t="blackhole", time=6, radius=450, angle=270, wait=1, anglemax=360, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=512, y=384, w=200, t="blackhole"},
    {x=-75, y=384, w=100, t="blackhole", xmax=1100, time=6, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=-75, w=100, t="blackhole", xmax=1100, ymax=750, time=6, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=-75, w=100, t="blackhole", xmax=1100, ymax=750, time=6, wait=2, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=50, y=850, w=100, t="blackhole", xmax=1100, ymax=0, time=6, wait=1, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    },{
    -- bh 65
    name = levelMsg.." "..getId(),
    lander = {x=150, y=650},
    -- lander = {x=512, y=80},
    target = {x=512, y=10, w=200, h=20},
    maxSpeed = 200,
    bg="Dropbox:starfield-ee-08",
    stars={1000,20,10},
    decor = {
    {x=350, y=600, w=150, t="blackhole"},
    {x=280, y=150, w=150, t="blackhole"},
    {x=700, y=400, w=150, t="blackhole"},
    {x=450, y=300, w=150, t="blackhole"},
    {x=900, y=130, w=150, t="blackhole"},
    {x=-100, y=130, rot=-55, t="ship", xmax=1000, ymax=800, time=8, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=500, y=800, rot=-135, t="ship", xmax=1100, ymax=300, time=8, loop=tween.loop.forever, easing=tween.easing.linear},
    {x=1100, y=500, rot=135, t="ship", xmax=400, ymax=-60, time=8, loop=tween.loop.forever, easing=tween.easing.linear}
    }
    }
    
    }
end