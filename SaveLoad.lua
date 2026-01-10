local Core = require(game.Players.LocalPlayer.PlayerScripts.MFT.Core.Mobility)
local DataStoreService = game:GetService("DataStoreService")
local XPStore = DataStoreService:GetDataStore("MFT_XP")

local player = game.Players.LocalPlayer

-- LOAD
local success, data = pcall(function()
	return XPStore:GetAsync(player.UserId)
end)
Core.PlayerXP = data or 0

-- SAVE
game:BindToClose(function()
	pcall(function()
		XPStore:SetAsync(player.UserId, Core.PlayerXP)
	end)
end)
