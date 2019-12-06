-- pause screen

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Calling Composer Library
local composer = require( "composer" )

local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_pause"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-- load sound

audio.loadStream()

-- add background music
backgroundMusic = audio.loadStream("Sounds/level1music.mp3")

-----------------------------------------------------------------------------------------
-- FORWARD REFERENCES
-----------------------------------------------------------------------------------------

-- local variables for the scene
local bkg
local backButton
local cover
local muteButton
local unmuteButton
local bkgMusic


-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------\

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 1000})
end

-- Creating Transitioning Function back to level 1
local function ResumeTransition( )
    composer.hideOverlay("fade", 300 )
    ResumeGame()
end

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

--------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.7)
    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(0/255, 0/255, 70/255)

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------


    -- Creating Back Button
    resumeButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*8/16,
        y = display.contentHeight*8/16,

        -- Setting Dimensions
        width = 190,
        height = 120,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtonUnpressedNate.png",
        overFile = "Images/BackButtonPressedNate.png",

        -- Setting Functional Properties
        onRelease = ResumeTransition

    } )

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*8/16,
        y = display.contentHeight*12/16,

        -- Setting Dimensions
        width = 190,
        height = 120,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtonUnpressedNate.png",
        overFile = "Images/BackButtonPressedNate.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )


    -- create mute button
    muteButton = display.newImageRect("Images/MuteButtonUnpressedHunterC.png", 150, 150)
    muteButton.x = display.contentWidth*8/16
    muteButton.y = display.contentHeight*4/16
    muteButton.isVisible = true

     -- create mute button
    unmuteButton = display.newImageRect("Images/MuteButtonPressedHunterC.png", 150, 150)
    unmuteButton.x = display.contentWidth*8/16
    unmuteButton.y = display.contentHeight*4/16
    unmuteButton.isVisible = false

    -- Associating Buttons with this scene
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert( backButton )
    sceneGroup:insert( resumeButton )
	sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )
    
end    

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        bkgMusicChannel = audio.play(backgroundMusic, {loops = -1})
        muteButton:addEventListener("touch", Mute)
        unmuteButton:addEventListener("touch", Unmute)
    end

end

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
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
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
