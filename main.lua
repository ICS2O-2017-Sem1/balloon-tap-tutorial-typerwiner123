-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local tapCount = 0

local background = display.newImageRect( "background.png", 360, 570 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local music = audio.loadSound( "Super Mario Bros. Music - Ground Theme.mp3" )
audio.play ( music )
audio.play ( music )
audio.play ( music )
audio.play ( music )
audio.play ( music )
audio.play ( music )
audio.play ( music )

local tapText = display.newText( tapCount, display.contentCenterX, 20, native.systemFont, 40 )
tapText:setFillColor(0.9,0.26,0.96)

local platform = display.newImageRect( "platform.png", 300, 50 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-25

local platform1 = display.newImageRect( "platform.png", 300, 50 )
platform1.x = display.contentCenterX
platform1.y = display.contentHeight-600

local balloon = display.newImageRect( "balloon.png", 165,105 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
balloon.alpha = 0.8

local physics = require( "physics" )
physics.start()

physics.addBody( platform, "static" )
physics.addBody( balloon, "dynamic", { radius=50, bounce=0.3 } )
physics.addBody( platform1, "static" )

local function pushBalloon()
    balloon:applyLinearImpulse( 0, -0.75, balloon.x, balloon.y )
    tapCount = tapCount +1
    tapText.text = tapCount
end

balloon:addEventListener( "tap", pushBalloon )

local function reset()
  tapCount = 0
  tapText.text = tapCount
  
end

balloon:addEventListener( "collision", reset )
