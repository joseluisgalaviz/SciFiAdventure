
local composer = require( "composer" )
local CrewMember = require("CrewMember")

local scene = composer.newScene()
local textGUIGroup
local sceneGUIGroup

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

function gotoMenu()
    composer.gotoScene( "menu" )
end

function createNewCrew()
    print( "New Crew created" )
   local new_crew = CrewMember:createNewCrew(4)
   
   local crew_rank = display.newText( textGUIGroup, new_crew.rank , 257, 93, "fonts/AstroSpace.ttf", 35 )
   crew_rank:setFillColor( 243/255, 202/255, 76/255 )
end

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	-- Code here runs when the scene is first created but has not yet appeared on screen
	local sceneGroup = self.view

    sceneGUIGroup = display.newGroup()
    sceneGroup:insert(sceneGUIGroup)

    textGUIGroup = display.newGroup()
    sceneGroup:insert(textGUIGroup)

	local background = display.newImageRect( sceneGUIGroup, "img/background_space_001.png", display.contentWidth, display.contentHeight )
	background.x = display.contentCenterX
	background.y = display.contentCenterY

    local itemplace = display.newImageRect( sceneGUIGroup, "img/ItemPortrait.png", 100, 100 )
    itemplace.x = 159
    itemplace.y = 121
    --itemplace:setFillColor(0.5,0.5,0.5)
    
    local currencyplace = display.newRect( sceneGUIGroup, 12, 8, 100, 20 )
    currencyplace:setFillColor(0.5,0.5,0.5)

    local rankplace = display.newImageRect( sceneGUIGroup, "img/RankBackground.png", 50, 50 )
    rankplace.x = 257
    rankplace.y = 93


    -- Button to create a new crew character
    local crew_placeholder = display.newImageRect( sceneGUIGroup, "img/ButtonBackground.png", 100, 40 )
    crew_placeholder.x = 77
    crew_placeholder.y = 408
    
    local new_crew_button = display.newText( sceneGUIGroup, "CREW", 77, 408, "fonts/AstroSpace.ttf", 15 )
	new_crew_button:setFillColor( 0.75, 0.78, 1 )
    
    -- Button to create a new Ship
    local ship_placeholder = display.newImageRect( sceneGUIGroup, "img/ButtonBackground.png", 100, 40 )
    ship_placeholder.x = 244
    ship_placeholder.y = 408
    
    local new_ship_button = display.newText( sceneGUIGroup, "SPACESHIP", 244, 408, "fonts/AstroSpace.ttf", 15 )
	new_ship_button:setFillColor( 0.75, 0.78, 1 )

    
    --local description_placeholder = display.newImageRect( sceneGroup, "img/DescriptionBackground.png", 300, 130 )
    --description_placeholder.x = 159
    --description_placeholder.y = 311

    local descriptionup_placeholder = display.newImageRect( sceneGUIGroup, "img/DescriptionUp.png", 300, 30 )
    descriptionup_placeholder.x = 159
    descriptionup_placeholder.y = 246

    local descriptiondown_placeholder = display.newImageRect( sceneGUIGroup, "img/DescriptionDown.png", 300, 30 )
    descriptiondown_placeholder.x = 159
    descriptiondown_placeholder.y = 346

    --local description = display.newRect( sceneGroup, 159, 311, 300, 130 )
    --description:setFillColor(0.5,0.5,0.5)



    local menuButton = display.newText( sceneGUIGroup, "Menu", 35, display.contentHeight-10, "fonts/AstroSpace.ttf", 15 )
	menuButton:setFillColor( 0.75, 0.78, 1 )

    
	new_crew_button:addEventListener( "tap", createNewCrew )
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

function scene:key(event)
    
    -- handle the back key press however you choose
    if ( event.keyName == "back" ) then
    	-- Go to the menu screen
		if ( system.getInfo("platform") == "android" ) then
            return true
        end
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
