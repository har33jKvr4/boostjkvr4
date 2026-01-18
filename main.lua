local Players = game:GetService("Players")
local player = Players.LocalPlayer

local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local originalSpeed = hum.WalkSpeed
local boosted = false

local SillyBoosterGUI = Instance.new("ScreenGui")
SillyBoosterGUI.Name = "HaroldBoosterGUI"
SillyBoosterGUI.ResetOnSpawn = false
SillyBoosterGUI.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0,140,0,95)
Frame.Position = UDim2.new(1,-153,0.29,0)
Frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
Frame.BorderSizePixel = 0
Frame.Parent = SillyBoosterGUI

local UICorner = Instance.new("UICorner",Frame)
UICorner.CornerRadius = UDim.new(0,10)

local UIStroke = Instance.new("UIStroke",Frame)
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255,255,255) -- BLANCO

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-10,0,26)
Title.Position = UDim2.new(0,5,0,5)
Title.BackgroundTransparency = 1
Title.Text = "HAROLD BOOSTER"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextSize = 14
Title.Font = Enum.Font.GothamBold
Title.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1,-24,0,26)
TextBox.Position = UDim2.new(0,12,0,36)
TextBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
TextBox.Text = "50"
TextBox.TextColor3 = Color3.fromRGB(255,255,255) -- NUMEROS BLANCOS
TextBox.TextSize = 14
TextBox.Font = Enum.Font.Gotham
TextBox.ClearTextOnFocus = false
TextBox.Parent = Frame

local UICorner2 = Instance.new("UICorner",TextBox)
UICorner2.CornerRadius = UDim.new(0,6)

local UIStroke2 = Instance.new("UIStroke",TextBox)
UIStroke2.Color = Color3.fromRGB(0,0,0) -- BORDE NEGRO

local Toggle = Instance.new("Frame")
Toggle.Size = UDim2.new(0,50,0,22)
Toggle.Position = UDim2.new(0.5,-25,1,-30)
Toggle.BackgroundColor3 = Color3.fromRGB(50,50,50)
Toggle.Parent = Frame

local UICorner3 = Instance.new("UICorner",Toggle)
UICorner3.CornerRadius = UDim.new(1,0)

local Circle = Instance.new("Frame")
Circle.Size = UDim2.new(0,18,0,18)
Circle.Position = UDim2.new(0,2,0.5,-9)
Circle.BackgroundColor3 = Color3.fromRGB(255,255,255)
Circle.Parent = Toggle

local UICorner4 = Instance.new("UICorner",Circle)
UICorner4.CornerRadius = UDim.new(1,0)

-- FUNCION TOGGLE
Toggle.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 
	or input.UserInputType == Enum.UserInputType.Touch then
		
		boosted = not boosted
		
		if boosted then
			local val = tonumber(TextBox.Text)
			if val then
				hum.WalkSpeed = val
			end
			
			Circle:TweenPosition(
				UDim2.new(1,-20,0.5,-9),
				"Out","Sine",0.15,true
			)
		else
			hum.WalkSpeed = originalSpeed
			
			Circle:TweenPosition(
				UDim2.new(0,2,0.5,-9),
				"Out","Sine",0.15,true
			)
		end
	end
end)
