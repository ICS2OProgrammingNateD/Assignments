-----------------------------------------------------------------------------------------
--
-- main.lua
-- Created by: Nate Day
-- Date: Nov. 16, 2019
-- Description: This calls the main menu of the app to load itself.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar( display.HiddenStatusBar )

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen

--composer.gotoScene( "main_menu" )
composer.gotoScene( "main_menu" )