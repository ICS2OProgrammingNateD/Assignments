-----------------------------------------------------------------------------------------
-- intro_screen.lua
-- Created by: Nate Day
-- Date: Nov. 7th, 2019
-- Description: This is the splash screen of the game. It displays the app logo and the 
-- company logo with some sort of animation...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

local scene = composer.newScene( sceneName )

local Sound1 = audio.loadSound("Sounds/401630__studiomandragore__booms.wav")

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local companyLogo 
local bkgSound
local sceneGroup

local phase
local paint
local rect

local rearPropeller
local windImage
local distantMountains

local scrollYSpeed = 3
local scrollXSpeed = -7
local buildingGamesText



--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- create boom sound function
local function BoomSound(event)
    audio.play(Sound1)
end

-- The function that moves the companyLogo on the screen
local function ImageSpin(event)
    transition.to(  rearPropeller, { rotation = rearPropeller.rotation + 5400, iterations = 1, time = 2000 } )
end


-- require physics 
physics = require("physics")


-- start physics
physics.start()


-- create text
local function BuildingGames()
    -- creating BuildingGames text 
    buildingGamesText = display.newText("BUILDING GAMES", 512, 100, native.systemFontBold, 110)
    -- Sets the colour of the text to be gradient 
    gradient1 = {
    type = "gradient1", 
    color1 = {0/255, 255/255, 255/255 }, color2 = {0/255, 0/255, 104/255}, direction = "down"
}

    buildingGamesText:setFillColor(gradient1)



    -- add to physics
    physics.addBody(buildingGamesText, {density = .6, friction = 0.5, bounce = 0.62})

    timer.performWithDelay(2000, BoomSound)
end


-- Function: Moveship
-- Input: this function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
-- add the scroll speed to the x-value of the ship
    companyLogo.x = companyLogo.x + scrollYSpeed
    companyLogo.y = companyLogo.y + scrollXSpeed
-- change the transparency of the ship every time it moves so that it fades out
    companyLogo.alpha = companyLogo.alpha - 0.01
end


-- Function: Moveship
-- Input: this function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of the ship
local function _MoveShip(event)
-- add the scroll speed to the x-value of the ship
    rearPropeller.x = rearPropeller.x + scrollYSpeed
    rearPropeller.y = rearPropeller.y + scrollXSpeed
-- change the transparency of the ship every time it moves so that it fades out
    rearPropeller.alpha = rearPropeller.alpha - 0.01
end
--------------------------------------------------------------------------------------------
-- FUNCTION CALLS
-------------------------------------------------------------------------------------------

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- Moveship will be called over and over again
Runtime:addEventListener("enterFrame", _MoveShip)

timer.performWithDelay( 1700, BuildingGames)


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    sceneGroup = self.view

    -- create company logo image
    companyLogo =  display.newImageRect( "Images/CompanyLogoNate@2x.png", 512, 800 )
    companyLogo.x = display.contentWidth/2
    companyLogo.y = display.contentHeight*3/4.3
    companyLogo.width = 400
    companyLogo.height = 350

    -- play sound 
    bkgSound = audio.loadSound("Sounds/413655__alegemaate__helicopter.mp3")

    -- make the background colour gradient
    paint = {
    type = "gradient",
    color1 = { 204/255, 255/255, 204/255 },
    color2 = { 0, 102/255, 102/255 },
    direction = "up"
    }
    
    -- set the dimensions of what needs to be painted
    rect = display.newRect( display.contentCenterX, display.contentCenterY, 1024, 768 )
    rect.fill = paint
    
    -- insert the company logo to back 
    sceneGroup:insert( companyLogo )
    rect:toBack()
    
    --create the rear propeller
    rearPropeller = display.newImage("Images/wind1.png", 330, 520)
    rearPropeller.width = 50
    rearPropeller.height = 50

    -- create the cloud image
    cloudImage = display.newImage("Images/cloud.jpg", 512, 69)
    cloudImage.width = 1200
    cloudImage.height = 270

    -- create the distant mountains
    distantMountains = display.newImage("Images/mountains.png", 512, 729)
    distantMountains.width = 1024
    distantMountains.height = 100

    -- add to physics
    physics.addBody(distantMountains, "static", {friction = 0.5, bounce = 0.5})

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        bkgMusicChannel = audio.play(bkgSound)

        ImageSpin()
    end

end --function scene:show( event )


-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    sceneGroup = self.view

    ----------------------------------------------------------------------------------------  
end

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene