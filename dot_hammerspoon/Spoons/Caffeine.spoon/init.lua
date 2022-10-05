--- === Caffeine ===
---
--- Prevent the screen from going to sleep
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/Caffeine.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/Caffeine.spoon.zip)
local obj = { __gc = true }
--obj.__index = obj
setmetatable(obj, obj)
obj.__gc = function(t)
    t:stop()
end

-- Metadata
obj.name = "Caffeine"
obj.version = "1.0"
obj.author = "Chris Jones <cmsj@tenshu.net>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.menuBarItem = nil
obj.hotkeyToggle = nil

-- Internal function used to find our location, so we know where to load files from
local function script_path()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
end
obj.spoonPath = script_path()

function obj:init()
end

--- Caffeine:bindHotkeys(mapping)
--- Method
--- Binds hotkeys for Caffeine
---
--- Parameters:
---  * mapping - A table containing hotkey modifier/key details for the following items:
---   * toggle - This will toggle the state of display sleep prevention, and update the menubar graphic
---
--- Returns:
---  * The Caffeine object
function obj:bindHotkeys(mapping)
    if (self.hotkeyToggle) then
        self.hotkeyToggle:delete()
    end
    local toggleMods = mapping["toggle"][1]
    local toggleKey = mapping["toggle"][2]
    self.hotkeyToggle = hs.hotkey.new(toggleMods, toggleKey, function() self.clicked() end)

    return self
end

--- Caffeine:start()
--- Method
--- Starts Caffeine
---
--- Parameters:
---  * None
---
--- Returns:
---  * The Caffeine object
function obj:start()
    if (self.hotkeyToggle) then
        self.hotkeyToggle:enable()
    end

    self:setState(true)

    return self
end

--- Caffeine:stop()
--- Method
--- Stops Caffeine
---
--- Parameters:
---  * None
---
--- Returns:
---  * The Caffeine object
function obj:stop()
    if (self.hotkeyToggle) then
        self.hotkeyToggle:disable()
    end
    return self
end

function obj.clicked()
    hs.caffeinate.toggle("displayIdle")
end

--- Caffeine:setState(on)
--- Method
--- Sets whether or not caffeination should be enabled
---
--- Parameters:
---  * on - A boolean, true if screens should be kept awake, false to let macOS send them to sleep
---
--- Returns:
---  * None
function obj:setState(on)
    hs.caffeinate.set("displayIdle", on)
end

return obj
