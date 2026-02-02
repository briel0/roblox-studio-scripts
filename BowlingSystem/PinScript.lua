local pin = script.Parent
local knockedDown = false 
pin.Anchored = false

while true do
	task.wait(0.1) 

	if knockedDown then 
		break 
	end

	-- Checks if the X orientation is less than 85 degrees
	if pin.Orientation.X < 85 then 
		knockedDown = true

		local players = game:GetService("Players"):GetPlayers()
		for _, player in pairs(players) do
			local stats = player:FindFirstChild("leaderstats")
			if stats then
				local points = stats:FindFirstChild("Points")
				if points then
					points.Value += 1
					break
				end
			end
		end

		task.wait(2)
		-- Optional: Destroy the pin after falling to clear the map
		-- pin:Destroy()
	end
end
