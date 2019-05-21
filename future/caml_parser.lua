dofile("DifferentOS/API/SText.lua")
dofile("DifferentOS/API/SUtilites.lua")

caml_parser = {}
caml_parser.v = 1
--[[
    Простой парсер для получения объекта сцены
]]

function caml_parser.GetSceneFromFile(file_path)
    if not(fs.exists(file_path)) then
        error("file_path is not correct path")
    end
    local file = fs.open(file_path, "r")
    local string_array = {}
    Super.SetType(string_array, "string_array")
    local line = file.readLine() 
    -- TODO: Что то допиши. Желательно программу
    
end

function caml_parser.GetScene(caml_string_array)
    
end