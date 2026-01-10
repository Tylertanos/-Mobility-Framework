local Core = require(game.Players.LocalPlayer.PlayerScripts.MFT.Core.Mobility)

local gui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
gui.Name = "MFT_GUI"

local icon = Instance.new("TextButton", gui)
icon.Size = UDim2.fromOffset(50,50)
icon.Position = UDim2.new(0,10,0.5,-25)
icon.Text = "M-FT"

local panel = Instance.new("Frame", gui)
panel.Size = UDim2.fromOffset(260,300)
panel.Position = UDim2.new(0,70,0.5,-150)
panel.Visible = false

icon.MouseButton1Click:Connect(function()
	panel.Visible = not panel.Visible
end)

-- CONFIG TOGGLES
local dashToggle = Instance.new("TextButton", panel)
dashToggle.Position = UDim2.fromOffset(20,60)
dashToggle.Size = UDim2.fromOffset(220,40)
dashToggle.Text = "Dash: ON"

dashToggle.MouseButton1Click:Connect(function()
	Core.DashEnabled = not Core.DashEnabled
	dashToggle.Text = "Dash: " .. (Core.DashEnabled and "ON" or "OFF")
end)

return gui
