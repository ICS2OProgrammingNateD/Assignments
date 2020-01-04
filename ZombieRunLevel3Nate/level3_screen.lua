-----------------------------------------------------------------------------------------
--
-- level3_screen.lua
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


-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-- load physics
local physics = require("physics")

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level3_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )



-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene

-- create variable for sound
local sound1 = audio.loadSound("Sounds/YouWinSound.wav")
local sound2 = audio.loadSound("Sounds/YouLoseSound.wav")
local sound3 = audio.loadSound("Sounds/zombiesound.wav")
local sound4 = audio.loadSound("Sounds/keysound.wav")
local sound5 = audio.loadSound("Sounds/Bubbles.wav")



local bkg_image

local platform1
local platform2
local platform3
local platform4

local zombie1
local zombie2
local zombie3
local zombie4

local bubbles1
local bubbles2
local bubbles3

--local zombie1platform
local zombie2platform
local zombie3platform

local torchesAndSign
local portal
local character
local shark

local heart1
local heart2
local heart3
local numLives = 3

local rArrow 
local lArrow
local uArrow

local motionx = 0

local _SPEED = -9
local SPEED = 9

local LINEAR_VELOCITY = -200
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
local scrollSpeed2 = 0.6
local scrollSpeed3 = 2
local scrollSpeed4 = 2
local scrollSpeed5 = 4

local scrollSpeedY = 2


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

local function ReplaceShark()
    shark.x = display.contentWidth * 0.2 / 8
    shark.y = display.contentHeight  * 2.6/ 3

    -- prevent character from being able to tip over
    shark.isFixedRotation = true
end

local function MoveShark(event)
-- add the scroll speed to the x-value of the character
    shark.alpha = 1 
    shark.x = shark.x + scrollSpeed5


    -- this makes the image respond to hitting a wall
    if (shark.x < 1) then 
        shark.x = shark.x + 3 scrollSpeed5 = -scrollSpeed5
    end

    if(shark.x > 1200) then 
        --shark.isVisible = false
       timer.performWithDelay(20000, ReplaceShark) 
    end
end

-- make a function that fades in building GAMES
local function FadeBubbles(event)
    
    -- change the transparency of the ship every time it moves so that it fades in
    bubbles1.alpha = bubbles1.alpha + 0.01
    bubbles2.alpha = bubbles2.alpha + 0.01
    bubbles3.alpha = bubbles3.alpha + 0.01
    audio.play(sound5)    
end

-- Function: Moveship
-- Input: this function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveBubbles1(event)
    -- add the scroll speed to the x-value of the ship
    bubbles1.y = bubbles1.y - scrollSpeedY
    -- change the transparency of the ship every time it moves so that it fades out
    bubbles1.alpha = bubbles1.alpha - 0.01
    timer.performWithDelay( 1700, FadeBubbles)
end

-- Function: Moveship
-- Input: this function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveBubbles2(event)
    -- add the scroll speed to the x-value of the ship
    bubbles2.y = bubbles2.y - scrollSpeedY
    -- change the transparency of the ship every time it moves so that it fades out
    bubbles2.alpha = bubbles2.alpha - 0.01
    timer.performWithDelay( 1700, FadeBubbles)
end

-- Function: Moveship
-- Input: this function accepts an event listener
-- Output: None
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveBubbles3(event)
    -- add the scroll speed to the x-value of the ship
    bubbles3.y = bubbles3.y - scrollSpeedY
    -- change the transparency of the ship every time it moves so that it fades out
    bubbles3.alpha = bubbles3.alpha - 0.01
    timer.performWithDelay( 1700, FadeBubbles)
end


-- Function: move zombie

local function MoveZombie1(event)
-- add the scroll speed to the x-value of the character
    zombie1.alpha = 1 
    zombie1.x = zombie1.x + scrollSpeed3


    -- I got the base of this information from stackoverflow how to make multiple objects bounce around in Corona sdk
    -- this makes the image respond to hitting a wall
    if (zombie1.x < 530) then 
        zombie1.x = zombie1.x + 3 scrollSpeed3 = -scrollSpeed3
    end

    if(zombie1.x > 650) then 
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

    if(zombie2.x > 600) then 
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
    if (zombie3.x < 438) then 
        zombie3.x = zombie3.x + 3 scrollSpeed1 = -scrollSpeed1
    end

    if(zombie3.x > 542) then 
        zombie3.x = zombie3.x - 3 scrollSpeed1 = -scrollSpeed1
    end
end

local function MoveZombie4(event)
-- add the scroll speed to the x-value of the character
    zombie4.alpha = 1 
    zombie4.x = zombie4.x + scrollSpeed4


    -- I got the base of this information from stackoverflow how to make multiple objects bounce around in Corona sdk
    -- this makes the image respond to hitting a wall
    if (zombie4.x < 1) then 
        zombie4.x = zombie4.x + 3 scrollSpeed4 = -scrollSpeed4
        --MoveShark()

    end

    if(zombie4.x > 1000) then 
        zombie4.x = zombie4.x - 3 scrollSpeed4 = -scrollSpeed4
        MoveShark()
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
    Runtime:addEventListener("enterFrame", MoveShark)
    Runtime:addEventListener("enterFrame", MoveBubbles1)
    Runtime:addEventListener("enterFrame", MoveBubbles2)
    Runtime:addEventListener("enterFrame", MoveBubbles3)
end

local function RemoveRuntimeListeners()
    Runtime:removeEventListener("enterFrame", movePlayer)
    Runtime:removeEventListener("touch", stop )
    Runtime:removeEventListener("enterFrame", MoveShark)
    Runtime:removeEventListener("enterFrame", MoveBubbles1)
    Runtime:removeEventListener("enterFrame", MoveBubbles2)
    Runtime:removeEventListener("enterFrame", MoveBubbles3)
end


local function ReplaceCharacter()
    character = display.newImageRect("Images/Character1@2x.png", 60, 120)
    character.x = display.contentWidth * 7.4 / 8
    character.y = display.contentHeight  * 0.2/ 3
    character.width = 80
    character.height = 120
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
    heart3.isVisible = true
end

local function YouLoseTransition()
    composer.gotoScene( "you_lose" )
end

local function YouWinTransition()
    composer.gotoScene( "you_win" )
end

--local function Level4Transition()
    --composer.gotoScene( "level4_screen" )
--end

local function onCollision( self, event )


    if ( event.phase == "began" ) then

        --zombie sound
        -- add sound effect here
        --audio.play(sound3)

        if  (event.target.myName == "zombie1") or 
            (event.target.myName == "zombie2") or
            (event.target.myName == "zombie3") or
            (event.target.myName == "shark") or
            (event.target.myName == "zombie4") then

            -- add sound effect here
            audio.play(sound3)

            -- remove runtime listeners that move the character
            RemoveArrowEventListeners()
            RemoveRuntimeListeners()


            -- remove the character from the display
            display.remove(character)

            -- decrease number of lives
            numLives = numLives - 1

            if (numLives == 2) then
                -- update hearts
                heart1.isVisible = true
                heart2.isVisible = true
                heart3.isVisible = false
                ReplaceShark()
                timer.performWithDelay(200, ReplaceCharacter) 


            elseif (numLives == 1) then
                -- update hearts
                heart1.isVisible = true
                heart2.isVisible = false
                heart3.isVisible = false
                ReplaceShark()

                timer.performWithDelay(200, ReplaceCharacter) 

            elseif (numLives == 0) then
                -- update hearts
                heart1.isVisible = false
                heart2.isVisible = false
                heart3.isVisible = false
                ReplaceShark()

                audio.play(sound2)
                timer.performWithDelay(200, YouLoseTransition)
            end
        end

        if  (event.target.myName == "key1") or
            (event.target.myName == "key2") or
            (event.target.myName == "key3") then

            -- get the key that the user hit
            theKey = event.target

            -- add sound effect here
            audio.play(sound4)

            -- stop the character from moving
            motionx = 0

            -- make the character invisible
            character.isVisible = false

            -- show overlay with math question
            composer.showOverlay( "level3_question", { isModal = true, effect = "fade", time = 100})

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

-- create a pause screen transition
local function PauseScreenTransition()
    composer.showOverlay( "level3_pause", { isModal = true, effect = "fade", time = 100})
end   


local function AddCollisionListeners()
    -- if character collides with key, onCollision will be called
    zombie1.collision = onCollision
    zombie1:addEventListener( "collision" )
    zombie2.collision = onCollision
    zombie2:addEventListener( "collision" )
    zombie3.collision = onCollision
    zombie3:addEventListener( "collision" )
    zombie4.collision = onCollision
    zombie4:addEventListener( "collision" )
    shark.collision = onCollision
    shark:addEventListener( "collision" )

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
   -- print ("***Level3: Called RemoveCollisionListeners")
    zombie1:removeEventListener( "collision" )
    zombie2:removeEventListener( "collision" )
    zombie3:removeEventListener( "collision" )
    zombie4:removeEventListener( "collision" )
    shark:removeEventListener( "collision" )

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
    physics.addBody( zombie4, "static", { density=1.0, friction=0.3, bounce=0.2 } )    
    physics.addBody( shark, "static", { density=1.0, friction=0.3, bounce=0.2 } )    

    --physics.addBody( zombie1platform, "static", { density=1.0, friction=0.3, bounce=0.2 } )
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
    --print ("***Level 3: Called RemovePhysicsBodies")
    physics.removeBody(platform1)
    physics.removeBody(platform2)
    physics.removeBody(platform3)
    physics.removeBody(platform4)

    physics.removeBody(zombie1)
    physics.removeBody(zombie2)
    physics.removeBody(zombie3)
    physics.removeBody(zombie4)
    physics.removeBody(shark)

    --physics.removeBody(zombie1platform)
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

function ResumeGameLevel3()

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

     -- Creating Play Button
    pauseButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/16,
            y = display.contentHeight*0.3/8,
            
            -- Setting Dimensions
            width = 80,
            height = 50,

            -- Insert the images here
            defaultFile = "Images/PauseButtonUnpressed.png",
            overFile = "Images/PauseButtonPressedHunter.png", 

            -- When the button is released, call the Level3 screen transition function
            onRelease = PauseScreenTransition
            
        } )

    sceneGroup:insert( pauseButton )

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level3ScreenNate@2x.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentWidth / 2 
    bkg_image.y = display.contentHeight / 2

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )
    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()    
    
    -- Insert the platforms
    platform1 = display.newImageRect("Images//Level3platformNate@2x.png", 150, 50)
    platform1.x = display.contentWidth * 0.6 / 8
    platform1.y = display.contentHeight * 1.6 / 4
        
    sceneGroup:insert( platform1 )

    platform2 = display.newImageRect("Images//Level3platformNate@2x.png", 150, 50)
    platform2.x = display.contentWidth /2.1
    platform2.y = display.contentHeight * 1.2 / 4
        
    sceneGroup:insert( platform2 )

    platform3 = display.newImageRect("Images//Level3platformNate@2x.png", 180, 50)
    platform3.x = display.contentWidth *2.9 / 5
    platform3.y = display.contentHeight * 3.12 / 5
        
    sceneGroup:insert( platform3 )

    platform4 = display.newImageRect("Images//Level3platformNate@2x.png", 100, 50)
    platform4.x = display.contentWidth *4.7 / 5
    platform4.y = display.contentHeight * 1.3 / 5
        
    sceneGroup:insert( platform4 )

    zombie1 = display.newImageRect("Images/skeletonNate@2x.png", 70, 150)
    zombie1.x = display.contentWidth * 5 / 8
    zombie1.y = display.contentHeight * 2.5 / 5
    zombie1.myName = "zombie1"
        
    sceneGroup:insert( zombie1)

    --zombie1platform = display.newImageRect("Images//Level3platformNate@2x.png", 30, 125)
    --zombie1platform.x = display.contentWidth * 99 / 8
    --zombie1platform.y = display.contentHeight * 0.37 / 5
        
    --sceneGroup:insert( zombie1platform)

    zombie2 = display.newImageRect("Images/skeletonNate@2x.png", 70, 150)
    zombie2.x = display.contentWidth * 2.18 / 8
    zombie2.y = display.contentHeight * 4.5 / 5
    zombie2.myName = "zombie2"
        
    sceneGroup:insert( zombie2)

    zombie2platform = display.newImageRect("Images//Level3platformNate@2x.png", 150, 50)
    zombie2platform.x = display.contentWidth * 0.72 / 8
    zombie2platform.y = display.contentHeight * 3.63 / 5
        
    sceneGroup:insert( zombie2platform)

    zombie3 = display.newImageRect("Images/skeletonNate@2x.png", 70, 150)
    zombie3.x = display.contentWidth * 4 / 8
    zombie3.y = display.contentHeight * 0.88 / 5
    zombie3.myName = "zombie3"
        
    sceneGroup:insert( zombie3)

    zombie3platform = display.newImageRect("Images/Level3platformNate@2x.png", 150, 50)
    zombie3platform.x = display.contentWidth * 7.3 / 8
    zombie3platform.y = display.contentHeight * 3.5 / 5
        
    sceneGroup:insert( zombie3platform)

    zombie4 = display.newImageRect("Images/skeletonNate@2x.png", 70, 150)
    zombie4.x = display.contentWidth * 0.5 / 8
    zombie4.y = display.contentHeight * -1 / 5
    zombie4.myName = "zombie4"
        
    sceneGroup:insert( zombie4)

    -- Insert the portal
    portal = display.newImageRect("Images/PortalNate@2x.png", 170, 170)
    portal.x = display.contentWidth *4.6 / 5
    portal.y = display.contentHeight * 4.3 / 5
    portal.myName = "portal"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( portal )

    -- Insert the Hearts
    heart1 = display.newImageRect("Images/HeartHunter@2x.png", 50, 50)
    heart1.x = 30
    heart1.y = 75
    heart1.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart1 )

    heart2 = display.newImageRect("Images/HeartHunter@2x.png", 50, 50)
    heart2.x = 70
    heart2.y = 75
    heart2.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart2 )

    heart3 = display.newImageRect("Images/HeartHunter@2x.png", 50, 50)
    heart3.x = 110
    heart3.y = 75
    heart3.isVisible = true

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( heart3 )

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
    key2.x = 940
    key2.y = 480
    key2.myName = "key2"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( key2 )

    --key3
    key3 = display.newImageRect ("Images/KeyObjectNate@2x.png", 70, 70)
    key3.x = 50
    key3.y = 250
    key3.myName = "key3"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( key3 )

    shark = display.newImageRect("Images/SharkNate@2x.png", 170, 130)
    shark.x = display.contentWidth * 0 / 10
    shark.y = display.contentHeight * 8.5 / 10
    shark:scale(-1, 1)
    shark.myName = "shark"
    
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( shark )

    --bubbles
    bubbles1 = display.newImageRect ("Images/BubblesNate@2x.png", 30, 70)
    bubbles1.x = 550
    bubbles1.y = 50
    bubbles1.myName = "bubbles1"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bubbles1 )

    --bubbles
    bubbles2 = display.newImageRect ("Images/BubblesNate@2x.png", 30, 70)
    bubbles2.x = 650
    bubbles2.y = 270
    bubbles2.myName = "bubbles2"
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bubbles2 )

    --bubbles
    bubbles3 = display.newImageRect ("Images/BubblesNate@2x.png", 30, 70)
    bubbles3.x = 600
    bubbles3.y = 650
    bubbles3.myName = "bubbles3"

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bubbles3 )
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
        --physics.start()

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.

        numLives = 3
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

        ReplaceShark()

        Runtime:addEventListener("enterFrame", MoveZombie1)
        Runtime:addEventListener("enterFrame", MoveZombie2)
        Runtime:addEventListener("enterFrame", MoveZombie3)
        Runtime:addEventListener("enterFrame", MoveZombie4)
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
        -- Called immediately after scene goes off screen.
        


    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        RemoveCollisionListeners()
        RemovePhysicsBodies()
        RemoveArrowEventListeners()
        RemoveRuntimeListeners()
        display.remove(character)
        --physics.stop()
        
        Runtime:removeEventListener("enterFrame", MoveZombie1)
        Runtime:removeEventListener("enterFrame", MoveZombie2)
        Runtime:removeEventListener("enterFrame", MoveZombie3)
        Runtime:removeEventListener("enterFrame", MoveZombie4)
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