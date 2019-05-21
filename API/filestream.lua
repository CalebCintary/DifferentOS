dofile("DifferentOS/API/api_loader.lua")
load_api({"SUtilites"})
file_stream = {}


function file_stream:new(path, mode)
    --Path error handler
    if (fs.exists(path)) then
        if (fs.isDir(path)) then
            error("FileIsNotReadableException > "..path)
        end
    else
        error("FileIsNotExistsException > "..path)
    end
    --Mode error handler
<<<<<<< HEAD
    if not(Super.IsContainsOfThis(mode, {"a", "w", "r"})) then
        error("[file_stream.lua] Mode is incorrect")
    end

    local obj = {}
    if (mode == ("a" or "w")) then
        obj.file = io.open(path, mode)
    end

    setmetatable(obj, self)
    self.__index = self;
=======
    --if Super.
>>>>>>> b44c6978a61a1b7a8bf0f7263fd8951c90ebea32

    return obj
end