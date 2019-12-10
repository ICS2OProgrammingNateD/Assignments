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



-----------------------------------------------------------------------------------------
-- FORWARD REFERENCES
-----------------------------------------------------------------------------------------

-- local variables for the scene
local bkg
local backButton
local cover



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

-- Creating Transition Function to Credits Page
local function InstructionsTransition( )       
    composer.gotoScene( "instructions_screen", {effect = "zoomOutInFade", time = 1000})
end 

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "fade", time = 2000})
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
    cover:setFillColor(255/255, 153/255, 153/255)

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------


    -- Creating Back Button
    resumeButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*8/16,
        y = display.contentHeight*5/16,

        -- Setting Dimensions
        width = 190,
        height = 120,

        -- Setting Visual Properties
        defaultFile = "Images/ResumeButtonHunter@2x.png",
        overFile = "Images/ResumeButtonPressedHunter@2x.png",

        -- Setting Functional Properties
        onRelease = ResumeTransition

    } )

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*8/16,
        y = display.contentHeight*13/16,

        -- Setting Dimensions
        width = 190,
        height = 120,

        -- Setting Visual Properties
        defaultFile = "Images/MainMenuButoonUnpressedHunter@2x.png",
        overFile = "Images/MainMenuButoonPressedHunter@2x.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )


    -- Creating instructions Button
    instructionsButton = widget.newButton( 
    {
       -- Set its position on the screen relative to the screen size
       x = display.contentWidth*8/16,
       y = display.contentHeight*9/16,

       -- Setting Dimensions
       width = 200,
       height = 120,

       -- Insert the images here
       defaultFile = "Images/InstructionsButtonUnpressedNate.png",
       overFile = "Images/InstructionsButtonPressedNate.png", 

       -- When the button is released, call the Credits transition function
       onRelease = InstructionsTransition
    } ) 

    -- Creating instructions Button
    restartButton = widget.newButton( 
    {
       -- Set its position on the screen relative to the screen size
       x = display.contentWidth*8/16,
       y = display.contentHeight*2/16,

       -- Setting Dimensions
       width = 200,
       height = 120,

       -- Insert the images here
       defaultFile = "Images/RestartButtonNate@2x.png",
       overFile = "Images/RestartButtonPressedNate@2x.png", 

       -- When the button is released, call the Credits transition function
       onRelease = Level1ScreenTransition
    } ) 



    -- Associating Buttons with this scene
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert( backButton )
    sceneGroup:insert( resumeButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( restartButton )
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
        audio.stop(bkgMusicChannel1)

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
     
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
