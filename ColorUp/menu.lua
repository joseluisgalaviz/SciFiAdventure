
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function gotoVault()
	composer.gotoScene( "vault" ,{ time=400, effect="crossFade" })
end

local function gotoWorlds()
	composer.gotoScene( "worlds", { time=400, effect="crossFade" } )
end

local function gotoMerchant()
    composer.gotoScene( "merchant" , { time=400, effect="crossFade" })
end



--scene events
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	local background = display.newImageRect( sceneGroup, "img/background_space_001.png", display.contentWidth, display.contentHeight )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local title = display.newImageRect( sceneGroup, "titlemain.png", display.contentWidth*0.6, display.contentHeight*0.2 )
	title.x = display.contentCenterX
	title.y = 100

	local playButton = display.newText( sceneGroup, "Vault", display.contentCenterX, display.contentHeight*0.5, "fonts/AstroSpace.ttf", 35 )
	playButton:setFillColor( 0.75, 0.78, 1 )

	local highScoresButton = display.newText( sceneGroup, "Worlds", display.contentCenterX, display.contentHeight*0.65, "fonts/AstroSpace.otf", 35 )
	highScoresButton:setFillColor( 0.75, 0.78, 1 )

    local merchantButton = display.newText( sceneGroup, "Merchant", display.contentCenterX, display.contentHeight*0.8, "fonts/AstroSpace.otf", 35 )
    merchantButton:setFillColor(0.75, 0.78, 1 )

	playButton:addEventListener( "tap", gotoVault )
	highScoresButton:addEventListener( "tap", gotoWorlds )
	merchantButton:addEventListener( "tap", gotoMerchant )
end




-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end






-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
