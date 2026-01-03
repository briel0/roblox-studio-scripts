local launchPad = script.Parent

-- CONFIGURATION
-- 100 = High jump
-- 300 = Very high jump
-- 500 = Almost leaving the map
local LAUNCH_FORCE = 500

local debounce = false -- Debounce to prevent multiple activations at once

local function launchCharacter(hit)
	-- Check if the pad is currently on cooldown
	if debounce then return end
	
	-- Find the character model and its HumanoidRootPart
	local character = hit.Parent
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	
	if rootPart then
		debounce = true
		
		-- Apply velocity ONLY on the Y axis (Vertical)
		-- Vector3.new(0, LAUNCH_FORCE, 0) ensures straight up movement
		rootPart.AssemblyLinearVelocity = Vector3.new(0, LAUNCH_FORCE, 0)
		
		-- Cooldown time before it can be used again
		task.wait(0.5) 
		debounce = false
	end
end

launchPad.Touched:Connect(launchCharacter)
