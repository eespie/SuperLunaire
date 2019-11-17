-- Lunar Lander
-- Use this function to perform your initial setup

function setup()
    scaleY = HEIGHT/768
    scaleX = WIDTH/1024
    migrate()
    lang = readLocalData("lang")
    if not lang then
        if getLang then
            lang = getLang()
        else
            lang = "en"
        end
    end
    if initAd then
        initAd()
    end
    font("SourceSansPro-Bold")
    music("Dropbox:music", true, readLocalData("musicLvl", 5)/10)
    totalStars = readLocalData("totalStars", 0)
    defaultGravity = physics.gravity()

    optionScreen = OptionScreen()
    if lang == "fr" then
        initMsgFr()
    elseif lang == "en" then
        initMsgEn()
    else
        speechOn = false
        speechLvl = 0
        speech.volume = 0
        initMsgEn()
    end
    speech.rate = 0.5
    initLevels()
    
    display = Display()
    playScreen = PlayScreen()
    selectScreen = SelectScreen()
    confirmScreen = ConfirmScreen()
    creditsScreen = CreditsScreen()
    dailyBonusScreen = DailyBonusScreen()
    stageScreen = StageScreen()
    winScreen = WinScreen()
    endGameScreen = EndGameScreen()
    difficultyScreen = DifficultyScreen()
    langScreen = LangScreen()
    quitButton = QuitButton()
    
    state = "idle"
    bodyInfo = 10000
    landerInfo = 1
    targetInfo = 2
    decorInfo = 3
    decorDetectInfo = 4
    lostCount = 0
    currIndex = 1
    currLevel = Level()
    currStage = 1
    currScreen = SplashScreen()
end

-- This function gets called once every frame
function draw()
    pushMatrix()
    scale(scaleX,scaleY)
    currScreen:draw()
    -- display:draw()
    popMatrix()
end

function touched(touch)
    currScreen:touched(touch)
end

function collide(contact)
    if currScreen.collide then
        currScreen:collide(contact)
    end
end
