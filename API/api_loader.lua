
<<<<<<< HEAD
function load_api(api_table)
    if (type(api_table) == "string") then
        api_table = { api_table } -- Проверка на мб вдруг там одно api
    elseif (type(api_table) == "table") then
        if (#api_table > 0) then
            for i = 1, #api_table do
                if (fs.exists("DifferentOS/API/"..api_table[i]) or fs.exists("DifferentOS/API/"..api_table[i]..".lua")) then -- Два условия для ввода с расширением и без
                    if (string.sub(api_table[i], api_table[i]:len() - 3, api_table[i]:len()) == ".lua") then
                        dofile("DifferentOS/API/"..api_table[i])
                    else
                        dofile("DifferentOS/API/"..api_table[i]..".lua")
                    end
=======
function load_api(table)
    if (type(table) == "string") then
        table = { table }
    elseif (type(table) == "table") then
        if (#table > 0) then
            for i = 1, #table do
                if fs.exists(table[i]) then
                    dofile(shell.dir().."/"..table[i])
>>>>>>> b44c6978a61a1b7a8bf0f7263fd8951c90ebea32
                else
                    error("[api_loader.lua] Incorrect api name")
                end
            end
        else error("[api_loader.lua] Maybe it`s correct api_table, but it have not enumeration") end
    else
        error("[api_loader.lua] Incorrect api_table type")
    end
end