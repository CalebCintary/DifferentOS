Logger = {}
Logger.State = false

function Logger.changeState(bool) 
    Logger.State = bool
end
function Logger.__call(module, string)
    --TODO: [СРАЗУ] Дописать логер
    local file = fs.open
end