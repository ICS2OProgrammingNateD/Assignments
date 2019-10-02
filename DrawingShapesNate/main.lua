-- Name: Nate Day
-- Course: ICS2O
-- This program displays 4 differnt shapes and says their name underneath.
--Drawing Shapes

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Add a backround 
display.setDefault("background", 72/255, 99/255, 160/255)



-- Create a new triangle variables
local Triangle
local TriangleText
local textSize = 75

-- Sets the location of my new triangle and displays it
Triangle = display.newPolygon( 768, 200, {0, -120, 120,120, -120, 120,})

-- Sets the colour of the triangle
Triangle:setFillColor(1, 0, 0)

-- Sets the stoke width and colour of the triangle
Triangle.strokeWidth = 15
Triangle:setStrokeColor(1, .5, .5)

-- Set the text location and displays under the triangle
TriangleText = display.newText("Triangle", 768, 360, (ComicSansMS), textSize)

-- Sets the colour of the text
TriangleText:setTextColor(1, 0, 0)



-- Create new parallelogram variables
local parallelogram
local parallelogramText
local textSize = 75


-- Sets the location of my new parallelogram and displays it
parallelogram = display.newPolygon(256, 200, {-65, -65, 105, -65, 65, 85, -105, 85})

-- Fills the parallelogram with a image.
parallelogram.fill = {type="image", filename="Images/stars.png" }

-- Sets the stroke width and colour of the parallelogram.
parallelogram.strokeWidth = 15
parallelogram:setStrokeColor(158/255, 123/255, 255/255)

-- Sets the text location and displays the text
parallelogramText = display.newText("Parallelogram", 256, 360, (ComicSansMS), textSize)


-- Sets the colour of the text
parallelogramText:setTextColor(75/255, 0/255, 130/255)






-- Create a new pentagon variables
local pentagon
local pentagonText
local TextSize = 75

-- Sets the location of my new pentagon and displays it
pentagon = display.newPolygon( 256, 530, {120,0, 60,-104, -60,-104, -120,0, 0,104 })

-- Sets the colour of the pentagon
pentagon:setFillColor(.8, .8, .8)

-- Sets the stoke width and colour of the pentagon
pentagon.strokeWidth = 15
pentagon:setStrokeColor(1, 1, .5)

-- Set the text location and displays under the pentagon
pentagonText = display.newText("pentagon", 256, 680, (ComicSansMS), textSize)

-- Sets the colour of the text
pentagonText:setTextColor(1, 1, 0)
