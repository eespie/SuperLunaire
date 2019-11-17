-- Common.codea

-- App Id 1027133124

supportedOrientations(LANDSCAPE_ANY)
displayMode(FULLSCREEN_NO_BUTTONS)
-- displayMode(FULLSCREEN)
globalId = 0
adCount = 0
screenMargin = vec2(88,66)

function getId()
    globalId = globalId + 1
    return globalId
end

function resetId()
    globalId = 0
end

function getBodyInfo(body)
    if body and body.info then
        return math.floor(body.info/bodyInfo)
    end
    return 0
end

function formatTime(time)
    local tm = ""
    if time < 0 then 
        tm = "-"
        time = -time+1
    end
    
    local minute = math.floor(time/60)
    tm = tm..string.format("%02d:", minute)
    time = time - minute * 60
    
    local seconde = math.floor(time)
    tm = tm..string.format("%02d:", seconde)
    
    local tenth = math.floor((time - math.floor(time)) * 100)
    tm = tm..string.format("%02d", tenth)
    
    return tm
end

function removeBody(body)
    if body then
        body.active = false
        body:destroy()
    end
    return nil
end

function daysFrom(t)
    local currDate = os.date("*t")
    local prevDate = os.date("*t", t)
    local d = currDate.yday - prevDate.yday
    if d < -363 then
        return 1
    end
    if d < 0 then
        return 365+d
    end
    return d
end
