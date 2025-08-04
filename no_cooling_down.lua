-- Universal No Cooldown Script (test versiya)
-- Bu barcha LocalScripts'dagi wait() ni olib tashlaydi
for i,v in pairs(getgc(true)) do
    if typeof(v) == "function" and islclosure(v) then
        local info = debug.getinfo(v)
        if info.name and string.find(info.name:lower(), "cooldown") then
            hookfunction(v, function(...)
                return -- hech nima qilmaydi (cooldown yo‘q)
            end)
        end
    end
end
