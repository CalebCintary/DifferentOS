
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
                else
                    error("[api_loader.lua] Incorrect api name")
                end
            end
        else error("[api_loader.lua] Maybe it`s correct api_table, but it have not enumeration") end
    else
        error("[api_loader.lua] Incorrect api_table type")
    end
end