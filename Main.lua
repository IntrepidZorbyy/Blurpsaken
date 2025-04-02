local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
background.BackgroundTransparency = 0.8 
background.ClipsDescendants = false 
background.Parent = screenGui

local warningText = Instance.new("TextLabel")
warningText.Size = UDim2.new(0, 400, 0, 120)  
warningText.Position = UDim2.new(0.5, -200, 0.25, 0)  
warningText.BackgroundTransparency = 1 
warningText.TextColor3 = Color3.fromRGB(255, 255, 255) 
warningText.TextSize = 24  -- Text size
warningText.Text = "⚠️ Main Tab: Can enable in the lobby or in a round ⚠️ \n ⚠️ ESP Tab: Can only enable in a round manually each time ⚠️"
warningText.TextWrapped = true  -- Wrap the text if it overflows
warningText.TextScaled = true  -- Scales the text automatically
warningText.Parent = screenGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 220, 0.05, 35)  
button.Position = UDim2.new(0.5, -100, 0.69, 0)  
button.BackgroundColor3 = Color3.fromRGB(65, 65, 65)  
button.TextColor3 = Color3.fromRGB(255, 255, 255)  
button.TextSize = 18  -- Text size
button.Text = "OK, Run Blurpsaken"
button.Parent = screenGui

local buttonUICorner = Instance.new("UICorner")
buttonUICorner.CornerRadius = UDim.new(0, 18)  
buttonUICorner.Parent = button

background.BackgroundTransparency = 1
warningText.TextTransparency = 1
button.TextTransparency = 1

local function fadeIn()
    for i = 1, 10 do
        background.BackgroundTransparency = background.BackgroundTransparency - 0.1
        warningText.TextTransparency = warningText.TextTransparency - 0.1
        button.TextTransparency = button.TextTransparency - 0.1
        wait(0.1)
    end
end

fadeIn()

-- Button click behavior
button.MouseButton1Click:Connect(function()
    -- Fade out the UI
    for i = 1, 10 do
        background.BackgroundTransparency = background.BackgroundTransparency + 0.1
        warningText.TextTransparency = warningText.TextTransparency + 0.1
        button.TextTransparency = button.TextTransparency + 0.1
        wait(0.1)
    end

    screenGui:Destroy()

    loadstring(game:HttpGet('https://raw.githubusercontent.com/IntrepidZorbyy/Blurpsaken/refs/heads/main/source.lua'))()
        print("Blurpsaken is now running!")
end)
