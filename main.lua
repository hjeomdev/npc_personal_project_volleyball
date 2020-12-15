-----------------------------------------------------------------------------------------
--
-- main.lua
--
---------------------------------------------

-- include Corona's "widget" library
local widget = require "widget"
local composer = require "composer"


-- event listeners for tab buttons:
local function onFirstView( event )
	composer.gotoScene( "view1" )
end

onFirstView()	-- invoke first tab button's onPress event manually

local function onSecondView( event )
	composer.gotoScene( "view2" )
end



-- -- -- Hides the status bar
-- -- display.setStatusBar(display.HiddenStatusBar)



-- --------------------------------------------------------------------------------------
-- -- Global contsts
-- --------------------------------------------------------------------------------------
-- Global = {
-- 	screenHeight = display.viewableContentHeight,
-- 	screenWidth  = display.viewableContentWidth, 
-- 	extraX = math.abs(display.screenOriginX),
-- 	extraY = math.abs(display.screenOriginY)
-- }
-- local totalScreenWidth = Global.screenWidth + 2*Global.extraX
-- local totalScreenHeight = Global.screenHeight + 2*Global.extraY

-- ObstacleState = {
-- 	IS_GOOD = 1,
-- 	IS_BAD = 2
-- }
-- --------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------




-- --------------------------------------------------------------------------------------
-- -- Global requirements/implementations
-- -- Add new libraries here..
-- --------------------------------------------------------------------------------------
-- local physics = require("physics")
-- physics.start()
-- physics.setGravity(-10, 0)
-- --physics.setDrawMode( "hybrid" )
-- --------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------




-- --------------------------------------------------------------------------------------
-- -- Global definitions and setup (load strings, database, fonts, audio, etc..)
-- --------------------------------------------------------------------------------------
-- local bcg = display.newRect(Global.screenWidth*.5, Global.screenHeight*.5, totalScreenWidth, totalScreenHeight)
-- bcg:setFillColor(1, 1, 1)
-- bcg:toBack()

-- local score = 0
-- local scoreTxt
-- --------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------




-- --------------------------------------------------------------------------------------
-- -- All kinds of functs..
-- --------------------------------------------------------------------------------------
-- local function performScaleAnimation(view)
-- 	transition.to(view, {xScale = 1.1, yScale = 1.1, time = 100})
-- 	transition.to(view, {xScale = 1, yScale = 1, time = 1000, delay = 100})
-- end

-- local function generateObstacle()
-- 	local obstacle = display.newCircle(Global.screenWidth*.5, -Global.extraY, 15)

-- 	obstacle:setFillColor(1,0,0)
	

-- 	physics.addBody(obstacle, "dynamic", {radius = 15, isSensor = true})
-- 	transition.to(obstacle, {x = 10, time = 1000})
-- end
-- --------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------






-- --------------------------------------------------------------------------------------
-- -- Listeners..
-- --------------------------------------------------------------------------------------
-- local function onLocalCollision(self, event)
-- 	local collideObject = event.other

-- 	if ("began" == event.phase) then
-- 		if (collideObject.ObstacleState == ObstacleState.IS_BAD) then
-- 			collideObject.x = 0
-- 		else
-- 			score = score - 10
-- 			if (score < 0 ) then score = 0 end
-- 			scoreTxt.text = score
-- 		end
-- 	end

-- 	performScaleAnimation(self)

-- 	-- display.remove(collideObject)
-- 	collideObject = nil
-- end
-- --------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------



-- --------------------------------------------------------------------------------------
-- -- UI
-- --------------------------------------------------------------------------------------
-- local character = display.newCircle(30, 30, 30, 30)
-- character.anchorY = 1
-- character:setFillColor(0.8, 0.6, 0.3)
-- -- character:toFront()

-- physics.addBody(character, "static", {radius = 30, isSensor = true})

-- character.collision = onLocalCollision
-- character:addEventListener("collision")


-- scoreTxt = display.newText(score, 0, 0, native.systemFont, 20)
-- scoreTxt.anchorX, scoreTxt.anchorY = 0, 0
-- scoreTxt.x = -Global.extraX + 20
-- scoreTxt.y = -Global.extraY + 20
-- scoreTxt:setFillColor(0)

-- timer.performWithDelay(2000, generateObstacle, -1)

