-- show an alert to let you know Hydra's running
hydra.alert("Hydra config loaded", 1.5)

hotkey.bind({"cmd", "ctrl", "alt"}, "R", hydra.reload)

-- show a helpful menu
hydra.menu.show(function()
    local t = {
      {title = "Reload Config", fn = hydra.reload},
      {title = "Open REPL", fn = repl.open},
      {title = "-"},
      {title = "About Hydra", fn = hydra.showabout},
      {title = "Check for Updates...", fn = function() hydra.updates.check(nil, true) end},
      {title = "Quit", fn = os.exit},
    }

    if not hydra.license.haslicense() then
      table.insert(t, 1, {title = "Buy or Enter License...", fn = hydra.license.enter})
      table.insert(t, 2, {title = "-"})
    end

    return t
end)

-- move the window to the right half of the screen
function movewindow_righthalf()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  newframe.x = newframe.x + newframe.w -- comment out this line to push it to left half of screen
  win:setframe(newframe)
end

function movewindow_lefthalf()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  win:setframe(newframe)
end

function movewindow_uphalf()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2
  win:setframe(newframe)
end

function movewindow_downhalf()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2
  newframe.y = newframe.y + newframe.h
  win:setframe(newframe)
end

function window_maximize()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()

  win:setframe(newframe)
end

function window_center()
  --local screen = screen:frame_without_dock_or_menu()
  local win = window.focusedwindow()
  local win_size = win:size()
  local newframe = win:screen():frame_without_dock_or_menu()

  -- padding around center window
  screen_sizes = {
    ['large'] = 100,
    ['medium'] = 200,
    ['small'] = 300
  }

  frame_diff_h = newframe.h - win_size.h
  frame_diff_w = newframe.w - win_size.w

  if screen_sizes.small == frame_diff_h and screen_sizes.small == frame_diff_w then
    size = screen_sizes.medium
  elseif screen_sizes.medium == frame_diff_h and screen_sizes.medium == frame_diff_w then
    size = screen_sizes.large
  elseif screen_sizes.large == frame_diff_h and screen_sizes.large == frame_diff_w then
    size = screen_sizes.small
  else
    size = screen_sizes.small
  end

  newframe.h = newframe.h - size
  newframe.w = newframe.w - size

  newframe.x = newframe.x + size / 2
  newframe.y = newframe.y + size / 2

  win:setframe(newframe)
end

-- bind your custom function to a convenient hotkey
-- note: it's good practice to keep hotkey-bindings separate from their functions, like we're doing here
hotkey.new({"cmd", "ctrl", "alt"}, "RIGHT", movewindow_righthalf):enable()
hotkey.new({"cmd", "ctrl", "alt"}, "L", movewindow_righthalf):enable()

hotkey.new({"cmd", "ctrl", "alt"}, "LEFT", movewindow_lefthalf):enable()
hotkey.new({"cmd", "ctrl", "alt"}, "H", movewindow_lefthalf):enable()

hotkey.new({"cmd", "ctrl", "alt"}, "UP", movewindow_uphalf):enable()
hotkey.new({"cmd", "ctrl", "alt"}, "K", movewindow_uphalf):enable()

hotkey.new({"cmd", "ctrl", "alt"}, "DOWN", movewindow_downhalf):enable()
hotkey.new({"cmd", "ctrl", "alt"}, "J", movewindow_downhalf):enable()

hotkey.new({"cmd", "ctrl", "alt"}, "M", window_maximize):enable()
hotkey.new({"cmd", "ctrl", "alt"}, "C", window_center):enable()

-- uncomment this line if you want Hydra to make sure it launches at login
-- hydra.autolaunch.set(true)

-- when the "update is available" notification is clicked, open the website
-- notify.register("showupdate", function() os.execute('open https://github.com/sdegutis/Hydra/releases') end)

-- check for updates every week, and also right now (when first launching)
-- timer.new(timer.weeks(1), hydra.updates.check):start()
-- hydra.updates.check()
