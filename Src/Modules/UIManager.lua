-- UIManager.lua
-- Handles UI visibility, themes, and simple animations for our script

local TweenService = game:GetService("TweenService")

local UIManager = {}

-- =====================
-- STATE
-- =====================

UIManager.UI = {}
UIManager.CurrentTheme = "Dark"

UIManager.Themes = {
	Dark = {
		Background = Color3.fromRGB(18, 18, 18),
		Secondary = Color3.fromRGB(28, 28, 28),
		Accent = Color3.fromRGB(0, 170, 255),
    Text = Color3.fromRGB(230, 230, 230)
	},

	Light = {
		Background = Color3.fromRGB(235, 235, 235),
		Secondary = Color3.fromRGB(215, 215, 215),
		Accent = Color3.fromRGB(0, 120, 255),
		Text = Color3.fromRGB(20, 20, 20)
	}
}

-- =====================
-- REGISTER
-- =====================

function UIManager:Register(name, frame)
	self.UI[name] = frame
	self:ApplyTheme(frame)
end

-- =====================
-- THEME
-- =====================

function UIManager:SetTheme(theme)
	if not self.Themes[theme] then return end
	self.CurrentTheme = theme

	for _, frame in pairs(self.UI) do
		self:ApplyTheme(frame)
	end
end

function UIManager:ApplyTheme(root)
	local theme = self.Themes[self.CurrentTheme]

	for _, obj in ipairs(root:GetDescendants()) do
		if obj:IsA("Frame") then
			obj.BackgroundColor3 = theme.Background

		elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
			obj.TextColor3 = theme.Text
			obj.BackgroundColor3 = theme.Secondary

		elseif obj:IsA("UIStroke") then
			obj.Color = theme.Accent
		end
	end
end

-- =====================
-- VISIBILITY
-- =====================

function UIManager:Show(frame)
	if frame.Visible then return end
	frame.Visible = true
	frame.Size = UDim2.fromScale(0.95, 0.95)

	TweenService:Create(
		frame,
		TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		{ Size = UDim2.fromScale(1, 1) }
	):Play()
end

function UIManager:Hide(frame)
	if not frame.Visible then return end

	local tween = TweenService:Create(
		frame,
    TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
		{ Size = UDim2.fromScale(0.95, 0.95) }
	)

	tween:Play()
	tween.Completed:Once(function()
		frame.Visible = false
	end)
end

function UIManager:Toggle(frame)
	if frame.Visible then
		self:Hide(frame)
  else
		self:Show(frame)
	end
end

-- =====================
-- UTIL
-- =====================

function UIManager:GetTheme()
	return self.CurrentTheme
end

return UIManager
