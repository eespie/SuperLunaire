-- MessagesEn.codea

function initMsgEn()
    
    titleMsg = "Super Lunar"
    
    crashMsg = {"Too bad...",
    "Houston, we have a problem",
    "We have lost the contact with the ship",
    "The ship will go to the junkyard"}
    altMsg = {"Keep the faith",
    "Hold on!",
    "It's almost that",
    "You can do it!",
    "Use the force! Luke",
    "Keep trying",
    "don't give up!"}
    winMsg = {"Mooning succeded",
    "Very good!",
    "Was easy, no?",
    "yet another level succeeded",
    "Impressive!",
    "The mission is a success",
    "Fantastic!",
    "Bravo!",
    "Well done!"}
    
    playMsg = "Play!"
    levelMsg = "Level"
    nextMsg = "Next level"
    replayMsg = "Play again"
    newRecordMsg = "New record !"
    timeMsg = "Time: %s"
    recordMsg = "Best: %s"
    followMsg = "Next"
    starsMsg = "Stars : %d/%d"
    notEnoughStarsMsg = {
    "You need to pass the levels quicker."}
    missingMsg = {"Only one star is missing.", "%d stars are missing."}
    adMsg = "View an add to earn a star."
    earnStarMsg = "Earn a new star!"
    winthelevelMsg = "Win the level"
        
    -- TUTORIAL
    tutoMsg = {
    {"Land the ship on the platform.","Do not arrive too fast.",
    "Press your finger on the screen to slow down the descent."},
    {"slide to move the ship."}
    }
    
    -- OPTION SCREEN
    optionMsg = "Options"
    speechMsg = "Vocalisation"
    musicMsg =  "Music"
    sfxMsg =    "SFX"
    resetMsg = "Clear scores"
    
    difficultyMsg = "Difficulty level"
    difficultyInfoMsg = "Changing the difficulty level will reset the score"
    difficultLevelMsg = {
    "   Easy   ",
    "Normal",
    "   Hard   "
    }
    
    langMsg = "Choose language"
    langInfoMsg = "Select language"
    langSelectMsg ={
    {display="English",lang="en"},
    {display="Français",lang="fr"},
    }

    okMsg = "Ok"
    cancelMsg = "Cancel"
    
    -- CONFIRM SCREEN
    confirmTitleMsg = "Are you sure?"
    confirmExplMsg = "All stored data will be erased."
    confirmCancelMsg = "Cancel"
    confirmOkMsg = "Ok, clear the scores"
    
    -- CREDIT SCREEN
    creditMsg = "Crédits"
    creditLineMsg = {
    "Program: Eric Espié", "",
    "Music: Devils deep inside - K4MMERER", "",
    "Gesture images: design by Freepik.com", ""
    }
    
    -- END GAME
    endGameMsg = "Congratulation! You finished all the levels"
    
    endGameLineMsg = {
    "But it's not over.",
    "You have the power to change the future!",
    "Express your feelings about the game and share it!",
    "By rating the game you will allow the future evolutions and levels."
    }
    
    endGameActionMsg = "Rate the game"
    
    welcomeBackMsg = {
    "Super Bonus day %d return",
    "Welcome back bonus"
    }
    
    nameAthotaMsg = "Athota"
    athotaMsg = {
    "Athota training center",
    "Welcome, You will start here your pilot training.",
    "You will learn how to land your ship.",
    "Follow the instructions."
    }
    
    nameLaihakoMsg = "Laihako"
    laihakoMsg = {
    "Laihako starship pilot school",
    "To become a true pilot,",
    "you'll have to master the ship commands."
    }
    
    nameKristalMsg = "Kristal"
    kristalMsg = {
    "Kristal planet",
    "We've got a mission for you.",
    "Go to the kristal planet.",
    "Watch the obstacles on the route."
    }
    
    nameTriestienMsg = "Triestien"
    triestienMsg = {
    "Triestien advanced pilot center",
    "Time to go on serious game.",
    "Only the best pilots are admitted in this training center."
    }
    
    nameLliawMsg = "Lliaw"
    lliawMsg = {
    "Lliaw planet",
    "Lliaw planet surroundings are a little chaotic.",
    "Watch the moving objects."
    }
    
    nameJekdemilMsg = "Jekdemil"
    jekdemilMsg = {
    "Jekdemil planet",
    "Jekdemil planet is an overcrowded destination.",
    "Watch the other ships."
    }
    
    nameJoulaikoMsg = "Julayko"
    joulaikoMsg = {
    "Julayko planet",
    "Julayko planet is surrounded by numerous stars.",
    "Watch the sun rays..."
    }
    
    nameMaristarMsg = "Maristar"
    maristarMsg = {
    "Maristar planet",
    "Maristar planet is full of mistery.",
    "It is surrounded by black holes.",
    "Beware, the gravity could be modified."
    }
end
