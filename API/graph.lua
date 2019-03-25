
Graph = {}

function Graph.Pixel(x, y, color)
    color = color or colors.white
    paintutils.drawPixel(x, y, color)
end

function Graph.Line(x1, y1, x2, y2, color)
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