-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Nate Day
-- Date: Nov. 19, 2019
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------
physics.start()


-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-- load physics
local physics = require("physics")

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )



-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene

-- create variable for sound
local sound1 = audio.loadSound("Sounds/Cheer.m4a")
local sound2 = audio.loadSound("Sounds/YouLose.mp3")
local sound3 = audio.loadSound("Sounds/Pop.mp3")


local bkg_image

local platform1
local platform2
local platform3
local platform4

local zombie1
local zombie2
local zombie3

local zombie1platform
local zombie2platform
local zombie3platform

local torchesAndSign
local portal
local character

local heart1
local heart2
local numLives = 2

local rArrow 
local lArrow
local uArrow

local motionx = 0

local _SPEED = -9
local SPEED = 9

local LINEAR_VELOCITY = -100
local GRAVITY = 10

local leftW 
local rightW 
local topW
local floor

local key1
local key2
local key3
local theKey

local questionsAnswered = 0

local scrollYSpeed = 3
local scrollXSpeed = -7

local scrollSpeed1 = -1
local scrollSpeed2 = 0.3
local scrollSpeed3 = 2


-----------------------------------------------------------------------------------------
-- LOCAL SCENE FUNCTIONS
----------------------------------------------------------------------------------------- 
 
-- When right arrow is touched, move character right
local function right (touch)
    motionx = SPEED
    character.xScale = 1
end

local function left (touch)
    motionx = _SPEED
    character.xScale = -1
end

-- When up arrow is touched, add vertical so it can jump
local function up (touch)
    if (character ~= nil) then
        character:setLinearVelocity( 0, LINEAR_VELOCITY )
    end
end

-- Move character horizontally
local function movePlayer (event)
    character.x = character.x + motionx
end
 
-- Stop character movement when no arrow is pushed
local function stop (event)
    if (event.phase =="ended") then
        motionx = 0
    end
end

-- Function: move zombie

local function MoveZombie1(event)
-- add the scroll speed to the x-value of the character
    zombie1.alpha = 1 
    zombie1.x = zombie1.x + scrollSpeed3


    -- I got the base of this information from stackoverflow how to make multiple objects bounce around in Corona sdk
    -- this makes the image respond to hitting a wall
    if (zombie1.x < 310) then 
        zombie1.x = zombie1.x + 3 scrollSpeed3 = -scrollSpeed3
    end

    if(zombie1.x > 450) then 
        zombie1.x = zombie1.x - 3 scrollSpeed3 = -scrollSpeed3
    end
end


-- Function: move zombie

local function MoveZombie2(event)
-- add the scroll speed to the x-value of the character
    zombie2.alpha = 1 
    zombie2.x = zombie2.x + scrollSpeed2


    -- I got the base of this information from stackoverflow how to make multiple objects bounce around in Corona sdk
    -- this makes the image respond to hitting a wall
    if (zombie2.x < 0) then 
        zombie2.x = zombie2.x + 3 scrollSpeed2 = -scrollSpeed2
    end

    if(zombie2.x > 250) then 
        zombie2.x = zombie2.x - 3 scrollSpeed2 = -scrollSpeed2
    end
end


-- Function: move zombie

local function MoveZombie3(event)
-- add the scroll speed to the x-value of the character
    zombie3.alpha = 1 
    zombie3.x = zombie3.x + scrollSpeed1


    -- I got the base of this information from stackoverflow how to make multiple objects bounce around in Corona sdk
    -- this makes the image respond to hitting a wall
    if (zombie3.x < 890) then 
        zombie3.x = zombie3.x + 3 scrollSpeed1 = -scrollSpeed1
    end

    if(zombie3.x > 1000) then 
        zombie3.x = zombie3.x - 3 scrollSpeed1 = -scrollSpeed1
    end
end


-- Function: Move portal
-- The function that moves the companyLogo on the screen
local function SpinPortal(event)
    portal:rotate(10)
end



local function AddArrowEventListeners()
    rArrow:addEventListener("touch", right)
    lArrow:addEventListener("touch", left)
    uArrow:addEventListener("touch", up)
end

local function RemoveArrowEventListeners()
    rArrow:removeEventListener("touch", right)
    lArrow:removeEventListener("touch", left)
    uArrow:removeEventListener("touch", up)
end

local function AddRuntimeListeners()
    Runtime:addEventListener("enterFrame", movePlayer)
    Runtime:addEventListener("touch", stop )
end

local function RemoveRuntimeListeners()
    Runtime:removeEventListener("enterFrame", movePlayer)
    Runtime:removeEventListener("touch", stop )
end


local function ReplaceCharacter()
    character = display.newImageRect("Images/Character1@2x.png", 100, 150)
    character.x = display.contentWidth * 0.5 / 8
    character.y = display.contentHeight  * 0.1 / 3
    character.width = 30
    character.height = 60
    character.myName = "Bob"

    -- intialize horizontal movement of character
    motionx = 0

    -- add physics body
    physics.addBody( character, "dynamic", { density=0, friction=0.5, bounce=0, rotation=0 } )

    -- prevent character from being able to tip over
    character.isFixedRotation = true

    -- add back arrow listeners
    AddArrowEventListeners()

    -- add back runtime listeners
    AddRuntimeListeners()
end

local function MakeSoccerBallsVisible()
    key1.isVisible = true
    key2.isVisible = true
    key3.isVisible = true
end

local function MakeHeartsVisible()
    heart1.isVisible = true
    heart2.isVisible = true
end

local function YouLoseTransition()
    composer.gotoScene( "you_lose" )
end

local function YouWinTransition()
    composer.gotoScene( "you_win" )
end

local function onCollision( self, event )
    -- for testing purposes
    --print( event.target )        --the first object in the collision
    --print( event.other )         --the second object in the collision
    --print( event.selfElement )   --the element (number) of the first object which was hit in the collision
    --print( event.otherElement )  --the element (number) of the second object which was hit in the collision
    --print( event.target.myName .. ": collision began with " .. event.other.myName )

    if ( event.phase == "began" ) then

        --Pop sound
        

        if  (event.target.myName == "zombie1") or 
            (event.target.myName == "zombie2") or
            (event.target.myName == "zombie3") then

            -- add sound effect here
            audio.play(sound3)

            -- remove runtime listeners that move the character
            RemoveArrowEventListeners()
            RemoveRuntimeListeners()


            -- remove the character from the display
            display.remove(character)

            -- decrease number of lives
            numLives = numLives - 1

            if (numLives == 1) then
                -- update hearts
                heart1.isVisible = true
                heart2.isVisible = false
                timer.performWithDelay(200, ReplaceCharacter) 

            elseif (numLives == 0) then
                -- update hearts
                heart1.isVisible = false
                heart2.isVisible = false
                audio.play(sound2)
                timer.performWithDelay(200, YouLoseTransition)
            end
        end

        if  (event.target.myName == "key1") or
            (event.target.myName == "key2") or
            (event.target.myName == "key3") then

            -- get the key that the user hit
            theKey = event.target

            -- stop the character from moving
            motionx = 0

            -- make the character invisible
            character.isVisible = false

            -- show overlay with math question
            composer.showOverlay( "level1_question", { isModal = true, effect = "fade", time = 100})

            -- Increment questions answered
            questionsAnswered = questionsAnswered + 1
        end

        if (event.target.myName == "portal") then
            --check to see if the user has answered 5 questions
            --timer.performWithDelay( 200, YouWinTransition )
            --audio.play(sound1)
            if (questionsAnswered == 3) then
                -- after getting 3 questions right, go to the you win screen
                --check to see if the user has answered 5 questions
                timer.performWithDelay( 200, YouWinTransition )
                audio.play(sound1)
            end
        end        

    end
end


local function AddCollisionListeners()
    -- if character collides with key, onCollision will be called
    zombie1.collision = onCollision
    zombie1:addEventListener( "collision" )
    zombie2.collision = onCollision
    zombie2:addEventListener( "collision" )
    zombie3.collision = onCollision
    zombie3:addEventListener( "collision" )

    -- if character collides with key, onCollision will be called    
    key1.collision = onCollision
    key1:addEventListener( "collision" )
    key2.collision = onCollision
    key2:addEventListener( "collision" )
    key3.collision = onCollision
    key3:addEventListener( "collision" )

    portal.collision = onCollision
    portal:addEventListener( "collision" )
end

local function RemoveCollisionListeners()
    zombie1:removeEventListener( "collision" )
    zombie2:removeEventListener( "collision" )
    zombie3:removeEventListener( "collision" )

    key1:removeEventListener( "collision" )
    key2:removeEventListener( "collision" )
    key3:removeEventListener( "collision" )

    portal:removeEventListener( "collision")

end

local function AddPhysicsBodies()
    --add to the physics engine
    physics.addBody( platform1, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( platform2, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( platform3, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( platform4, "static", { density=1.0, friction=0.3, bounce=0.2 } )

    physics.addBody( zombie1, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( zombie2, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( zombie3, "static", { density=1.0, friction=0.3, bounce=0.2 } )    

    physics.addBody( zombie1platform, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( zombie2platform, "static", { density=1.0, friction=0.3, bounce=0.2 } )
    physics.addBody( zombie3platform, "static", { density=1.0, friction=0.3, bounce=0.2 } )

    physics.addBody(leftW, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody(rightW, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody(topW, "static", {density=1, friction=0.3, bounce=0.2} )
    physics.addBody(floor, "static", {density=1, friction=0.3, bounce=0.2} )

    physics.addBody(key1, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(key2, "static",  {density=0, friction=0, bounce=0} )
    physics.addBody(key3, "static",  {density=0, friction=0, bounce=0} )

    physics.addBody(portal, "static", {density=1, friction=0.3, bounce= 0.2})

end

local function RemovePhysicsBodies()
    physics.removeBody(platform1)
    physics.removeBody(platform2)
    physics.removeBody(platform3)
    physics.removeBody(platform4)

    physics.removeBody(zombie1)
    physics.removeBody(zombie2)
    physics.removeBody(zombie3)

    physics.removeBody(zombie1platform)
    physics.removeBody(zombie2platform)
    physics.removeBody(zombie3platform)

    physics.removeBody(leftW)
    physics.removeBody(rightW)
    physics.removeBody(topW)
    physics.removeBody(floor)
 
end

-----------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-----------------------------------------------------------------------------------------

function ResumeGame()

    -- make character visible again
    character.isVisible = true
    
    if (questionsAnswered > 0) then
        if (theKey ~= nil) and (theKey.isBodyActive == true) then
            physics.removeBody(theKey)
            theKey.isVisible = false
        end
    end

end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level1ScreenNate@2x.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentWidth / 2 
    bkg_image.y = display.contentHeight / 2

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )    
    
    -- Insert the platforms
    platform1 = display.newImageRect("Images//Level1PlatformHunter.png", 340, 50)
    platform1.x = display.contentWidth * 1 / 8
    platform1.y = display.contentHeight * 1.6 / 4
        
    sceneGroup:insert( platform1 )

    platform2 = display.newImageRect("Images//Level1PlatformHunter.png", 150, 50)
    platform2.x = display.contentWidth /2.1
    platform2.y = display.contentHeight * 1.2 / 4
        
    sceneGroup:insert( platform2 )

    platform3 = display.newImageRect("Images//Level1PlatformHunter.png", 180, 50)
    platform3.x = display.contentWidth *1.8 / 5
    platform3.y = display.contentHeight * 3.12 / 5
        
    sceneGroup:insert( platform3 )

    platform4 = display.newImageRect("Images//Level1PlatformHunter.png", 100, 50)
    platform4.x = display.contentWidth *4.7 / 5
    platform4.y = display.contentHeight * 1.3 / 5
        
    sceneGroup:insert( platform4 )

    zombie1 = display.newImageRect("Images/Zombie@2x.png", 70, 150)
    zombie1.x = display.contentWidth * 3 / 8
    zombie1.y = display.contentHeight * 2.5 / 5
    zombie1.myName = "zombie1"
        
    sceneGroup:insert( zombie1)

    zombie1platform = display.newImageRect("Images//Level1PlatformHunter.png", 30, 125)
    zombie1platform.x = display.contentWidth * 6.3 / 8
    zombie1platform.y = display.contentHeight * 0.37 / 5
        
    sceneGroup:insert( zombie1platform)

    zombie2 = display.newImageRect("Images/Zombie@2x.png", 70, 150)
    zombie2.x = display.contentWidth * 2.18 / 8
    zombie2.y = display.contentHeight * 1.37 / 5
    zombie2.myName = "zombie2"
        
    sceneGroup:insert( zombie2)

    zombie2platform = display.newImageRect("Images//Level1PlatformHunter.png", 150, 50)
    zombie2platform.x = display.contentWidth * 0.72 / 8
    zombie2platform.y = display.contentHeight * 3.63 / 5
        
    sceneGroup:insert( zombie2platform)

    zombie3 = display.newImageRect("Images/Zombie@2x.png", 70, 150)
    zombie3.x = display.contentWidth * 7.3 / 8
    zombie3.y = display.contentHeight * 2.87 / 5
    zombie3.myName = "zombie3"
        
    sceneGroup:insert( zombie3)

    zombie3platform = display.newImageRect("Images/Level1PlatformHunter.png", 150, 50)
    zombie3platform.x = display.contentWidth * 7.3 / 8
    zombie3platform.y = display.contentHeight * 3.5 / 5
        
    sceneGroup:insert( zombie3platform)

    -- Insert the torchesAndSign Objects
    --torchesAndSign = display.newImageRect("Images/Level-1Random.png", display.contentWidth, display.contentHeight)
    --torchesAndSign.x = display.contentCenterX
    --torchesAndSign.y = display.contentCenterY + 10

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    --sceneGroup:insert( torchesAndSign )

    -- Insert the portal
    portal = display.newImageRect("Images/portalNate@2x.png", 170, 170)
    portal.x = display.contentWidth/10
    portal.y = display.contentHeight*6.1/7
    portal.myName = "portal"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( portal )

    -- Insert the Hearts
    heart1 = display.newImageRect("Images/HeartHunter@2x.png", 80, 80)
    heart1.x = 50
    heart1.y = 50
    heart1.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart1 )

    heart2 = display.newImageRect("Images/HeartHunter@2x.png", 80, 80)
    heart2.x = 130
    heart2.y = 50
    heart2.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart2 )

    --Insert the right arrow
    rArrow = display.newImageRect("Images/RightArrowUnpressed@2x.png", 100, 50)
    rArrow.x = display.contentWidth * 9.2 / 10
    rArrow.y = display.contentHeight * 9.5 / 10
   
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( rArrow)

    --Insert the left arrow
    lArrow = display.newImageRect("Images/LeftArrowUnpressed@2x.png", 100, 50)
    lArrow.x = display.contentWidth * 7.3 / 10
    lArrow.y = display.contentHeight * 9.5 / 10
   
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( lArrow)

    --Insert the left arrow
    uArrow = display.newImageRect("Images/UpArrowUnpressed@2x.png", 50, 100)
    uArrow.x = display.contentWidth * 8.2 / 10
    uArrow.y = display.contentHeight * 8.5 / 10

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( uArrow)

    --WALLS--
    leftW = display.newLine( 0, 0, 0, display.contentHeight)
    leftW.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( leftW )



    rightW = display.newLine( 0, 0, 0, display.contentHeight)
    rightW.x = display.contentCenterX * 2
    rightW.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( rightW )

    topW = display.newLine( 0, 0, display.contentWidth, 0)
    topW.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( topW )

    floor = display.newImageRect("Images/Floor@2x.png", 1024, 110)
    floor.x = display.contentCenterX
    floor.y = display.contentHeight * 1.06
    
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( floor )

    --key1
    key1 = display.newImageRect ("Images/KeyObjectNate@2x.png", 70, 70)
    key1.x = 90
    key1.y = 500
    key1.myName = "key1"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( key1 )

    --key2
    key2 = display.newImageRect ("Images/KeyObjectNate@2x.png", 70, 70)
    key2.x = 490
    key2.y = 170
    key2.myName = "key2"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( key2 )

    --key3
    key3 = display.newImageRect ("Images/KeyObjectNate@2x.png", 70, 70)
    key3.x = 963
    key3.y = 130
    key3.myName = "key3"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( key3 )

end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------
        -- start physics
        physics.start()

        -- set gravity
        physics.setGravity( 0, GRAVITY )

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        numLives = 2
        questionsAnswered = 0

        -- make all soccer key visible
        MakeSoccerBallsVisible()

        -- make all lives visible
        MakeHeartsVisible()

        -- add physics bodies to each object
        AddPhysicsBodies()

        -- add collision listeners to objects
        AddCollisionListeners()

        -- create the character, add physics bodies and runtime listeners
        ReplaceCharacter()

        Runtime:addEventListener("enterFrame", MoveZombie1)
        Runtime:addEventListener("enterFrame", MoveZombie2)
        Runtime:addEventListener("enterFrame", MoveZombie3)
        Runtime:addEventListener("enterFrame", SpinPortal)
      
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        RemoveCollisionListeners()
        RemovePhysicsBodies()

        physics.stop()
        RemoveArrowEventListeners()
        RemoveRuntimeListeners()
        display.remove(character)

        Runtime:removeEventListener("enterFrame", MoveZombie1)
        Runtime:removeEventListener("enterFrame", MoveZombie2)
        Runtime:removeEventListener("enterFrame", MoveZombie3)
        Runtime:removeEventListener("enterFrame", SpinPortal)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

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