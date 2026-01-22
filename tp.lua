-- TP FORWARD con NOCLIP
if game.CoreGui:FindFirstChild("TPForwardGui") then
	game.CoreGui.TPForwardGui:Destroy()
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "TPForwardGui"
ScreenGui.ResetOnSpawn = false

local Button = Instance.new("TextButton", ScreenGui)
Button.Size = UDim2.new(0, 140, 0, 45)
Button.Position = UDim2.new(0, 20, 0.5, -22)
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Text = "TP FORWARD"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 18
Button.BorderSizePixel = 0

-- NOCLIP
local noclip = false
RunService.Stepped:Connect(function()
	if noclip and player.Character then
		for _, v in pairs(player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
end)

-- FUNCIÓN TP
Button.MouseButton1Click:Connect(function()
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart")

	noclip = true

	-- distancia hacia adelante
	local distance = 20
	hrp.CFrame = hrp.CFrame + (hrp.CFrame.LookVector * distance)

	-- apagar noclip después de un momento
	task.delay(0.3, function()
		noclip = false
	end)
end)
