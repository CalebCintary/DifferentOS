Logger = {}
Logger.State = false

Module = {
	Gui = " [GUI] ",
	SText = " [Stext] ",
	Graph = " [Graph] "
}

function Logger.changeState(bool) 
    Logger.State = bool
    local date = "day"..tostring(os.day()).."_time"..textutils.formatTime(os.time())
    Logger.Date = date
end

function Logger.__call(module, string)
    if (Logger.State) then 
    	if (type(module) ~= "boolean") then
    		local mode = "w"
    		local Path = "os/Log/"..Logger.Date..".log"
    		if (fs.exists(Path)) then
    			local mode = "a"
    		end
    		local file = fs.open(Path, mode)
    		file.writeLine("day"..tostring(os.day()).."_time"..textutils.formatTime(os.time())..module..">> "..string)
    		file.close()
    	end
    end
end