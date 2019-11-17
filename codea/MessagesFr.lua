-- MessagesFr.codea

function initMsgFr()
    
    titleMsg = "Super Lunaire"
    
    crashMsg = {"Dommage...",
    "Houston, nous avons un problème",
    "Le contact avec le vaisseau a été perdu",
    "Le vaisseau est bon pour la casse"}
    altMsg = {"Il faut persévérer",
    "Courage !",
    "C'est presque ça",
    "Encore un effort",
    "Continuez !"}
    winMsg = {"Alunissage réussi",
    "Bien !",
    "Trop facile", 
    "Encore un niveau réussi",
    "Impressionnant !",
    "La mission est un succès",
    "Fantastique !",
    "Bravo !",
    "Super !"}
    
    playMsg = "Jouer !"
    levelMsg = "Niveau"
    nextMsg = "Niveau suivant"
    replayMsg = "Rejouer"
    newRecordMsg = "Nouveau record !"
    timeMsg = "Temps : %s"
    recordMsg = "Record : %s"
    followMsg = "Suivant"
    starsMsg = "Étoiles : %d/%d"
    notEnoughStarsMsg = {
    "Il faut améliorer votre niveau.",
    "Repassez les niveaux précédents plus rapidement."}
    missingMsg = {"il vous manque une étoile.", "il vous manque %d étoiles."}
    adMsg = "Vous pouvez visionner une publicité pour gagner une étoile."
    earnStarMsg = "Gagner une étoile !"
    winthelevelMsg = "Gagner le niveau"
    
    -- TUTORIAL
    tutoMsg = {
    {"Posez le vaisseau sur la plateforme.","N'arrivez pas trop vite.","Appuyez sur l'écran pour allumer les rétrofusées et ralentir."},
    {"Glissez votre doigt latéralement pour déplacer le vaisseau."}
    }
    
    -- OPTION SCREEN
    optionMsg = "Options"
    speechMsg = "Vocalisation"
    musicMsg =  "Musique"
    sfxMsg =    "Effets sonores"
    resetMsg = "Effacer les scores"
    
    -- CONFIRM SCREEN
    confirmTitleMsg = "Êtes-vous sûr ?"
    confirmExplMsg = "Toutes les donnés sauvegardée vont être perdues."
    confirmCancelMsg = "Annuler"
    confirmOkMsg = "Oui, effacer les scores"
    
    -- CREDIT SCREEN
    creditMsg = "Crédits"
    creditLineMsg = {
    "Programmation : Eric Espié", "",
    "Musique : Devils deep inside - K4MMERER", "",
    "Images tutoriel : design by Freepik.com", ""
    }
    
    okMsg = "Ok"
    cancelMsg = "Annuler"
    
    -- END GAME
    endGameMsg = "Bravo ! Vous avez terminé tous les niveaux"
    
    endGameLineMsg = {
    "Mais ce n'est pas fini.",
    "Vous avez le pouvoir de changer l'avenir !",
    "En notant le jeu, vous ferez en sorte que",
    "le jeu évolue et s'enrichisse de nouveaux niveaux."
    }
    
    endGameActionMsg = "Noter le jeu"
    
    difficultyMsg = "Niveau de difficulté"
    difficultyInfoMsg = "Changer le niveau de difficulté remet le score à zéro"
    difficultLevelMsg = {
    "  Facile  ",
    "Normal",
    "Difficile"
    }
        
    langMsg = "Choisir la langue"
    langInfoMsg = "Selectionnez une langue"
    langSelectMsg ={
    {display="English",lang="en"},
    {display="Français",lang="fr"},
    }

    welcomeBackMsg = {
    "Super Bonus %dème jour",
    "Bonus de retour"
    }
    
    nameAthotaMsg = "Athota"
    athotaMsg = {
    "Centre d'entrainement d'Athota",
    "Bienvenue, ici commence votre entrainement de pilote.",
    "Vous allez apprendre à poser votre vaisseau.",
    "Suivez bien les instructions."
    }
    
    nameLaihakoMsg = "Laihako"
    laihakoMsg = {
    "École de pilotage de Laihako",
    "Pour devenir un vrai pilote,",
    "il faudra savoir bien maitriser votre vaisseau."
    }
    
    nameKristalMsg = "Kristal"
    kristalMsg = {
    "Planète Kristal",
    "Nous avons une mission pour vous.",
    "Rejoignez la planète Kristal pour la ravitailler.",
    "Faites attention aux obstacles en cours de route."
    }
    
    nameTriestienMsg = "Triestien"
    triestienMsg = {
    "Centre de pilotage avancé de Triestien",
    "Il est temps de passer aux choses sérieuses.",
    "Seuls les meilleurs pilotes accèdent à ce centre d'entrainement."
    }
    
    nameLliawMsg = "Lliaw"
    lliawMsg = {
    "Planète Lliaw",
    "La planète Lliaw est un peu chaotique.",
    "Faites attention aux obstacles en mouvement."
    }
    
    nameJekdemilMsg = "Jekdemil"
    jekdemilMsg = {
    "Planète Jekdemil",
    "La planète Jekdemil est une destination très appréciée.",
    "Faites attention aux nombreux vaisseaux que vous allez croiser."
    }
    
    nameJoulaikoMsg = "Joulaïko"
    joulaikoMsg = {
    "Planète Joulaïko",
    "La planète Joulaïko est entourée de nombreux soleils.",
    "Attention aux rayonnement..."
    }
    
    nameMaristarMsg = "Maristar"
    maristarMsg = {
    "Planète Maristar",
    "Maristar est une planète pleine de mystères.",
    "Elle est entourée de trous noirs.",
    "Attention la gravité peut être modifiée à proximité."
    }
end
