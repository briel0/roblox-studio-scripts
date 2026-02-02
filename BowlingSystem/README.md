🎳 BowlingSystem (Roblox)

A lightweight physics-based scoring system for Roblox Studio. It detects when objects are knocked over and manages player statistics.

🛠 Features

Physics Detection: Uses Orientation checks instead of .Touched for higher accuracy.
Leaderstats: Persistent player scoring system.
Server-Side Security: Point awarding and reset logic handled by the server.

📁 File Structure

LeaderboardSystem.lua: Place in ServerScriptService. Handles points and !reset command.
PinScript.lua: Place inside the MeshPart (Pin). Handles fall detection.
Pin.rbxm: The pre-configured model.

💻 Logic Overview

The system monitors the X-axis rotation. If the pin tilts beyond the threshold (Orientation < 85°), it triggers the scoring flag and stops the loop to prevent duplicate points.

🚀 How to Install

Move LeaderboardSystem to ServerScriptService.
Save your pin model in Workspace.
