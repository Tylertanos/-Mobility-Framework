local Core = require(game.Players.LocalPlayer.PlayerScripts.MFT.Core.Mobility)
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "MobileUI"

-- DASH BUTTON
local dashButton = Instance.new("TextButton", gui)
dashButton.Size = UDim2.fromOffset(80,80)
dashButton.Position = UDim2.new(1,-100,1,-120)
dashButton.Text = "DASH"
dashButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
dashButton.TextColor3 = Color3.new(1,1,1)
dashButton.Visible = false

-- JUMP BUTTON
local jumpButton = Instance.new("TextButton", gui)
jumpButton.Size = UDim2.fromOffset(80,80)
jumpButton.Position = UDim2.new(1,-200,1,-120)
jumpButton.Text = "JUMP"
jumpButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
jumpButton.TextColor3 = Color3.new(1,1,1)
jumpButton.Visible = false

-- SHOW IF TOUCH ENABLED
local UserInputService = game:GetService("UserInputService")
dashButton.Visible = UserInputService.TouchEnabled and Core.Config.MobileUI
jumpButton.Visible = UserInputService.TouchEnabled and Core.Config.MobileUI

-- DASH HOOK
dashButton.MouseButton1Click:Connect(function()
	Core:Dash()
end)

-- JUMP HOOK
jumpButton.MouseButton1Click:Connect(function()
	local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
	if humanoid then humanoid.Jump = true end
end)

-- UPDATE VISIBILITY ON CONFIG CHANGE
game:GetService("RunService").RenderStepped:Connect(function()
	dashButton.Visible = UserInputService.TouchEnabled and Core.Config.MobileUI
	jumpButton.Visible = UserInputService.TouchEnabled and Core.Config.MobileUI
end)

return gui
