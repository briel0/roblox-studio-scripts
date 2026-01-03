local platform = script.Parent

-- CONFIGURATION
local DISAPPEAR_DELAY = 1.0 -- Seconds to wait before vanishing after touch
local RESPAWN_TIME = 3.0    -- Seconds to stay invisible before coming back

local isFading = false -- Debounce variable to track state

local function onPlatformTouch(hit)
	-- 1. Check if the platform is already fading/invisible
	if isFading then return end

	-- 2. Check if a player (Humanoid) touched it
	-- (We don't want random objects triggering the platform)
	local character = hit.Parent
	local humanoid = character:FindFirstChild("Humanoid")

	if humanoid then
		isFading = true
		
		-- OPTIONAL: Change color to Red to warn the player
		local originalColor = platform.Color
		platform.Color = Color3.fromRGB(255, 0, 0) -- Red Warning
		
		-- Wait for the "Warning" time
		task.wait(DISAPPEAR_DELAY)
		
		-- 3. VANISH (Ghost Mode)
		platform.Transparency = 1   -- Invisible
		platform.CanCollide = false -- Intangible (Players fall)
		
		-- Wait while invisible
		task.wait(RESPAWN_TIME)
		
		-- 4. REAPPEAR (Reset)
		platform.Transparency = 0   -- Visible
		platform.CanCollide = true  -- Solid
		platform.Color = originalColor -- Restore original color
		
		isFading = false
	end
end

platform.Touched:Connect(onPlatformTouch)
