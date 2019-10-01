-- Name: Nate Day
-- Course: ICS2O
-- This program displays 4 differnt shapes and says their name underneath.
--Drawing Shapes

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Add a backround 
display.setDefault("background", 24/255, 29/255, 49/255)

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

-- Set the text location to under the triangle
TriangleText = display.newText("Triangle", 768, 360, (ComicSansMS), textSize)

-- Create new parallelogram variables
local parallelogram
local parallelogramText
local _textSize = 75

-- Sets the location of my new parallelogram and displays it
parallelogram = display.newPolygon(256, 200, {-20, -20, 60, -20, 20, 40, -60, 40})

-- Fills the parallelogram with a image.
parallelogram.fill = {type="image", filename="Images/stars.png" }

-- Sets the stroke width and colour of the triangle
parallelogram.strokeWidth = 15
parallelogram:setStrokeColor(0, 0, 0)