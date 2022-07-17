-------------------------------------------------------------------
----------------------- Script By AVG hub
-------------------------------------------------------------------
local UserInputService = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local CurrentCamera = game.Workspace.CurrentCamera
local Mouse = Player:GetMouse()

function lookAt(humpos, target)
	local ForwardVector = (target - humpos).Unit
	local UpVector = Vector3.new(0, .5, 0)
	local RightVector = ForwardVector:Cross(UpVector)
	local UpVector2 = RightVector:Cross(ForwardVector)

	return CFrame.fromMatrix(humpos, RightVector, UpVector)
end
local db = true
local db2 = false

Mouse.Button1Down:Connect(function()
	db2 = false
	db = false
	if db == false and db2 == false then
		local Character = game:GetService("Players").LocalPlayer.Character
		local region = Region3.new(Mouse.Hit.p - Vector3.new(.5,.5,.5),Mouse.Hit.p + Vector3.new(.5,.5,.5))
		local inregion = game:GetService("Workspace"):FindPartsInRegion3(region,Character.HumanoidRootPart,math.huge)

		for i, hit in pairs(inregion) do
			if hit.Parent:FindFirstChild("Humanoid") and db2 == false then
				db2 = true
				db = true
				CurrentCamera.CFrame = lookAt(Character.HumanoidRootPart.Position, hit.Parent.HumanoidRootPart.Position)
				wait(0.000001)
			end
		end
	end
end)
Mouse.Button1Up:Connect(function()
	db = true
	db2 = false
end)
-------------------------------------------------------------------
----------------------- Script By AVG hub
-------------------------------------------------------------------