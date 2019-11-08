-- None of this animation shit:
hs.window.animationDuration = 0

-- Get list of screens and refresh that list whenever screens are plugged or unplugged:
local screens = hs.screen.allScreens()
local screenwatcher = hs.screen.watcher.new(function()
    screens = hs.screen.allScreens()
end)
screenwatcher:start()

caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("SLEEPY")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

-- Modifier shortcuts
local alt = {"⌥"}
local hyper = {"⌘", "⌥", "⌃", "⇧"}
local nudgekey = {"⌥", "⌃"}
local yankkey = {"⌥", "⌃","⇧"}
local pushkey = {"⌃", "⌘"}

-- -----------------
-- Window management
-- -----------------

--hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
--    local rect = window:frame()
--
--	local mousePos = hs.mouse.getRelativePosition()
--
--	-- inside the rect
--	if mousePos.x > rect.x and mousePos.x < rect.x + rect.w and mousePos.y > rect.y and mousePos.y < rect.y + rect.h then
--	else
--	  local center = hs.geometry.rectMidPoint(rect)
--	   hs.mouse.setAbsolutePosition(center)
--	   mouseHighlight()
--	end
--
--end)

-- Movement hotkeys
hs.hotkey.bind(nudgekey, 'down', function() nudge(0,200) end) 	--down
hs.hotkey.bind(nudgekey, "up", function() nudge(0,-200) end)	--up
hs.hotkey.bind(nudgekey, "right", function() nudge(200,0) end)	--right
hs.hotkey.bind(nudgekey, "left", function() nudge(-200,0) end)	--left

-- Resize hotkeys
hs.hotkey.bind(yankkey, "up", function() yank(0,-200) end) -- yank bottom up
hs.hotkey.bind(yankkey, "down", function() yank(0,200) end) -- yank bottom down
hs.hotkey.bind(yankkey, "right", function() yank(200,0) end) -- yank right side right
hs.hotkey.bind(yankkey, "left", function() yank(-200,0) end) -- yank right side left

-- Push to screen edge
hs.hotkey.bind(pushkey,"left", function() push(0,0,0.5,1) end) 		-- left side
hs.hotkey.bind(pushkey,"right", function() push(0.5,0,0.5,1) end)	-- right side
hs.hotkey.bind(pushkey,"up", function()	push(0,0,1,0.5) end) 		-- top half
hs.hotkey.bind(pushkey,"down", function()	push(0,0.5,1,0.5) end)	-- bottom half

-- Center window with some room to see the desktop
local cur_zoom_x = 0.25
local cur_zoom_y = 0.05
local cur_zoom_h = 0.9
local cur_zoom_w = 0.9

hs.hotkey.bind(pushkey, 'm', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local max = win:screen():frame()

    local x = f

    local log = hs.logger.new('mymodule', 'debug')
    -- log:i(f.w)
    log:i((((max.w - f.w) / 2) + max.x))

    -- x.x = ((max.w - f.w) / 2) + max.x
    -- x.y = ((max.h - f.h) / 2) + max.y
    -- win:setFrame(x)

    push(
        -- ((max.w - f.w) / 2) + max.x,
        0.15,
        -- ((max.h - f.h) / 2) + max.y,
        0.15,
        0.75,
        0.75
    )
  end)

-- hs.hotkey.bind(pushkey, "m", function()
--     local win = hs.window.focusedWindow()
--     -- win:centerOnScreen()
--     local screen = win:screen()
--     local max = screen:frame()

--     cur_zoom_w = cur_zoom_w - 0.15
--     if cur_zoom_w < 0.5 then
--         cur_zoom_w = 0.9
--     end
--     cur_zoom_h = cur_zoom_h - 0.15
--     if cur_zoom_h < 0.5 then
--         cur_zoom_h = 0.9
--     end

--     local log = hs.logger.new('mymodule', 'debug')

--     log:i(max)

--     push(
--         cur_zoom_x * cur_zoom_w,
--         cur_zoom_y * cur_zoom_h,
--         cur_zoom_w,
--         cur_zoom_h
--     )
-- end)

-- Fullscreen
hs.hotkey.bind(pushkey, "f", function() push(0,0,1,1) end)

-- Chat windows (arrange in grid of 5 on right hand of screen)
hs.hotkey.bind(pushkey, "q", function() push(0.0,0.0,0.5,0.5) end)
hs.hotkey.bind(pushkey, "a", function() push(0.0,0.5,0.5,0.5) end)
hs.hotkey.bind(pushkey, "p", function() push(0.5,0.0,0.5,0.5) end)
hs.hotkey.bind(pushkey, "l", function() push(0.5,0.5,0.5,0.5) end)
--hs.hotkey.bind(hyper, "5", function() push(0.8,0.8,0.2,0.2) end)

-- Move a window between monitors
hs.hotkey.bind(pushkey,"1", function() moveToMonitor(1) end) -- Move to first monitor
hs.hotkey.bind(pushkey,"2", function() moveToMonitor(2) end) -- Move to second monitor

hs.hotkey.bind(pushkey,"z", function() push(0, 0, (1/3), 1) end)
hs.hotkey.bind(pushkey,"x", function() push((1/3), 0, (1/3), 1) end)
hs.hotkey.bind(pushkey,"c", function() push((2/3), 0, (1/3), 1) end)

hs.hotkey.bind(pushkey, "w", function() mouseHighlight() end)

--config reloading. manual (from getting started guide):
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
  hs.alert.show("Config loaded")
end)

-- Move Mouse to center of next Monitor
hs.hotkey.bind({"⌘", "⌃"}, '`', function()
   local screen = hs.mouse.getCurrentScreen()
   local nextScreen = screen:next()
   local rect = nextScreen:fullFrame()
   local center = hs.geometry.rectMidPoint(rect)

   -- hs.mouse.setRelativePosition(center, nextScreen)
   hs.mouse.setAbsolutePosition(center)
end)


local function mousePress(eventobj)
--	hs.alert(eventobj)
    if eventobj:getButtonState(3) then
        hs.eventtap.event.newKeyEvent({'command'}, '[', true):post()
        hs.eventtap.event.newKeyEvent({'command'}, '[', false):post()
    end

    if eventobj:getButtonState(4) then
        hs.eventtap.event.newKeyEvent({'command'}, ']', true):post()
        hs.eventtap.event.newKeyEvent({'command'}, ']', false):post()
    end

    return false
    -- hs.alert.show(hs.mouse.getButtons())
end

hs.eventtap.new({hs.eventtap.event.types.otherMouseDown}, mousePress):start()

-- Mouse circle example from getting started guide.
-- This places a red circle around the mouse pointer (because I lose it a lot)
local mouseCircle = nil
local mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer = hs.timer.doAfter(2, function() mouseCircle:delete() end)
end


--and magic (from getting started guide):
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

-- --------------------------------------------------------
-- Helper functions - these do all the heavy lifting below.
-- Names are roughly stolen from same functions in Slate :)
-- --------------------------------------------------------

-- Move a window a number of pixels in x and y
function nudge(xpos, ypos)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.x = f.x + xpos
	f.y = f.y + ypos
	win:setFrame(f)
end

-- Resize a window by moving the bottom
function yank(xpixels,ypixels)
	local win = hs.window.focusedWindow()
	local f = win:frame()

	f.w = f.w + xpixels
	f.h = f.h + ypixels
	win:setFrame(f)
end

-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
function push(x, y, w, h)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w*x)
	f.y = max.y + (max.h*y)
	f.w = max.w*w
	f.h = max.h*h
	win:setFrame(f)
end

-- Move to monitor x. Checks to make sure monitor exists, if not moves to last monitor that exists
function moveToMonitor(x)
	local win = hs.window.focusedWindow()
	local newScreen = nil
	while not newScreen do
		newScreen = screens[x]
		x = x-1
	end

	win:moveToScreen(newScreen)
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
