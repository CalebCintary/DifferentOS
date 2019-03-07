print(textutils.serialize(fs.list("./")))

--[[dofile("/os/API/gui.lua")

screen = Container:newFullscreen()
screen:CalculateNewGlobalCoordinates()

text = TextBlock:new(2, 2, 20, 2)
text.Content = "Lorem input is verry slowwy damage for us"
text.HorizontalAlignment = HorizontalAlignment.Left
text:CalculateNewGlobalCoordinates()
text.BackgroundColor = colors.blue


screen:addChild(text)
screen:Redraw()

term.setCursorPos(8, 8) ]]