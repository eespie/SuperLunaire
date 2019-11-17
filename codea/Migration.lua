-- migration.codea

function migrate()
    for i=1,65 do
        local best = readLocalData("best-Level "..i)
        if best then saveLocalData("best-"..i, best) end
        best = readLocalData("best-Niveau "..i)
        if best then saveLocalData("best-"..i, best) end
        saveLocalData("best-Level "..i, nil)
        saveLocalData("best-Niveau "..i, nil)
        
        local stars = readLocalData("stars-Level "..i)
        if stars then saveLocalData("stars-"..i, stars) end
        local stars = readLocalData("stars-Niveau "..i)
        if stars then saveLocalData("stars-"..i, stars) end
        saveLocalData("stars-Level "..i, nil)
        saveLocalData("stars-Niveau "..i, nil)
    end
end
