
--[[
    TODO: Сделать объект gui контролирующий дебаг
    FIXME: Расставь наконец коментарии. Сам не понимаешь что пишешь
]]

Container = {}

local function extended(child, parent)
    setmetatable(child, {__index = parent})
end

--[[
setmetatable(obj, self)
self.__index = self; return obj    
--]]

