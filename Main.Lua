local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local DashModule = require(script.DashModule)
local UIManager = require(script.UIManager)

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

UIManager.CreateDashButton(gui, DashModule)

player.CharacterAdded:Connect(DashModule.SetupCharacter)
if player.Character then DashModule.SetupCharacter(player.Character) end

-- Optional: Q key to dash
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.Q then
        DashModule.Dash()
    end
end)
