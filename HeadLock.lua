--[[
███████████████████████████████████████████████████████████████████████╗
██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██║
██░░░█████╗░░░░░██╗░░░██╗░░░░░██████╗░░░░░██╗░░██╗██╗░░░██╗██████╗░░░██║
██░░██╔══██╗░░░░██║░░░██║░░░░██╔════╝░░░░░██║░░██║██║░░░██║██╔══██╗░░██║
██░░███████║░░░░╚██╗░██╔╝░░░░██║░░██╗░░░░░███████║██║░░░██║██████╦╝░░██║
██░░██╔══██║░░░░░╚████╔╝░░░░░██║░░╚██╗░░░░██╔══██║██║░░░██║██╔══██╗░░██║
██░░██║░░██║░██╗░░╚██╔╝░░██╗░╚██████╔╝░░░░██║░░██║╚██████╔╝██████╦╝░░██║
██░░╚═╝░░╚═╝░╚═╝░░░╚═╝░░░╚═╝░░╚═════╝░░░░░╚═╝░░╚═╝░╚═════╝░╚═════╝░░░██║
██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██║
███████████████████████████████████████████████████████████████████████║
╔══════════════════════════════════════════════════════════════════════╝
║██████████████████████████████████████████████████████████████████████
║██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
║██░░░░░░░░░██████╗░░█████╗░██████╗░██╗░░░░░░█████╗░██╗░░██╗░░░░░░░░░██
║██░░░░░░░░░██╔══██╗██╔══██╗██╔══██╗██║░░░░░██╔══██╗╚██╗██╔╝░░░░░░░░░██
║██░░░░░░░░░██████╔╝██║░░██║██████╦╝██║░░░░░██║░░██║░╚███╔╝░░░░░░░░░░██
║██░░░░░░░░░██╔══██╗██║░░██║██╔══██╗██║░░░░░██║░░██║░██╔██╗░░░░░░░░░░██
║██░░░░░░░░░██║░░██║╚█████╔╝██████╦╝███████╗╚█████╔╝██╔╝╚██╗░░░░░░░░░██
║██░░░░░░░░░╚═╝░░╚═╝░╚════╝░╚═════╝░╚══════╝░╚════╝░╚═╝░░╚═╝░░░░░░░░░██
║██░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
║██████████████████████████████████████████████████████████████████████
╚════════════════════════════════════════════════════════════════════╝
]]--
local Player = game.Players.LocalPlayer
local CurrentCamera = game.Workspace.CurrentCamera
local Mouse = Player:GetMouse()

function lookAt(humpos, target)
	local ForwardVector = (target - humpos).Unit
	local RightVector = ForwardVector:Cross(Vector3.new(0, 1, 0))
	local UpVector2 = RightVector:Cross(ForwardVector)

	return CFrame.fromMatrix(humpos, RightVector, UpVector2)
end
local db = true

Mouse.Button1Down:Connect(function()
	db = false
	if db == false then
		local Character = game:GetService("Players").LocalPlayer.Character
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		local region = Region3.new(Mouse.Hit.p - Vector3.new(.2,.2,.2),Mouse.Hit.p + Vector3.new(.2,.2,.2))
		local inregion = game:GetService("Workspace"):FindPartsInRegion3(region,Character.HumanoidRootPart,math.huge)
		for i, hit in pairs(inregion) do
			if hit.Parent:FindFirstChild("Humanoid") and db == false then
				db = true
				CurrentCamera.CFrame = lookAt(HumanoidRootPart.Position, hit.Parent:FindFirstChild("Head").Position+Vector3.new(0,-1,0))
				wait()
			end
		end
	end
end)
