local os_path = ""
local file = fs.open("/os_path.txt", "r")
os_path = file.readAll()
file.close()

function service_func()
    local list = fs.list(os_path.."/services")
    local i = 0
    local j = 1
    local service_full_path_list = {}
    for i = 1, #list do --Отбор служб
        if (fs.isDir(os_path.."/services/"..list[i])) then
            service_full_path_list[j] = os_path.."/services/"..list[i]
            j = j + 1
        end
    end
    list.__mode = "v"
    
    local file = fs.open(os_path.."/tmp/service_starter.lua", "w")
    file.write("parallel.waitForAll(")
    for i, k in ipairs(service_full_path_list) do
        if (i < #service_full_path_list) then
            file.write("dofile(\""..k.."/main.lua\"), ")
        else
            file.write("dofile(\""..k.."/main.lua\"))")
        end
    end
    file.close()
    dofile(os_path.."/tmp/service_starter.lua")
end

function main()
    
end

parallel.waitForAll(service_func, main)