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
    if not(Super.IsContainsOfThis(mode, {"a", "w", "r"})) then
        error("[file_stream.lua] Mode is incorrect")
    end

    local obj = {}
    if (mode == ("a" or "w")) then
        obj.file = io.open(path, mode)
    end

    setmetatable(obj, self)
    self.__index = self;

    return obj
end