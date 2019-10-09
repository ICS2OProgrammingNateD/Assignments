-- Name: Nate Day
-- Course: ICS2O
-- This program displays 4 differnt images that do different things
-- Animating Images

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Add a backround image 
backgroundImage = display.newImageRect("Images/background.png", 1324, 768)
backgroundImage.x = display.contentCenterX
backgroundImage.y = display.contentCenterY


---------------------------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
---------------------------------------------------------------------------------------------------------
-- global variable
scrollSpeed = 3 




---------------------------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------

local backgroundImage

local marioImage

local deadpoolImage

local mushroomImage

local angryBirdImage



--------------------------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------------------

-- Function: move mario image
-- Input: This function accepts an event listener
-- Output: None
-- Discription: 
local function MoveMarioImage(event)
-- add the scroll speed to the x-value of the character
	marioImage.alpha = 1 
	marioImage.x = marioImage.x + scrollSpeed
end


-- Function: move deadpool image
-- Input: This function accepts an event listener
-- Output: None
-- Discription: 
local function MoveDeadpoolImage(event)
-- add the scroll speed to the x-value of the character
	deadpoolImage.alpha = 1 
	deadpoolImage.x = deadpoolImage.x + scrollSpeed
	-- change the transparency of the character every time it moves so that it fades out
	deadpoolImage.alpha = deadpoolImage.alpha + 0.2
end



























--------------------------------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------------------------------

-- make new image
marioImage = display.newImageRect("Images/marioImage.png", 150, 150)

-- set the initial x and y position of mario
marioImage.x = 100
marioImage.y = 524



-- make new image
deadpoolImage = display.newImageRect("Images/deadpoolimage.png", 150, 150)

-- set the initial x and y position of deadpool
deadpoolImage.x = 900
deadpoolImage.y = 524






























-------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
-------------------------------------------------------------------------------------------------------
-- Move Mario will be called over and over again
Runtime:addEventListener("enterFrame", MoveMarioImage)
