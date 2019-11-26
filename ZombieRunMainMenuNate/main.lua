-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Nate Day
-- Date: Nov. 7th, 2019
-- Description: This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar( display.HiddenStatusBar )

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen

--composer.gotoScene( "level1_screen" )
composer.gotoScene( "splash_screen" )