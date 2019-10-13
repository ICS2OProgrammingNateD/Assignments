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

scrollSpeed1 = 4
scrollSpeed2 = -4 
scrollSpeed3x = 4
scrollSpeed3y = 4 
scrollSpeed4 = -4
scrollSpeed5 = 10


---------------------------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------

local backgroundImage

local marioImage

local deadpoolImage

local starImage

local cloudImage

local textBubble

local titleText

local textSize = 100

local textSize2 = 50

local textObject

local textObject2

local textObject3

local gradient1

local gradient2

local gradient3 

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
	marioImage.x = marioImage.x + scrollSpeed1

	-- I got this information from stackoverflow how to make multiple objects bounce around in Corona sdk
	-- this makes the image respond to hitting a wall
if (marioImage.x < 0) then 
  marioImage.x = marioImage.x + 3 scrollSpeed1 = -scrollSpeed1
	end

if(marioImage.x > display.contentWidth) then 
  marioImage.x = marioImage.x - 3 scrollSpeed1 = -scrollSpeed1
	end

-- Flip marioImage when he is in the middle, or x = 1024/2. Set a tolerance so that the middle postion is not skipped by scrollSpeed1 (+-4).
if (marioImage.x > (1024/2 - 2) and marioImage.x < (1024/2 + 2)) then
  
   marioImage:scale(-1, 1)
  
end


if(marioImage.y < 0) then 
  scrollSpeed1 = -scrollSpeed1
	end
end

----------------------------------------------------------------------------------------------


-- Function: move deadpool image
-- Input: This function accepts an event listener
-- Output: None
-- Discription: moves the deadpool image 
local function MoveDeadpoolImage(event)
-- add the scroll speed to the x-value of the character
	deadpoolImage.alpha = 1 
	deadpoolImage.x = deadpoolImage.x + scrollSpeed2


	-- I got this information from stackoverflow how to make multiple objects bounce around in Corona sdk
	-- this makes the image respond to hitting a wall
if (deadpoolImage.x < 0) then 
  deadpoolImage.x = deadpoolImage.x + 3 scrollSpeed2 = -scrollSpeed2
	end

if(deadpoolImage.x > display.contentWidth) then 
  deadpoolImage.x = deadpoolImage.x - 3 scrollSpeed2 = -scrollSpeed2
	end
-- Flip deadpoolImage when he is in the middle, or x = 1024/2. Set a tolerance so that the middle postion is not skipped by scrollSpeed2 (+-4).
if (deadpoolImage.x > (1024/2 - 2) and deadpoolImage.x < (1024/2 + 2)) then
  
   deadpoolImage:scale(-1, 1)
  
end

if(deadpoolImage.y < 0) then 
  scrollSpeed2 = -scrollSpeed2
	end
end
------------------------------------------------------------------------------------------------


-- Function: moves the star to bounce off the walls
-- Input: This function accepts an event listener
-- Output: None
-- Discription: moves the star
local function MoveStarImage(event)
-- add the scroll speed to the x-value of the character
	starImage.alpha = 1 
	starImage.x = starImage.x + scrollSpeed3x
	starImage.y = starImage.y + scrollSpeed3y

	 -- I got this information from stackoverflow how to make multiple objects bounce around in Corona sdk
	 -- this makes the image respond to hitting a wall
if (starImage.x < 0) then 
  starImage.x = starImage.x + 3 scrollSpeed3x = -scrollSpeed3x
	end

if(starImage.x > display.contentWidth) then 
  starImage.x = starImage.x - 3 scrollSpeed3x = -scrollSpeed3x
	end
if(starImage.y > display.contentHeight - 200 ) then 
  starImage.y = starImage.y - 3 scrollSpeed3y = -scrollSpeed3y
	end


if(starImage.y < 0) then 
  starImage.y = starImage.y + 3 scrollSpeed3y = -scrollSpeed3y
	end
end
--------------------------------------------------------------------------------------------------


-- Function: move cloud image
-- Input: This function accepts an event listener
-- Output: None
-- Discription: moves the cloud image
local function MoveCloudImage(event)
-- add the scroll speed to the x-value of the character
	cloudImage.alpha = 1 
	cloudImage.x = cloudImage.x + scrollSpeed4
    -- I got this information from stackoverflow how to make multiple objects bounce around in Corona sdk
	-- this makes the image respond to hitting a wall
if (cloudImage.x < 0) then 
   cloudImage.x = cloudImage.x + 3 scrollSpeed4 = -scrollSpeed4
	end

if(cloudImage.x > display.contentWidth) then 
  cloudImage.x = cloudImage.x - 3 scrollSpeed4 = -scrollSpeed4
	end

if(cloudImage.y < 0) then 
  scrollSpeed4 = -scrollSpeed4
	end
end

-----------------------------------------------------------------------------------------------------------

-- Function: moves the title text so it endlessly bounces off the walls
-- Input: This function accepts an event listener
-- Output: None
-- Discription: moves the title text
local function MoveTextImage(event)
-- add the scroll speed to the x-value of the character
	titleText.alpha = 1 
	titleText.x = titleText.x + scrollSpeed5
    -- I got this information from stackoverflow how to make multiple objects bounce around in Corona sdk
	-- this makes the image respond to hitting a wall

if (titleText.x < 0) then 
  titleText.x = titleText.x + 3 scrollSpeed5 = -scrollSpeed5
	end

if(titleText.x  > display.contentWidth) then 
  titleText.x = titleText.x - 3 scrollSpeed5 = -scrollSpeed5
	end

if(titleText.y < 0) then 
  scrollSpeed5 = -scrollSpeed5
	end
end



-- Function: touch deadpool image
-- Input: This function accepts an event listener
-- Output: None
-- Discription: allows you to click deadpool then he responds
local function touchDeadpool(touch)
	if (touch.phase == "began") then
		textObject.isVisible = true
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then
		textObject.isVisible = true
		textObject.isVisible = false
    end
end


-- Function: touch mario image
-- Input: This function accepts an event listener
-- Output: None
-- Discription: allows you to click Mario then he responds
local function touchMario(touch)
	if (touch.phase == "began") then
		textObject2.isVisible = true
		textObject2.isVisible = true
	end

	if (touch.phase == "ended") then
		textObject2.isVisible = true
		textObject2.isVisible = false
    end
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
starImage = display.newImageRect("Images/star.png", 150, 150)

-- set the initial x and y position of star
starImage.x = 70
starImage.y = 80

-- make new image appear
textBubble = display.newImageRect("Images/speechBubble.png", 1135, 150)

-- set the initial x and y position of the text bubble
textBubble.x = 535
textBubble.y = 256


-- make new image
cloudImage = display.newImageRect("Images/cloud.png", 150, 150)

-- set the initial x and y position of cloud
cloudImage.x = 900
cloudImage.y = 80

-- Sets the text location and displays it
titleText = display.newText("Bouncing Images", display.contentWidth/2, 700, (native.systemFontBold), textSize)

-- Sets the colour of the text to be gradient 
gradient1 = {
	type = "gradient1", 
	color1 = {0/255, 255/255, 255/255 }, color2 = {0/255, 0/255, 104/255}, direction = "down"
}

titleText:setFillColor(gradient1)


-- creates the text object
textObject = display.newText("DEADPOOL!", display.contentWidth/2,  display.contentHeight/2, (native.systemFontBold), textSize)
textObject.isVisible = false

-- make text color gradient
 gradient2 = {
	type = "gradient2", 
	color1 = {.9, .09, .09 }, color2 = {0, .2, .3}, direction = "down"
}

textObject:setFillColor(gradient2)


-- creates the text object
textObject2 = display.newText("MARIO!", display.contentWidth/2,  display.contentHeight/2, (native.systemFontBold), textSize)
textObject2.isVisible = false

-- make text color gradient
 gradient2 = {
	type = "gradient2", 
	color1 = {.9, .09, .09 }, color2 = {0, .2, .3}, direction = "down"
}

textObject2:setFillColor(gradient2)


-- create new text object
textObject3 = display.newText("Click a character to see their name!", 512, 256, (native.systemFontBold), textSize2)

-- make text color gradient
 gradient3 = {
	type = "gradient3", 
	color1 = {255/255, 102/255, 255/255 }, color2 = {3/255, 0/255, 0/255}, direction = "down"
}

textObject3:setFillColor(gradient3)





-------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
-------------------------------------------------------------------------------------------------------
-- Move Mario will be called over and over again
Runtime:addEventListener("enterFrame", MoveMarioImage)

-- Move Deadpool will be called over and over again
Runtime:addEventListener("enterFrame", MoveDeadpoolImage)

-- Move angry bird will be called over and over again
Runtime:addEventListener("enterFrame", MoveStarImage)

-- Move cloud will be called over and over again
Runtime:addEventListener("enterFrame", MoveCloudImage)

-- Move text will be called over and over again
Runtime:addEventListener("enterFrame", MoveTextImage)

-- calls touch over and over again
deadpoolImage:addEventListener( "touch", touchDeadpool )

-- calls touch over and over again
marioImage:addEventListener( "touch", touchMario )

