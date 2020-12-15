-----------------------------------------------------------------------------------------
--
-- 
-- view1.lua
--
-----------------------------------------------------------------------------------------

math.randomseed( os.time() )

local composer = require( "composer" )
local scene = composer.newScene()


function scene:create( event )
	local sceneGroup = self.view

	local physics = require("physics")
	physics.start()
	physics.setGravity(0, 10) --아래로 향하는 중력

	-- 배경
	local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	background:setFillColor( 0.8 )	-- white

	-- 플레이어
	-- local player = display.newRect(display.contentWidth/2, display.contentHeight/2, 30, 5)
	-- player:setFillColor(0)

	local player = display.newImage("image/hand.png", display.contentWidth/2, display.contentHeight/2)
	physics.addBody(player, "static", {density = 0})


	-- 배리어
	-- local barrier = display.newRect(display.contentWidth/2, 0, 1100, 7)
	-- barrier:setFillColor(0)
	-- physics.addBody(barrier, "static", {density = 0})

	-- 올리브
	local olives = graphics.newImageSheet("image/olives_4.png", { width=116, height=110, numFrames=4})

	-- local olive = display.newImage(olives, 1)
	local olive = display.newImage("image/ball.png")
	olive.x, olive.y = display.contentWidth/2, display.contentHeight/2-300

	-- olive = display.newCircle(display.contentWidth/2, display.contentHeight/2-300, 30, 30)
	-- olive:setFillColor(0)
	olive.alpha = 1
		
	physics.addBody(olive, "dynamic", {bounce = 1})


	-- 때린 횟수
	local count = 0	

	-- 재시작 버튼
	-- local widget = require("widget")

	-- local function handleButtonEvent( event )
	-- 	if ("ended" == event.phase ) then
	-- 		print("Button was pressed and relased")
	-- 		composer.removeScene("view1")
	-- 		composer.gotoScene("view1", "fade", 0)
	-- 	end
	-- end

	-- local button = widget.newButton(
	-- 	{
	-- 		label = "button",
	--         onEvent = handleButtonEvent,
	--         emboss = false,
	--         -- Properties for a rounded rectangle button
	--         shape = "roundedRect",
	--         width = 200,
	--         height = 40,
	--         cornerRadius = 2,
	--         fillColor = { default={1,0,0,1}, over={1,0.1,0.7,0.4} },
	--         strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
	--         strokeWidth = 4
	-- 	}
	-- )

	-- button.x = display.contentWidth - 110
	-- button.y = display.contentHeight - 30
 	
	-- -- Change the button's label text
	-- button:setLabel( "RESTART" )

	
	-- 키보드 입력 이벤트
	local function inputEvent( event )
		local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
    	print( message )

    	local flag = "OK"

    	if player.y > 0 then

			if event.keyName == "up" then
				player.y = player.y - 20
			end
		end

		if player.y < display.contentHeight then

			if event.keyName == "down" then
				player.y = player.y + 20
			end
		end

		if player.x > 0 then
			if event.keyName == "left" then
				player.x = player.x - 20
			end
		end

		if player.x < display.contentWidth then
			if event.keyName == "right" then
				player.x = player.x + 20
			end
		end

		return false
	end

	-- 때리기 이벤트
	local function onLocalCollision(self, event)
		local collideObject = event.other

		if ("began" == event.phase) then
			count = count + 1
			print("SAY NO")
			score.text = count
		end

		-- display.remove(collideObject)
		collideObject = nil
	end

	-- 점수
	score = display.newText(count, 0, 0, native.systemFont, 20)
	score.anchorX, score.anchorY = 0, 0
	score.x = 10
	score.y = 690
	score:setFillColor(0)


	Runtime:addEventListener( "key", inputEvent )
	

	olive.collision = onLocalCollision
	olive:addEventListener("collision")

	sceneGroup:insert( background )
	sceneGroup:insert( player )
	sceneGroup:insert( olive )
	sceneGroup:insert( score )

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene