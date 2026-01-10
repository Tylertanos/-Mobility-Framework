-- Visuals.lua
local Core = require(game.Players.LocalPlayer.PlayerScripts.MFT.Core.Mobility)
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local cam = workspace.CurrentCamera

local Visuals = {}

-- PARTICLE EFFECT
function Visuals:DashEffect()
	local part = Instance.new("Part")
	part.Size = Vector3.new(1,1,1)
	part.CFrame = root.CFrame
	part.Anchored = true
	part.CanCollide = false
	part.Material = Enum.Material.Neon
	part.Color = Color3.fromRGB(0,255,255)
  part.Parent = workspace

	Debris:AddItem(part,0.3)
end

-- WALL-RUN TRAIL
function Visuals:WallRunTrail()
	local trail = Instance.new("Trail")
	trail.Attachment0 = Instance.new("Attachment", root)
	trail.Attachment1 = Instance.new("Attachment", root)
	trail.Lifetime = 0.4
	trail.Color = ColorSequence.new(Color3.fromRGB(255,255,0))
	trail.Parent = root
	Debris:AddItem(trail,0.5)
end

-- CAMERA SHAKE HOOK
Core.XPGainEvent.Event:Connect(function(xp)
	if xp >= 5 then
		local intensity = math.clamp(xp/5,0.5,3)
    local duration = 0.15
		local startPos = cam.CFrame.Position
		local t = 0
		local conn
		conn = RunService.RenderStepped:Connect(function(dt)
			t += dt
			if t > duration then
				cam.CFrame = CFrame.new(startPos)
				conn:Disconnect()
				return
			end
			cam.CFrame = cam.CFrame * CFrame.new(
				math.random(-intensity,intensity)/10,
				math.random(-intensity,intensity)/10,
				0
			)
		end)
	end
end)

return Visuals
