-----------------------------------------------------------------------------------------
--
-- level3_screen.lua
-- Created by: Nate
-- Date: Nov 30, 2019
-- Description: This is the level 1 screen of the game. the charater can be dragged to move
--If character goes off a certain araea they go back to the start. When a user interactes
--with piant a trivia question will come up. they will have a limited time to click on the answer
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level3_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local questionText

local selectQuestion

local answerText 
local wrongText1
local wrongText2
local wrongText3

local answerPosition = 1
local bkg
local cover

local X1 = display.contentWidth*2/7
local X2 = display.contentWidth*4/7
local Y1 = display.contentHeight*1/2
local Y2 = display.contentHeight*5.5/7


local textTouched = false

local correctObject
local incorrectObject

local sound1 = audio.loadSound("Sounds/correct.mp3")
local sound1Channel
local sound2 = audio.loadSound("Sounds/incorrect.wav")
local sound2Channel

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------



-- set the answer (when wrong) to display incorrect
local function Hideincorrect()
    incorrectObject.isVisible = false
    correctObject.isVisible = false
end


--making transition to next scene
local function BackToLevel3() 
    composer.hideOverlay("crossFade", 400 )
  
    ResumeGameLevel3()
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)

    
    if (touch.phase == "ended") then
        sound1Channel = audio.play(sound1)
        correctObject.isVisible = true
        timer.performWithDelay(500, Hideincorrect)
        timer.performWithDelay(500, BackToLevel3)
    
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    
    if (touch.phase == "ended") then
        sound2Channel = audio.play(sound2)
        incorrectObject.isVisible = true
        timer.performWithDelay(500, Hideincorrect)
        timer.performWithDelay(500, BackToLevel3)
        
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    
    if (touch.phase == "ended") then
        sound2Channel = audio.play(sound2)
        incorrectObject.isVisible = true
        timer.performWithDelay(500, Hideincorrect)
        timer.performWithDelay(500, BackToLevel3)
        
    end 
end


local function TouchListenerWrongAnswer3(touch)
    
    if (touch.phase == "ended") then
        sound2Channel = audio.play(sound2)
        incorrectObject.isVisible = true
        timer.performWithDelay(500, Hideincorrect)
        timer.performWithDelay(500, BackToLevel3)
        
    end 
end

--adding the event listeners 
local function AddTextListeners ( )
    answerText:addEventListener( "touch", TouchListenerAnswer )
    wrongText1:addEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:addEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:addEventListener( "touch", TouchListenerWrongAnswer3)
end

--removing the event listeners
local function RemoveTextListeners()
    answerText:removeEventListener( "touch", TouchListenerAnswer )
    wrongText1:removeEventListener( "touch", TouchListenerWrongAnswer)
    wrongText2:removeEventListener( "touch", TouchListenerWrongAnswer2)
    wrongText3:removeEventListener( "touch", TouchListenerWrongAnswer3)
end

local function DisplayQuestion()
    --creating random numbers
    selectQuestion = math.random (1,20)

    if (selectQuestion == 1) then

        -- create question 
        questionText.text = "What does your body need to grow?"

        -- creating answer text 
        answerText.text = "Nutrients"

        -- create wrong answers 
        wrongText1.text = "Candy"

        wrongText2.text = "Video Games"

        wrongText3.text = "Chips"

    elseif (selectQuestion == 2) then 
        -- create question 
        questionText.text = "Which of these is a fruit?"

        -- creating answer text 
        answerText.text = "Orange"

        -- create wrong answers 
        wrongText1.text = "Potato"

        wrongText2.text = "Rice"

        wrongText3.text = "Chicken"

    elseif (selectQuestion == 3) then 
        -- create question 
        questionText.text = "Which of these is a grain?"

        -- creating answer text 
        answerText.text = "Bread"

        -- create wrong answers 
        wrongText1.text = "Tomato"

        wrongText2.text = "Carrot"

        wrongText3.text = "Milk"

    elseif (selectQuestion == 4) then 
        -- create question 
        questionText.text = "Which of these is a vegetable?"

        -- creating answer text 
        answerText.text = "Broccoli"

        -- create wrong answers 
        wrongText1.text = "Peanut"

        wrongText2.text = "Flour"

        wrongText3.text = "Orange"

    elseif (selectQuestion == 5) then 
        -- create question 
        questionText.text = "How could get fit?"

        -- creating answer text 
        answerText.text = "Exercise"

        -- create wrong answers 
        wrongText1.text = "Video Games"

        wrongText2.text = "Snacks"

        wrongText3.text = "TV"

    elseif (selectQuestion == 6) then 
        -- create question 
        questionText.text = "Which of these is not exercise?"

        -- creating answer text 
        answerText.text = "Sleeping"

        -- create wrong answers 
        wrongText1.text = "Basketball"

        wrongText2.text = "Running"

        wrongText3.text = "Swimming"

    elseif (selectQuestion == 7) then 
        -- create question 
        questionText.text = "What is the longest bone in our body?"

        -- creating answer text 
        answerText.text = "Femur"

        -- create wrong answers 
        wrongText1.text = "Arm"

        wrongText2.text = "Spine"

        wrongText3.text = "Finger"


    elseif (selectQuestion == 8) then 
        -- create question 
        questionText.text = "What animal has a skeleton like yours?"

        -- creating answer text 
        answerText.text = "Chimpanzee"

        -- create wrong answers 
        wrongText1.text = "Cat"

        wrongText2.text = "Bat"

        wrongText3.text = "Frog"
    elseif (selectQuestion == 9) then 
        -- create question 
        questionText.text = "Which type of blood cells fight infection?"

        -- creating answer text 
        answerText.text = "White"

        -- create wrong answers 
        wrongText1.text = "Brown"

        wrongText2.text = "Blue"

        wrongText3.text = "Red"

    elseif (selectQuestion == 10) then 
        -- create question 
        questionText.text = "How many teeth do most adults have?"

        -- creating answer text 
        answerText.text = "32"

        -- create wrong answers 
        wrongText1.text = "24"

        wrongText2.text = "18"

        wrongText3.text = "46"

    elseif (selectQuestion == 11) then 
        -- create question 
        questionText.text = "What is the heaviest organ in your body?"

        -- creating answer text 
        answerText.text = "Skin"

        -- create wrong answers 
        wrongText1.text = "Brain"

        wrongText2.text = "Liver"

        wrongText3.text = "Kidney"

    elseif (selectQuestion == 12) then 
        -- create question 
        questionText.text = "How many bones are in a adult body?"

        -- creating answer text 
        answerText.text = "206"

        -- create wrong answers 
        wrongText1.text = "200"

        wrongText2.text = "158"

        wrongText3.text = "243"

    elseif (selectQuestion == 13) then 
        -- create question 
        questionText.text = "Where is the smallest bone in your body?"

        -- creating answer text 
        answerText.text = "Ear"

        -- create wrong answers 
        wrongText1.text = "Foot"

        wrongText2.text = "Mouth"

        wrongText3.text = "Hand"

    elseif (selectQuestion == 14) then 
        -- create question 
        questionText.text = "What does your heart do?"

        -- creating answer text 
        answerText.text = "Pump blood"

        -- create wrong answers 
        wrongText1.text = "Think"

        wrongText2.text = "Breathe"

        wrongText3.text = "Hiccup"

    elseif (selectQuestion == 15) then 
        -- create question 
        questionText.text = "Where are new blood cells made?"

        -- creating answer text 
        answerText.text = "Bones"

        -- create wrong answers 
        wrongText1.text = "Heart"

        wrongText2.text = "Brain"

        wrongText3.text = "Liver"

    elseif (selectQuestion == 16) then 
        -- create question 
        questionText.text = "Which muscle is the strongest?"

        -- creating answer text 
        answerText.text = "Jaw"

        -- create wrong answers 
        wrongText1.text = "Arm"

        wrongText2.text = "Leg"

        wrongText3.text = "Back"

    elseif (selectQuestion == 17) then 
        -- create question 
        questionText.text = "Which helps you keep your balance?"

        -- creating answer text 
        answerText.text = "Ear"

        -- create wrong answers 
        wrongText1.text = "Hair"

        wrongText2.text = "Hands"

        wrongText3.text = "Heart"

    elseif (selectQuestion == 18) then 
        -- create question 
        questionText.text = "How many senses are there?"

        -- creating answer text 
        answerText.text = "5"

        -- create wrong answers 
        wrongText1.text = "3"

        wrongText2.text = "4"

        wrongText3.text = "6"


    elseif (selectQuestion == 19) then 
        -- create question 
        questionText.text = "How many lungs does the body have?"

        -- creating answer text 
        answerText.text = "Two"

        -- create wrong answers 
        wrongText1.text = "Three"

        wrongText2.text = "One"

        wrongText3.text = "Four"


    elseif (selectQuestion == 20) then 
        -- create question 
        questionText.text = "What allows your tongue to taste?"

        -- creating answer text 
        answerText.text = "Taste buds"

        -- create wrong answers 
        wrongText1.text = "Taste roots"

        wrongText2.text = "Dimples"

        wrongText3.text = "Pimples"


    end
end

local function PositionAnswers()

    --creating random start position in a cretain area
    answerPosition = math.random(1,4)

    if (answerPosition == 1) then

        answerText.x = X1
        answerText.y = Y1
        
        wrongText1.x = X1
        wrongText1.y = Y2
        
        wrongText2.x = X2
        wrongText2.y = Y1

        wrongText3.x = X2
        wrongText3.y = Y2


        
    elseif (answerPosition == 2) then

        answerText.x = X1
        answerText.y = Y2
            
        wrongText1.x = X2
        wrongText1.y = Y1
            
        wrongText2.x = X2
        wrongText2.y = Y2

        wrongText3.x = X1
        wrongText3.y = Y1


    elseif (answerPosition == 3) then

        answerText.x = X2
        answerText.y = Y1
            
        wrongText1.x = X2
        wrongText1.y = Y2
            
        wrongText2.x = X1
        wrongText2.y = Y1

        wrongText3.x = X1
        wrongText3.y = Y2

    elseif (answerPosition == 4) then

        answerText.x = X2
        answerText.y = Y2
            
        wrongText1.x = X1
        wrongText1.y = Y1
            
        wrongText2.x = X1
        wrongText2.y = Y2

        wrongText3.x = X2
        wrongText3.y = Y1
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
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(0/255, 25/255, 52/255)

    -- create the question text object
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 40)

    -- create the answer text object & wrong answer text objects
    answerText = display.newText("", X1, Y2, Arial, 40)
    answerText.anchorX = 0
    wrongText1 = display.newText("", X2, Y2, Arial, 40)
    wrongText1.anchorX = 0
    wrongText2 = display.newText("", X1, Y1, Arial, 40)
    wrongText2.anchorX = 0
    wrongText3 = display.newText("", X2, Y1, Arial, 40)
    wrongText3.anchorX = 0


    -- create the correct text object and make it invisible
    correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
    correctObject:setTextColor(.2, 1, 0)
    correctObject.isVisible = false

    -- create the incorrect text object and make it invisible
    incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
    incorrectObject:setTextColor(1, 0, 0)
    incorrectObject.isVisible = false
    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(questionText)
    sceneGroup:insert(answerText)
    sceneGroup:insert(wrongText1)
    sceneGroup:insert(wrongText2)
    sceneGroup:insert(wrongText3)


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

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        DisplayQuestion()
        PositionAnswers()
        AddTextListeners()
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
        RemoveTextListeners()
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