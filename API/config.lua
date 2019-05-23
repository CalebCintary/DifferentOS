Config = {}

function Config:new(path)
    local obj = {}

    if path then -- Создание конфиг объекта из файла, если он был указан
        if fs.exists(path) then
            local file = fs.open(path, "r")
            obj = textutils.unserialize(file.readAll())
            file.close()
            obj.loaded__cfgpath = path
            function obj:Save()
                local file = fs.open(self.loaded__cfgpath, "w")
                self.loaded__cfgpath = nil
                file.write(textutils.serialize(self))
                file.close()
            end
        end
    end
    --Возвращает свойство из конфиг объекта */гуманный способ/*
    function obj:GetProperty(Property)
        if Property then
            if self[Property] ~= nil then
                return self[Property]
            else
                error("Property is not defined")
            end
        else
            error("Property hadn`t written")
        end
    end
    --Устанавливает свойство в конфиг объект */гуманный способ again/*
    function obj:SetProperty(Property, value)
        if (Property) and (value) then
            self[Property] = value
        end
    end

    function obj:SaveAs(path)
        local file = fs.open(self.loaded__cfgpath, "r")
        self.loaded__cfgpath = nil
        file.write(textutils.serialize(self))
        file.close()
    end

    function obj:Close()
        self.__mode = 'v'
        collectgarbage("collect")
    end

    setmetatable(obj, self)
    obj.__index = self; return obj
end