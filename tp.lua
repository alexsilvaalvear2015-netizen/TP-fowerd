-- TP FORWARD + NOCLIP (TODO JUNTO)
-- By ChatGPT

-- Eliminar GUI si ya existe
pcall(function()
	game.CoreGui.TPForwardGui:Destroy()
end)

-- Servicios
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Configuración
local DISTANCIA = 20
local noclip = false

-- GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "TPForwardGui"
ScreenGui.ResetOnSpawn = false

local Button = Instance.new("TextButton", ScreenGui)
Button.Size = UDim2.new(0, 170, 0, 55)
Button.Position = UDim2.new(0, 20, 0.5, -27)
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Text = "TP FORWARD"
Button.TextScaled = true
Button.BorderSizePixel = 0
Button.Active = true
Button.Draggable = true

-- NOCLIP
RunService.Stepped:Connect(function()
	if noclip and character then
		for _, v in pairs(character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
end)

-- Botón TP Forward
Button.MouseButton1Click:Connect(function()
	if not hrp then return end

	noclip = true
	hrp.CFrame = hrp.CFrame + (hrp.CFrame.LookVector * DISTANCIA)
	task.wait(0.3)
	noclip = false
end)

