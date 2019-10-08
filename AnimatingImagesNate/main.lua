-- Name: Nate Day
-- Course: ICS2O
-- This program displays 4 differnt shapes and says their name underneath.
-- Animating Images

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Add a backround image 
backgroundImage = display.newImageRect("Images/background.png", 1324, 768)
backgroundImage.x = display.contentCenterX
backgroundImage.y = display.contentCenterY


---------------------------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------

local backgroundImage
local marioImage
local deadpoolImage
local mushroomImage
local angryBirdImage