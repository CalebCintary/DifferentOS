Super = {}

function Super.GetType(object)
    if (type(object) == "table") then
        if (object.object_type ~= nil) then
            local result_type = object.object_type
        else
            local result_type = type({})
        end
    else
        local result_type = type(object)
    end
    return result_type
end

function Super.SetType(object, type)
    object.object_type = type
end

function Super.GetUndefindedValue()
    --[[
        Это не nil.
        Это, например, результат функции fs.open(path, mode).readLine() когда закончился текст.
        Тоесть нужен для сравнения
    ]]
end