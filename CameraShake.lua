local Core = require(game.Players.LocalPlayer.PlayerScripts.MFT.Core.Mobility)
local cam = workspace.CurrentCamera

local function Shake(intensity, duration)
	local startPos = cam.CFrame.Position
	local t = 0
	local connection
	connection = game:GetService("RunService").RenderStepped:Connect(function(dt)
		t += dt
		if t > duration then
			cam.CFrame = CFrame.new(startPos)
			connection:Disconnect()
			return
		end
		cam.CFrame = cam.CFrame * CFrame.new(
			math.random(-intensity,intensity)/10,
			math.random(-intensity,intensity)/10,
			0
		)
	end)
  cam.CFrame = cam.CFrame * CFrame.new(
			math.random(-intensity,intensity)/10,
			math.random(-intensity,intensity)/10,
			0
		)
	end)
end

-- Example hook
Core.XPGainEvent.Event:Connect(function(xp)
	if xp >= 5 then Shake(2,0.2) end
end)
