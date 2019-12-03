
-- main_menu.lua
-- Created by: Nate Day
-- Date: Nov. 16, 2019
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-- load sound
audio.loadStream()

-- load sound
audio.loadSound()

-- add background music
backgroundMusic = audio.loadStream("Sounds/bkgMusic.mp3")

physics.start()

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local mouseClick

local bkgMusic
local bkgMusicChannel

local muteButton
local unmuteButton

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
-- create global VARIABLES
soundOn = true


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "fromTop", time = 1500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "fade", time = 2000})
end    
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function InstructionsTransition( )       
    composer.gotoScene( "instructions_screen", {effect = "slideUp", time = 1000})
end 

-----------------------------------------------------------------------------------------

local function Mute(touch)
    if (touch.phase == "ended") then
        -- pause the sound
        bkgMusicChannel = audio.pause(bkgMusic)
        -- set sound on to be false
        soundOn = false
        -- hide the mute button
        muteButton.isVisible = false
        -- make the unmuteButton Visible
        unmuteButton.isVisible = true
    end
end

local function Unmute(touch)
    if (touch.phase == "ended") then
        -- play the sound
        bkgMusicChannel = audio.resume(bkgMusic)
        -- set sound on to be false
        soundOn = true
        -- hide the mute button
        muteButton.isVisible = true
        -- make the unmuteButton Visible
        unmuteButton.isVisible = false
    end
end

local function click( touch )
    if (touch.phase == "began") then
        audio.play(mouseClick)
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenuNate.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
    
   
    
    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()


    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*14/16,
            y = display.contentHeight*4/8,
            
            -- Setting Dimensions
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressedHunterC.png",
            overFile = "Images/PlayButtonPressedHunterC.png", 

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition 
            
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*14/16,
            y = display.contentHeight*6.5/8,

            -- Setting Dimensions
            width = 200,
            height = 120,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressedNate.png", 
            overFile = "Images/CreditsButtonPressedNate.png", 

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 

    -----------------------------------------------------------------------------------------

     -- Creating instructions Button
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*2/16,
            y = display.contentHeight*6.5/8,

            -- Setting Dimensions
            width = 200,
            height = 120,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressedNate.png",
            overFile = "Images/InstructionsButtonPressedNate.png", 

            -- When the button is released, call the Credits transition function
            onRelease = InstructionsTransition
        } ) 

    -----------------------------------------------------------------------------------------
    -- create mute button
    muteButton = display.newImageRect("Images/MuteButtonUnpressedHunterC.png", 150, 150)
    muteButton.x = display.contentWidth*2/16
    muteButton.y = display.contentHeight*4/8
    muteButton.isVisible = true

     -- create mute button
    unmuteButton = display.newImageRect("Images/MuteButtonPressedHunterC.png", 150, 150)
    unmuteButton.x = display.contentWidth*2/16
    unmuteButton.y = display.contentHeight*4/8
    unmuteButton.isVisible = false

    -- add mouse click sound
    mouseClick = audio.loadSound("Sounds/patsound.mp3")


    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )

end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        bkgMusicChannel = audio.play(backgroundMusic, {loops = -1})
        muteButton:addEventListener("touch", Mute)
        unmuteButton:addEventListener("touch", Unmute)
        Runtime:addEventListener("touch", click)

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        muteButton:removeEventListener("touch", Mute)
        unmuteButton:removeEventListener("touch", Unmute)
        Runtime:removeEventListener("touch", click)

    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

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