
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
function gotoMenu()
    composer.gotoScene( "menu" )
end

local sheetOptions =
{
    width = 64,
    height = 64,
    numFrames = 6
}

local sheet_spaceship = graphics.newImageSheet( "img/spaceship.png", sheetOptions )

local sequences_spaceship = {
    --consecutive frames
    {
        name = "spaceshipidle",
        start = 1,
        count = 6,
        time = 800,
        loopCount = 0,
        loopDirection = "forward"
    }
}
local movingspaceship


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	-- local background = display.newImageRect( sceneGroup, "img/planet_000.png", display.contentWidth/2, display.contentWidth/2 )
	-- background.x = display.contentCenterX
	-- background.y = display.contentCenterY/2
    
	local background = display.newImageRect( sceneGroup, "img/background_space_001.png", display.contentWidth, display.contentHeight )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

    movingspaceship = display.newSprite(sceneGroup, sheet_spaceship, sequences_spaceship )
    movingspaceship.x = display.contentCenterX
    movingspaceship.y = display.contentCenterY/2
    movingspaceship:play()

    local menuButton = display.newText( sceneGroup, "Menu", 35, display.contentHeight-10, "fonts/AstroSpace.ttf", 15 )
	menuButton:setFillColor( 0.75, 0.78, 1 )

    
    
	menuButton:addEventListener( "tap", gotoMenu )

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
