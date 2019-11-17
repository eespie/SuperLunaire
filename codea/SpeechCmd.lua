SpeechCmd = class()

function SpeechCmd:init()
    self.sp = {}
end

function SpeechCmd:add(spdlist)
    for _,spdesc in ipairs(spdlist) do
        if spdesc and spdesc.cmd then
            local sp = speech(spdesc.msg)
            if spdesc.rate then sp.rate = spdesc.rate end
            if spdesc.preDelay then sp.preDelay = spdesc.preDelay end
            table.insert(self.sp, sp)
        end
    end
end

function SpeechCmd:say()
    for _,sp in ipairs(self.sp) do
        speech.say(sp)
    end
    self.sp = {}
end

function SpeechCmd:stop()
    speech.stop()
end
