-- Core Mobility Module
local Core = {}
Core.__index = Core

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

-- CONFIG
Core.Config = {
	WalkSpeed = 16,
  JumpPower = 50,
	DashPower = 60,
	DashCooldown = 1,
	MobileUI = true,
	WallRunUnlocked = false
}

-- STATE
Core.LastDash = 0
Core.DashEnabled = true
Core.WallRunning = false

-- EVENTS
Core.XPGainEvent = Instance.new("BindableEvent")

-- APPLY CONFIG
function Core:ApplyConfig(cfg)
	humanoid.WalkSpeed = cfg.WalkSpeed
	humanoid.JumpPower = cfg.JumpPower
end

-- DASH SYSTEM
function Core:Dash()
	if not self.DashEnabled then return end
	if tick() - self.LastDash < self.Config.DashCooldown then return end
	self.LastDash = tick()

	local bv = Instance.new("BodyVelocity")
	bv.MaxForce = Vector3.new(1e5, 0, 1e5)
	bv.Velocity = root.CFrame.LookVector * self.Config.DashPower
	bv.Parent = root

	Debris:AddItem(bv, 0.25)
	self.XPGainEvent:Fire(5) -- 5 XP for dashing
end

-- WALL RUN
function Core:WallRun(direction)
	if not self.Config.WallRunUnlocked then return end
	self.WallRunning = true
	local bv = Instance.new("BodyVelocity")
	bv.MaxForce = Vector3.new(1e5,1e5,1e5)
	bv.Velocity = direction * self.Config.WalkSpeed
	bv.Parent = root
	Debris:AddItem(bv,0.5)
	self.XPGainEvent:Fire(10) -- 10 XP for wall-run
end

-- ANIMATION POLISH
function Core:BlendAnimation(animName, speed)
	-- Placeholder: integrate humanoid animations blending logic
end

-- MOBILE DASH HOOK
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.LeftShift then
		Core:Dash()
	end
end)

return Core
