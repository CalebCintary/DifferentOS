Super = {}

function Super.GetType(object)
    local result_type = nil
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
??? ?? nil.
???, ????????, ????????? ??????? fs.open(path, mode).readLine() ????? ?????????? ?????.
?????? ????? ??? ?????????
]]
end



function Super.IsContainsOfThis(object, table) --???????? ????????? ??????? ? ?????? ????????
    if (type(object) == type(table[1])) then
        result = false
        i = 1
        while (result == false) and (i <= #table) do
            if (object == table[i]) then result = true end
            i = i + 1
        end
    else
        error("SuperNotMatchingTypes in IsContainsOfThis function")
    end
    return result
end
