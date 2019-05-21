Config = {}

function Config:new()
    local obj = {}
        function obj:loadFromFile(filepath)
            file = fs.open(filepath, "r")
            local text = file:readAll()
            
        end
end