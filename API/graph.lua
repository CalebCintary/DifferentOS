dofile("/os/API/SText.lua")
Graph = {}

function Graph.Pixel(x, y, color)
    if (Logger.State) then
        local string = "Attempt to draw pixel at x"..tostring(x).." y"..tostring(y).." color"..tostring(color)
        Logger(Module.Graph, string)
    end
    color = color or colors.white
    paintutils.drawPixel(x, y, color)
    if (Logger.State) then
        local string = "Success in draw pixel at x"..tostring(x).." y"..tostring(y).." color"..tostring(color)
        Logger(Module.Graph, string)
    end
end

function Graph.Line(x1, y1, x2, y2, color)
    if (Logger.State) then
        --TODO: Дописать
        Logger(Module.Graph, string)
    end
    color = color or colors.white
    paintutils.drawLine(x1, y1, x2, y2, color)
end

function Graph.Box(x1, y1, x2, y2, color)
    local a = SText.Split(SText.Split(os.version())[2], {"."})[2]
    if (tonumber(a) >= 6) then
        paintutils.drawBox(x1, y1, x2, y2, color)
    else
        Graph.Line(x1, y1, x2, y1, color)
        Graph.Line(x2, y1, x2, y2, color)
        Graph.Line(x2, y2, x1, y2, color)
        Graph.Line(x1, y2, x1, y1, color)
    end
end

function Graph.FilledBox(x1, y1, x2, y2, color)
    local a = SText.Split(SText.Split(os.version())[2], {"."})[2]
    if (tonumber(a) >= 6) then
        paintutils.drawFilledBox(x1, y1, x2, y2, color)
    else
        local s = -1 
        if (y1 < y2) then s = 1 end
            for i = y1, y2, s do
                Graph.Line(x1, i, x2, i, color)
            end
    end
end