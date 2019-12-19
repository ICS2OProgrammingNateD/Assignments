-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
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
sceneName = "level1_question"

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
local function BackToLevel1() 
    composer.hideOverlay("crossFade", 400 )
  
    ResumeGame()
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerAnswer(touch)

    
    if (touch.phase == "ended") then
        sound1Channel = audio.play(sound1)
        correctObject.isVisible = true
        timer.performWithDelay(500, Hideincorrect)
        timer.performWithDelay(500, BackToLevel1)
    
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer(touch)
    
    if (touch.phase == "ended") then
        sound2Channel = audio.play(sound2)
        incorrectObject.isVisible = true
        timer.performWithDelay(500, Hideincorrect)
        timer.performWithDelay(500, BackToLevel1)
        
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerWrongAnswer2(touch)
    
    if (touch.phase == "ended") then
        sound2Channel = audio.play(sound2)
        incorrectObject.isVisible = true
        timer.performWithDelay(500, Hideincorrect)
        timer.performWithDelay(500, BackToLevel1)
        
    end 
end


local function TouchListenerWrongAnswer3(touch)
    
    if (touch.phase == "ended") then
        sound2Channel = audio.play(sound2)
        incorrectObject.isVisible = true
        timer.performWithDelay(500, Hideincorrect)
        timer.performWithDelay(500, BackToLevel1)
        
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
        questionText.text = "What colour is the sun?"

        -- creating answer text 
        answerText.text = "Yellow"

        -- create wrong answers 
        wrongText1.text = "Orange"

        wrongText2.text = "Black"

        wrongText3.text = "Blue"

    elseif (selectQuestion == 2) then 
        -- create question 
        questionText.text = "Which colour is a leaf not in fall?"

        -- creating answer text 
        answerText.text = "Blue"

        -- create wrong answers 
        wrongText1.text = "Red"

        wrongText2.text = "Yellow"

        wrongText3.text = "Brown"

    elseif (selectQuestion == 3) then 
        -- create question 
        questionText.text = "What colour is healthy soil?"

        -- creating answer text 
        answerText.text = "Brown"

        -- create wrong answers 
        wrongText1.text = "Green"

        wrongText2.text = "Dark Red"

        wrongText3.text = "Light Green"

    elseif (selectQuestion == 4) then 
        -- create question 
        questionText.text = "What colour is Mars?"

        -- creating answer text 
        answerText.text = "Dark Red"

        -- create wrong answers 
        wrongText1.text = "Green"

        wrongText2.text = "Light Red"

        wrongText3.text = "Orange"

    elseif (selectQuestion == 5) then 
        -- create question 
        questionText.text = "What colour is Neptune?"

        -- creating answer text 
        answerText.text = "Blue"

        -- create wrong answers 
        wrongText1.text = "Red"

        wrongText2.text = "Black"

        wrongText3.text = "Purple"

    elseif (selectQuestion == 6) then 
        -- create question 
        questionText.text = "What kind of colour is black?"

        -- creating answer text 
        answerText.text = "A shade"

        -- create wrong answers 
        wrongText1.text = "Happy"

        wrongText2.text = "Fun"

        wrongText3.text = "Bright"

    elseif (selectQuestion == 7) then 
        -- create question 
        questionText.text = "Which colour is a shade?"

        -- creating answer text 
        answerText.text = "Black"

        -- create wrong answers 
        wrongText1.text = "Yellow"

        wrongText2.text = "Blue"

        wrongText3.text = "Orange"


    elseif (selectQuestion == 8) then 
        -- create question 
        questionText.text = "Which colour is the brightest?"

        -- creating answer text 
        answerText.text = "Yellow"

        -- create wrong answers 
        wrongText1.text = "Green"

        wrongText2.text = "Orange"

        wrongText3.text = "Red"

    elseif (selectQuestion == 9) then 
        -- create question 
        questionText.text = "Which colour is not in the rainbow?"

        -- creating answer text 
        answerText.text = "Brown"

        -- create wrong answers 
        wrongText1.text = "Purple"

        wrongText2.text = "Blue"

        wrongText3.text = "Red"

    elseif (selectQuestion == 10) then 
        -- create question 
        questionText.text = "How many colours are in the rainbow?"

        -- creating answer text 
        answerText.text = "Seven"

        -- create wrong answers 
        wrongText1.text = "Nine"

        wrongText2.text = "Four"

        wrongText3.text = "Eleven"

    elseif (selectQuestion == 11) then 
        -- create question 
        questionText.text = "Which of the following is red?"

        -- creating answer text 
        answerText.text = "Stop sign"

        -- create wrong answers 
        wrongText1.text = "Clouds"

        wrongText2.text = "Tiger"

        wrongText3.text = "Bear"

    elseif (selectQuestion == 12) then 
        -- create question 
        questionText.text = "Which of the following is white?"

        -- creating answer text 
        answerText.text = "Polar Bear"

        -- create wrong answers 
        wrongText1.text = "Grass"

        wrongText2.text = "Gorilla"

        wrongText3.text = "Car Tire"

    elseif (selectQuestion == 13) then 
        -- create question 
        questionText.text = "Which of the following is orange?"

        -- creating answer text 
        answerText.text = "Carrot"

        -- create wrong answers 
        wrongText1.text = "Trees"

        wrongText2.text = "Lion"

        wrongText3.text = "Whale"

    elseif (selectQuestion == 14) then 
        -- create question 
        questionText.text = "Which of the following is blue?"

        -- creating answer text 
        answerText.text = "Whale"

        -- create wrong answers 
        wrongText1.text = "Walrus"

        wrongText2.text = "Killer Whale"

        wrongText3.text = "Octopus"

    elseif (selectQuestion == 15) then 
        -- create question 
        questionText.text = "Which of the following is not a colour?"

        -- creating answer text 
        answerText.text = "Black"

        -- create wrong answers 
        wrongText1.text = "Blue"

        wrongText2.text = "Orange"

        wrongText3.text = "Turquoise"

    elseif (selectQuestion == 16) then 
        -- create question 
        questionText.text = "About how many colours can we see?"

        -- creating answer text 
        answerText.text = "7 million"

        -- create wrong answers 
        wrongText1.text = "10,000"

        wrongText2.text = "100,000"

        wrongText3.text = "1000"

    elseif (selectQuestion == 17) then 
        -- create question 
        questionText.text = "Which colour is the oppisite of red?"

        -- creating answer text 
        answerText.text = "Green"

        -- create wrong answers 
        wrongText1.text = "Blue"

        wrongText2.text = "Orange"

        wrongText3.text = "Purple"

    elseif (selectQuestion == 18) then 
        -- create question 
        questionText.text = "Which colour is the oppisite of Orange?"

        -- creating answer text 
        answerText.text = "Blue"

        -- create wrong answers 
        wrongText1.text = "Brown"

        wrongText2.text = "Pink"

        wrongText3.text = "Red"


    elseif (selectQuestion == 19) then 
        -- create question 
        questionText.text = "Which colour is the oppisite of Yellow?"

        -- creating answer text 
        answerText.text = "Purple"

        -- create wrong answers 
        wrongText1.text = "Green"

        wrongText2.text = "Blue"

        wrongText3.text = "Orange"


    elseif (selectQuestion == 20) then 
        -- create question 
        questionText.text = "Which colour is the oppisite of Pink?"

        -- creating answer text 
        answerText.text = "Light Green"

        -- create wrong answers 
        wrongText1.text = "Purple"

        wrongText2.text = "Red"

        wrongText3.text = "Blue"


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
    questionText = display.newText("", display.contentCenterX, display.contentCenterY*3/8, Arial, 50)

    -- create the answer text object & wrong answer text objects
    answerText = display.newText("", X1, Y2, Arial, 50)
    answerText.anchorX = 0
    wrongText1 = display.newText("", X2, Y2, Arial, 50)
    wrongText1.anchorX = 0
    wrongText2 = display.newText("", X1, Y1, Arial, 50)
    wrongText2.anchorX = 0
    wrongText3 = display.newText("", X2, Y1, Arial, 50)
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
        --parent:resumeGame()
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