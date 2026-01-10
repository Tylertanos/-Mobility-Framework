local Core = require(game.Players.LocalPlayer.PlayerScripts.MFT.Core.Mobility)
local gui = game.Players.LocalPlayer.PlayerGui:WaitForChild("MFT_GUI")

local skillPanel = Instance.new("Frame", gui)
skillPanel.Size = UDim2.fromOffset(200,250)
skillPanel.Position = UDim2.new(0.5,-100,0.5,-125)
skillPanel.Visible = false

-- TOGGLE
local skillButton = Instance.new("TextButton", gui)
skillButton.Text = "Skill Tree"
skillButton.Position = UDim2.new(0,10,0.5,50)
skillButton.Size = UDim2.fromOffset(100,40)
skillButton.MouseButton1Click:Connect(function()
	skillPanel.Visible = not skillPanel.Visible
end)

-- SKILLS
local skills = {
	{ Name="Wall-Run", XP=50, Action=function() Core.Config.WallRunUnlocked=end },
	{ Name="Dash+10", XP=30, Action=function() Core.Config.DashPower+=10 end }
}

local y=10
for _, skill in pairs(skills) do
	local btn = Instance.new("TextButton", skillPanel)
	btn.Size = UDim2.fromOffset(180,30)
	btn.Position = UDim2.fromOffset(10,y)
	btn.Text = skill.Name.." ("..skill.XP.." XP)"
	y+=35
	btn.MouseButton1Click:Connect(function()
		if Core.PlayerXP >= skill.XP then
			skill.Action()
			Core.PlayerXP -= skill.XP
			btn.Text = skill.Name.." (Unlocked)"
		end
	end)
end
