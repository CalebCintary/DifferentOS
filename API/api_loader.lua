
function load_api(table)
    if (type(table) == "string") then
        table = { table }
    elseif (type(table) == "table") then
        if (#table > 0) then
            for local i = 1, #table do
                if fs.exists(table[i]) then
                    dofile(shell.dir().."/"..table[i])
                else
                    error("[api_loader.lua] ")
                end
            end
        end
    end
end