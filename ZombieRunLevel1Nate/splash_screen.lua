-----------------------------------------------------------------------------------------
-- intro_screen.lua
-- Created by: Nate Day
-- Date: Nov. 7th, 2019
-- Description: This is the splash screen of the game. It displays the app logo and the 
-- company logo with some sort of animation...
-----------------------------------------------------------------------------------------
-- Use Composer Library
local composer = require( "composer" )
-- require physics 
local physics = require("physics")

physics.start()

-- Name the Scene
sceneName = "splash_screen"

local scene = composer.newScene( sceneName )

------------------------------------------------------------------------------------------
-- Sounds
---------------------------------------------------------------------------------------------
-- play sound 

local bkgSound = audio.loadSound("Sounds/413655__alegemaate__helicopter.mp3")

local Sound1 = audio.loadSound("Sounds/401630__studiomandragore__booms.wav")

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local companyLogo 
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


-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end


-- create boom sound function
local function BoomSound(event)
    audio.play(Sound1)
end

-- The function that moves the companyLogo on the screen
local function ImageSpin(event)
    transition.to(  rearPropeller, { rotation = rearPropeller.rotation + 5000, iterations = 1, time = 1962 } )
end


-- create text
local function BuildingGames(event)

    -- add to physics
    physics.addBody(buildingGamesText, {density = .6, friction = 0.5, bounce = .580})

   -- timer.performWithDelay(1962, BoomSound)
end




-- make a function that fades in building GAMES
local function FadeText(event)
    
    -- change the transparency of the ship every time it moves so that it fades in
    buildingGamesText.alpha = buildingGamesText.alpha + 0.01
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
    timer.performWithDelay( 1962, BuildingGames)

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

-- fade text will be called over and over again
Runtime:addEventListener("enterFrame", FadeText)


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

    

    -- make the background colour gradient
    paint = {
    type = "gradient",
    color1 = { 0/255, 102/255, 204/255 },
    color2 = { 153/255, 204/255, 255/255 },
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
    cloudImage = display.newImage("Images/cloud.png", 535, 40)
    cloudImage.width = 1100
    cloudImage.height = 170

    -- create the distant mountains
    distantMountains = display.newImage("Images/mountains.png", 512, 800)
    distantMountains.width = 1024
    distantMountains.height = 200

    -- creating BuildingGames text 
    buildingGamesText = display.newText("BUILDING GAMES", 512, 100, native.systemFontBold, 110)
    buildingGamesText.width = 1000
    buildingGamesText.height = 100
    buildingGamesText.alpha = 0
   

    -- Sets the colour of the text to be gradient 
    gradient1 = {
    type = "gradient1", 
    color1 = {153/255, 255/255, 255/255 }, color2 = {0/255, 51/255, 51/255}, direction = "down"
}

    buildingGamesText:setFillColor(gradient1)



    -- add to physics
    physics.addBody(distantMountains, "static", {friction = 0.5})
    
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
        timer.performWithDelay(3600, BoomSound)

        ImageSpin()

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 8000, gotoMainMenu)   
    end

end --function scene:show( event )

------------------------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    sceneGroup = self.view
    phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then


        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        
        -- remove the listeners when leaving the scene

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        buildingGamesText.isVisible = false
        distantMountains.isVisible = false
        cloudImage.isVisible = false
        display.setDefault("background", 0/255, 0/255, 0/255)
        physics.stop()

    end

end

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