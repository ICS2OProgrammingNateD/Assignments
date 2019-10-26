-- Title: LivesAndTimers
-- Name: Nate Day
-- Course: ICS2O
-- Date: Oct, 25, 2019
-- This program is a form of a Math Quiz



-- create variable for sound
local Sound1 = audio.loadSound("Sounds/Cash Register Cha Ching.mp3")
local Sound2 = audio.loadSound("Sounds/mp3-sounds.png")
local Sound3 = audio.loadSound("Sounds/")
local Sound4 = audio.loadSound("Sounds/")


-- load sound
audio.loadStream()

-- add background music
local backgroundMusic = audio.loadStream("Sounds/bkgMusic.mp3")
audio.play(backgroundMusic, {loops = -1})




-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
backgroundImage = display.newImageRect("Images/background.jpg", 1304, 769)
backgroundImage.x = display.contentCenterX
backgroundImage.y = display.contentCenterY

---------------------------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------------------------------------


-- create local variables

local TOTAL_SECONDS = 10
local secondsLeft = 10
local timeDisplay
local countDownTimer = 0
local clockText

local backgroundImage
local youWin
local gameOver
local questionObject
local correctObject
local backgroundMusic

local numericField
local randomNumber1
local randomNumber2
local randomNumber2
local randomNumber2

local userAnswer
local correctAnswer = 0
local incorrectObject

local points = 0
local pointsText
local correctAnswerObject
local lives = 3
local livesText

local randomOperator
local correctAnswer1
local tempRandomNumber

local clockText
local countdownTimer
local timerBox

local lives = 3
local sun1
local sun2
local sun3



---------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1 & 2

	randomOperator = math.random(1, 4)

	randomNumber1 = math.random(1, 20)
	randomNumber2 = math.random(1, 20)
	randomNumber3 = math.random(1, 10)
	randomNumber4 = math.random(1, 10)

	-- If the Random operator is 1, then do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create the question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	    -- otherwise, if the random operator is 2, do subtraction
	    elseif (randomOperator == 2) then
		
		-- if randomNumber1 is smaller than randomNumber2 then swap them
	    if(randomNumber1 < randomNumber2) then
			tempRandomNumber = randomNumber1
			randomNumber1 = randomNumber2
			randomNumber2 = tempRandomNumber
		end

        -- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2


		-- create the question in text object 
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	-- if random operator is 3 then do multiplication
	elseif (randomOperator == 3) then
		-- calculate the correct answer
		correctAnswer = randomNumber3 * randomNumber4

		-- create the question in text object 
		questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = " 
		
	-- otherwise, if random operator is 4 then do division
	elseif (randomOperator == 4) then
		correctAnswer1 = randomNumber3 * randomNumber4
		correctAnswer = correctAnswer1 / randomNumber3
		questionObject.text = correctAnswer1 .. " / " .. randomNumber3 .. " = "
	
		
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

-- set the answer (when wrong) to display incorrect
local function Hideincorrect()
	incorrectObject.isVisible = false
	correctAnswerObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins typing
	if ( event.phase == "began" ) then

		-- clear text 
		event.target.text = ""

	elseif (event.phase == "submitted") then 
	
	    -- when the answer is submitted	set their input to userAnswer
	    userAnswer = tonumber(event.target.text)

	    -- if the users answer and the correct answer are the same:
	    if (userAnswer == correctAnswer) then
	    	secondsLeft = TOTAL_SECONDS
		   correctObject.isVisible = true
		   secondsLeft = TOTAL_SECONDS
		   audio.play(Sound1)
		   timer.performWithDelay(2000, HideCorrect)
		   -- give a point if user gets the correct answer
	       points = points + 1
           -- upadate it in the display object
		   pointsText.text = "Number Correct = " .. points
		   -- clear text 
		   event.target.text = ""
		   
		else
			incorrectObject.isVisible = true
			secondsLeft = TOTAL_SECONDS
			audio.play(Sound2)
		    correctAnswerObject = display.newText( " The correct answer is " .. correctAnswer .. "!", 512, 680, native.systemFontBold, 50)
		    correctAnswerObject:setTextColor(101/255, 14/255, 189/255 )
		   	correctAnswerObject.isVisible = true
		   	timer.performWithDelay(2000, Hideincorrect) 
		   	-- take a life if user gets the incorrect answer
	        lives = lives - 1
            -- upadate it in the display object
		    livesText.text = "Lives = " .. lives
		    if (lives == 2) then
				sun3.isVisible = false
			elseif (lives == 1) then
				sun2.isVisible = false
			elseif (lives == 0) then
				sun1.isVisible = false
			end
		end   

		    -- if points reach 5 points display You Win!
	    if  
	    	(points == 5)  then
			youWin = display.newImageRect("Images/youWin.jpg", 1304, 769)
			audio.stop()
			youWin.x = display.contentCenterX
			youWin.y = display.contentCenterY
			numericField.isVisible = false

		end 

		if    -- If lives = less or equal to zero display Game Over!
		    (lives == 0) then
			gameOver = display.newImageRect("Images/gameOver.jpg", 1304, 769)
			audio.stop()
			gameOver.x = display.contentCenterX
			gameOver.y = display.contentCenterY
			numericField.isVisible = false


		end   
			-- clear text 
		    event.target.text = ""   
	end
end
		
	
local function UpdateTime()
	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = TOTAL_SECONDS
		lives = lives - 1
		-- update it in display object
		livesText.text = "Remaining Lives = " .. lives

		if (lives == 0 ) then
			gameOver = display.newImageRect("Images/gameOver.jpg", 1304, 769)
			gameOver.x = display.contentCenterX
			gameOver.y = display.contentCenterY
			numericField.isVisible = false

			incorrectObject.isVisible = false
			correctAnswerObject.isVisible = true
			questionObject.isVisible = false
			numericField.inputType = false
		end
		


		if (lives == 2) then
			sun3.isVisible = false
		elseif (lives == 1) then
			sun2.isVisible = false
		elseif (lives == 0) then
			sun1.isVisible = false
		end
		AskQuestion()
	end
end

-- function that calls the timer
local function StartTimer()

	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

-------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------------------------------------------------------------------
-- create the clock to display on the screen\
clockText = display.newText("" .. secondsLeft, 100, 100, native.systemFontBold, 150)
clockText:setTextColor(0/255, 0/255, 0/255)
clockText.x = 125
clockText.y = 230

-- create timer box
timerBox = display.newImageRect("Images/box.png", 177, 170)
timerBox.x = 125
timerBox.y = 230


-- display the amount of points as a text object
pointsText = display.newText("Number Correct = " .. points, 240, 50, native.systemFontBold, 50)
pointsText:setTextColor(0/255, 0/255, 153/255)

-- displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, native.systemFontBold, 50)
questionObject:setTextColor(.0, .0, .0)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(.2, 1, 0)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(1, 0, 0)
incorrectObject.isVisible = false

-- create numeric field 
numericField = native.newTextField(display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"
numericField.isVisible = true

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-- display the amount of lives as a text object
livesText = display.newText("Remaining Lives = " .. lives, 250, 100, native.systemFontBold, 50)
livesText:setTextColor(0/255, 0/255, 153/255)

-- create sun
sun1 = display.newImageRect("Images/sun.png", 150, 150)
sun1.x = display.contentWidth * 7/8
sun1.y = display.contentHeight * 1/7


-- create sun
sun2 = display.newImageRect("Images/sun.png", 150, 150)
sun2.x = display.contentWidth * 6/8
sun2.y = display.contentHeight * 1/7



-- create sun
sun3 = display.newImageRect("Images/sun.png", 150, 150)
sun3.x = display.contentWidth * 5/8
sun3.y = display.contentHeight * 1/7

correctAnswerObject = display.newText( " The correct answer is " .. correctAnswer .. "!", 512, 680, native.systemFontBold, 50)
correctAnswerObject:setTextColor(101/255, 14/255, 189/255 )
correctAnswerObject.isVisible = false

------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
------------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
StartTimer()

 