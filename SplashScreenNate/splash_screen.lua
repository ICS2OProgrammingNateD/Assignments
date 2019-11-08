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

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local companyLogo 
local bkgSound
local sceneGroup
local phase

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the beetleship on the screen
local function ImageSpin(event)
    transition.to(  companyLogo, { rotation = companyLogo.rotation + 14400000000000, iterations = 1, time=9000} )
end



-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    sceneGroup = self.view

    companyLogo =  display.newImageRect( "Images/CompanyLogo.png", 800, 800)
    companyLogo.x = display.contentWidth/2
    companyLogo.y = display.contentHeight/2
    companyLogo.width = 700
    companyLogo.height = 700
    bkgSound = audio.loadSound("Sounds/413655__alegemaate__helicopter.wav")

    sceneGroup:insert( companyLogo )

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