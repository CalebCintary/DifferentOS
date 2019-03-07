dofile("/os/API/graph.lua")

--[[
    TODO: Сделать объект gui контролирующий дебаг
    TODO: Сделать в TextBlock VerticalAlignment
    FIXME: Расставь наконец коментарии. Сам не понимаешь что пишешь
]]

Container = {}

local function extended(child, parent)
    setmetatable(child, {__index = parent})
end

function Container:new(x, y, width, height)
    local obj = {}
        obj.localX = x 
        obj.localY = y 
        obj.height = height
        obj.width = width
        obj.BackgroundColor = colors.white
        obj.isVisible = true
        obj.Children = {}
        obj.isFullscreen = false
        obj.Parent = nil
        

    function obj:addChild(child)
        table.insert(self.Children, child)
        child:setParent(self)
    end

    function obj:setParent(parent)
        self.Parent = parent
    end

    function obj:Redraw()
        if (self.isVisible) then
            local x2 = obj.globalX + width - 1
            local y2 = obj.globalY + height - 1
            Graph.FilledBox(self.globalX, self.globalY, x2, y2, self.BackgroundColor)
            if (#self.Children > 0) then
                for i = 1, #self.Children do 
                    self.Children[i]:Redraw()
                end
            end
        end
    end

    function obj:Resize(width, height)
        self.height = height
        self.width = width
    end

    function obj:Move(x, y)
        self.localX = x
        self.localY = y
        self:CalculateNewGlobalCoordinates()
    end

    function obj:setVisible(bool)
        self.isVisible = bool
    end

    function obj:becomeFullsize()
        if (self.Parent ~= nil) then
            self.globalX = self.Parent.globalX
            self.globalY = self.Parent.globalY
            self.localX = 1
            self.localY = 1
            self.width = self.Parent.width
            self.height = self.Parent.height
        else
            local sizex, sizey = term.getSize()
            self.globalX = 1
            self.globalY = 1
            self.localX = 1
            self.localY = 1
            self.width = sizex
            self.height = sizey
        end
    end

    function obj:CalculateNewGlobalCoordinates()
        if self.isFullscreen then
            self.globalX = 1
            self.globalY = 1
        else
            if (self.Parent ~= nil) then
                self.globalX = self.Parent.globalX + self.localX - 1
                self.globalY = self.Parent.globalY + self.localY - 1
            else
                self.globalX = self.localX
                self.globalY = self.localY
            end
        end
        if (#self.Children > 0) then
            for i = 1, #self.Children do 
                self.Children[i]:CalculateNewGlobalCoordinates()
            end
        end
    end


    setmetatable(obj, self)
    self.__index = self; return obj
end

function Container:newFullscreen(Term)
    Term = Term or term.current()
    local sizex, sizey = Term.getSize()
    local obj = self:new(1, 1, sizex, sizey)
    obj.Move = nil
    obj.Resize = nil
    obj.isFullscreen = true
    return obj
end

--[[
    TextBlock - просто блок текста. {НЕ ДЛЯ ВВОДА}
]]

TextBlock = {}
extended(TextBlock, Container)

function TextBlock:new(x, y, width, height)
    local obj = Container:new(x, y, width, height)
        obj.Content = ""
        obj.TextColor = colors.black
        obj.HorizontalAlignment = HorizontalAlignment.Left
        obj.VerticalAlignment = VerticalAlignment.Top

    function obj:Redraw()
        local a = tonumber(SText.Split(SText.Split(os.version())[2], {"."})[2])
        local lastTextColor = self.TextColor
        local lastBackgroundColor = self.BackgroundColor
        if (a >= 7) then 
            lastTextColor = term.getTextColor()
            lastBackgroundColor = term.getBackgroundColor()
        end
        term.setTextColor(self.TextColor)
        term.setBackgroundColor(self.BackgroundColor)
        local wordArray = SText.Split(self.Content, {" "})
        local i = 1
        local size = 0
        local y = 0
        Graph.FilledBox(self.globalX, 
                        self.globalY,
                        self.globalX + self.width - 1,
                        self.globalY + self.height - 1,
                        self.BackgroundColor)
        if (self.HorizontalAlignment == HorizontalAlignment.Left) then
                local j = 1
                for i = 0, self.height - 1 do
                    local str = ""
                    while j <= #wordArray do
                        local prestr = str..wordArray[j].." "
                        if (prestr:len() <= self.width) then
                            str = str..wordArray[j].." "
                            j = j + 1
                        else
                            str = str:sub(1, str:len() - 1)
                            break
                        end
                        if (j > #wordArray) then break end
                    end
                    local xPos = self.globalX
                    term.setCursorPos(xPos, self.globalY + i)
                    term.write(str)
                    if (j > #wordArray) then break end
                end
            end
            if (self.HorizontalAlignment == HorizontalAlignment.Right) then
                local j = 1
                for i = 0, self.height - 1 do
                    local str = ""
                    while j <= #wordArray do
                        local prestr = str..wordArray[j].." "
                        if (prestr:len() <= self.width) then
                            str = str..wordArray[j].." "
                            j = j + 1
                        else
                            str = str:sub(1, str:len() - 1)
                            break
                        end
                        if (j > #wordArray) then break end
                    end
                    local xPos = self.globalX + (self.width - str:len())
                    term.setCursorPos(xPos, self.globalY + i)
                    term.write(str)
                    if (j > #wordArray) then break end
                end
            end
            if (self.HorizontalAlignment == HorizontalAlignment.Center) then
                local j = 1
                for i = 0, self.height - 1 do
                    local str = ""
                    while j <= #wordArray do
                        local prestr = str..wordArray[j].." "
                        if (prestr:len() <= self.width) then
                            str = str..wordArray[j].." "
                            j = j + 1
                        else
                            str = str:sub(1, str:len() - 1)
                            break
                        end
                        if (j > #wordArray) then break end
                    end
                    local xPos = self.globalX + math.floor((self.width - str:len())/2)
                    term.setCursorPos(xPos, self.globalY + i)
                    term.write(str)
                    if (j > #wordArray) then break end
                end
            end
        
        term.setTextColor(lastTextColor)
        term.setBackgroundColor(lastBackgroundColor)
    end

    function obj:setParent(parent)
        self.Parent = parent
    end
    
    setmetatable(obj, self)
    self.__index = self; return obj
end