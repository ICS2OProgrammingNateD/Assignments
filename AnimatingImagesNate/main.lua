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
scrollSpeed = 4
scrollSpeed2 = 4 - 8



---------------------------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------

local backgroundImage

local marioImage

local deadpoolImage

local mushroomImage

local cloudImage



--------------------------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------------------

-- Function: move mario image
-- Input: This function accepts an event listener
-- Output: None
-- Discription: moves the mario image 
local function MoveMarioImage(event)
-- add the scroll speed to the x-value of the character
	marioImage.alpha = 1 
	marioImage.x = marioImage.x + scrollSpeed
end


-- Function: move deadpool image
-- Input: This function accepts an event listener
-- Output: None
-- Discription: moves the deadpool image
local function MoveDeadpoolImage(event)
-- add the scroll speed to the x-value of the character
	deadpoolImage.alpha = 1 
	deadpoolImage.x = deadpoolImage.x + scrollSpeed2
	-- change the transparency of the character every time it moves so that it fades out
	deadpoolImage.alpha = deadpoolImage.alpha + 0.2
	-- I got this information from stackoverflow how to make multiple objects bounce around in Corona sdk
	if (deadpoolImage.x < 0) then 
  deadpoolImage.x = deadpoolImage.x + 3 scrollSpeed2 = -scrollSpeed2
	end

	if((deadpoolImage.x + deadpoolImage.width) > display.contentWidth) then 
  deadpoolImage.x = deadpoolImage.x - 3 scrollSpeed2 = -scrollSpeed2
	end

	if(deadpoolImage.y < 0) then 
  scrollSpeed2 = -scrollSpeed2
	end
end




-- Function: move flower image
-- Input: This function accepts an event listener
-- Output: None
-- Discription: moves the cloud image
local function MoveCloudImage(event)
-- add the scroll speed to the x-value of the character
	cloudImage.alpha = 1 
	cloudImage.x = cloudImage.x + scrollSpeed
	-- change the transparency of the character every time it moves so that it fades out
	cloudImage.alpha = cloudImage.alpha + 0.2
end










--------------------------------------------------------------------------------------------------
-- OBJECT CREATION
--------------------------------------------------------------------------------------------------

-- make new image
marioImage = display.newImageRect("Images/marioImage.png", 100, 150)

-- set the initial x and y position of mario
marioImage.x = 100
marioImage.y = 524



-- make new image
deadpoolImage = display.newImageRect("Images/deadpoolimage.png", 200, 200)

-- set the initial x and y position of deadpool
deadpoolImage.x = 900
deadpoolImage.y = 515
deadpoolImage:scale(-1, 1)


-- make new image
angryBirdImage = display.newImageRect("Images/angrybirdimage.png", 150, 150)

-- set the initial x and y position of angryBird
angryBirdImage.x = 70
angryBirdImage.y = 70
























-------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
-------------------------------------------------------------------------------------------------------
-- Move Mario will be called over and over again
Runtime:addEventListener("enterFrame", MoveMarioImage)

-- Move Deadpool will be called over and over again
Runtime:addEventListener("enterFrame", MoveDeadpoolImage)

-- Move angry bird will be called over and over again
Runtime:addEventListener("enterFrame", MoveAngrybirdImage)

