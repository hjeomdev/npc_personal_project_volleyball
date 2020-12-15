-- Hides the status bar
display.setStatusBar(display.HiddenStatusBar)



--------------------------------------------------------------------------------------
-- Global contsts
--------------------------------------------------------------------------------------
Global = {
	screenHeight = display.viewableContentHeight,
	screenWidth  = display.viewableContentWidth, 
	extraX = math.abs(display.screenOriginX),
	extraY = math.abs(display.screenOriginY)
}
local totalScreenWidth = Global.screenWidth + 2*Global.extraX
local totalScreenHeight = Global.screenHeight + 2*Global.extraY

ObstacleState = {
	IS_GOOD = 1,
	IS_BAD = 2
}
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------
-- Global requirements/implementations
-- Add new libraries here..
--------------------------------------------------------------------------------------
local physics = require("physics")
physics.start()
physics.setGravity(0, 0)
--physics.setDrawMode( "hybrid" )
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------
-- Global definitions and setup (load strings, database, fonts, audio, etc..)
--------------------------------------------------------------------------------------
local bcg = display.newRect(Global.screenWidth*.5, Global.screenHeight*.5, totalScreenWidth, totalScreenHeight)
bcg:setFillColor(1, 1, 1)
bcg:toBack()

local score = 0
local scoreTxt
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------
-- All kinds of functs..
--------------------------------------------------------------------------------------
local function performScaleAnimation(view)
	transition.to(view, {xScale = 1.1, yScale = 1.1, time = 100})
	transition.to(view, {xScale = 1, yScale = 1, time = 100, delay = 100})
end

local function generateObstacle()
	local obstacle = display.newCircle(Global.screenWidth*.5, -Global.extraY, 15)
	obstacle.ObstacleState = math.random(1,2)

	if (obstacle.ObstacleState == ObstacleState.IS_GOOD) then
		obstacle:setFillColor(0,1,0)
	else
		obstacle:setFillColor(1,0,0)
	end

	physics.addBody(obstacle, "dynamic", {radius = 15, isSensor = true})
	transition.to(obstacle, {y = Global.screenHeight + Global.extraY + obstacle.height, time = 1000})
end
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------






--------------------------------------------------------------------------------------
-- Listeners..
--------------------------------------------------------------------------------------
local function onLocalCollision(self, event)
	local collideObject = event.other

	if ("began" == event.phase) then
		if (collideObject.ObstacleState == ObstacleState.IS_GOOD) then
			score = score + 10
			scoreTxt.text = score
		else
			score = score - 10
			if (score < 0 ) then score = 0 end
			scoreTxt.text = score
		end
	end

	performScaleAnimation(self)

	display.remove(collideObject)
	collideObject = nil
end
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------
-- UI
--------------------------------------------------------------------------------------
local character = display.newCircle(Global.screenWidth*.5, Global.screenHeight + Global.extraY, 30)
character.anchorY = 1
character:setFillColor(0.8, 0.6, 0.3)
character:toFront()

physics.addBody(character, "dynamic", {radius = 30, isSensor = true})

character.collision = onLocalCollision
character:addEventListener("collision")


scoreTxt = display.newText(score, 0, 0, native.systemFont, 20)
scoreTxt.anchorX, scoreTxt.anchorY = 0, 0
scoreTxt.x = -Global.extraX + 20
scoreTxt.y = -Global.extraY + 20
scoreTxt:setFillColor(0)

timer.performWithDelay(2000, generateObstacle, -1)







-- -----------------------------------------------------------------------------------------
-- --
-- -- view2.lua
-- --
-- -----------------------------------------------------------------------------------------

-- local composer = require( "composer" )
-- local scene = composer.newScene()

-- function scene:create( event )
-- 	local sceneGroup = self.view
	
-- 	-- Called when the scene's view does not exist.
-- 	-- 
-- 	-- INSERT code here to initialize the scene
-- 	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	
-- 	-- create a white background to fill screen
-- 	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
-- 	background:setFillColor( 1 )	-- white
	
-- 	-- create some text
-- 	local title = display.newText( "Second View", display.contentCenterX, 125, native.systemFont, 32 )
-- 	title:setFillColor( 0 )	-- black

-- 	local newTextParams = { text = "Loaded by the second tab's\n\"onPress\" listener\nspecified in the 'tabButtons' table", 
-- 							x = display.contentCenterX + 10, 
-- 							y = title.y + 215, 
-- 							width = 310, 
-- 							height = 310, 
-- 							font = native.systemFont, 
-- 							fontSize = 14, 
-- 							align = "center" }
-- 	local summary = display.newText( newTextParams )
-- 	summary:setFillColor( 0 ) -- black
	
-- 	-- all objects must be added to group (e.g. self.view)
-- 	sceneGroup:insert( background )
-- 	sceneGroup:insert( title )
-- 	sceneGroup:insert( summary )
-- end

-- function scene:show( event )
-- 	local sceneGroup = self.view
-- 	local phase = event.phase
	
-- 	if phase == "will" then
-- 		-- Called when the scene is still off screen and is about to move on screen
-- 	elseif phase == "did" then
-- 		-- Called when the scene is now on screen
-- 		-- 
-- 		-- INSERT code here to make the scene come alive
-- 		-- e.g. start timers, begin animation, play audio, etc.
-- 	end	
-- end

-- function scene:hide( event )
-- 	local sceneGroup = self.view
-- 	local phase = event.phase
	
-- 	if event.phase == "will" then
-- 		-- Called when the scene is on screen and is about to move off screen
-- 		--
-- 		-- INSERT code here to pause the scene
-- 		-- e.g. stop timers, stop animation, unload sounds, etc.)
-- 	elseif phase == "did" then
-- 		-- Called when the scene is now off screen
-- 	end
-- end

-- function scene:destroy( event )
-- 	local sceneGroup = self.view
	
-- 	-- Called prior to the removal of scene's "view" (sceneGroup)
-- 	-- 
-- 	-- INSERT code here to cleanup the scene
-- 	-- e.g. remove display objects, remove touch listeners, save state, etc.
-- end

-- ---------------------------------------------------------------------------------

-- -- Listener setup
-- scene:addEventListener( "create", scene )
-- scene:addEventListener( "show", scene )
-- scene:addEventListener( "hide", scene )
-- scene:addEventListener( "destroy", scene )

-- -----------------------------------------------------------------------------------------

-- return scene
