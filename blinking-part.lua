local object = script.Parent -- Gets the object the script is inside

-- Time configuration (in seconds)
local visibleTime = 3
local invisibleTime = 3

while true do
	-- Becomes VISIBLE and SOLID
	object.Transparency = 0       -- 0 means fully visible
	object.CanCollide = true      -- True means the player collides with it
	task.wait(visibleTime)        -- Waits for the configured time
	
	-- Becomes INVISIBLE and GHOST-LIKE
	object.Transparency = 1       -- 1 means fully transparent
	object.CanCollide = false     -- False means the player passes through it
	task.wait(invisibleTime)      -- Waits for the configured time
end
