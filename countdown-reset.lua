local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Infinite loop to restart the cycle every time the player respawns
while true do

	-- 1. Wait for the character to load
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")

	-- 2. Create the Hint
	local hint = Instance.new("Hint")
	hint.Name = "Timer"
	hint.Parent = workspace 

	local timerCount = 0
	local timeLimit = 50 -- Change to 100 if needed

	-- 3. Timer Loop
	repeat
		task.wait(1)
		timerCount = timerCount + 1

		if hint and hint.Parent then
			hint.Text = ("Timer: "..tostring(timerCount))
		end

		-- Safety check: If player resets manually, stop the loop
		if humanoid.Health <= 0 then
			break 
		end

	until timerCount >= timeLimit

	-- 4. Time's Up Logic (Only runs if player is still alive)
	if humanoid.Health > 0 then
		if hint then hint.Text = "Time's Up!" end
		task.wait(1)

		-- Kill the character (Breaks joints)
		humanoid.Health = 0 

		-- Wait a bit to see the broken character
		task.wait(3)
	end

	-- 5. Cleanup Hint
	if hint then hint:Destroy() end

	-- 6. Wait for the dead character to be removed before restarting the loop
	-- This prevents the timer from starting again while the camera is still on the dead body
	if player.Character then
		player.CharacterRemoving:Wait()
	end
end
