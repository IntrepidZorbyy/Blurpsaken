local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService('VirtualInputManager')
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local survivorutil = {
    "007n7",
    "BuildermanSentry",
    "BuildermanDispenser",
    "Pizza",
    "BuildermanSentryEffectRange"
}

local Window = Library:NewWindow("Blurpsaken")

local function enableHighlightGen()
    for _, v in pairs(Workspace.Map.Ingame.Map:GetChildren()) do
        if v.Name == "Generator" then
            local existingHighlight = v:FindFirstChild("GeneratorHighlight")
            local progress = v:FindFirstChild("Progress")

            if not existingHighlight then
                local genhighlight = Instance.new("Highlight")
                genhighlight.Parent = v
                genhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                genhighlight.Name = "GeneratorHighlight"
            end

            if progress then
                progress.Changed:Connect(function()
                    if progress.Value == 100 then
                        local highlight = v:FindFirstChild("GeneratorHighlight")
                        if highlight then
                            highlight:Destroy()
                        end
                    end
                end)

                if progress.Value == 100 then
                    local highlight = v:FindFirstChild("GeneratorHighlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end
    end
end

local function enableHighlightTools()
    for _, v in pairs(Workspace.Map.Ingame:GetChildren()) do
        if v:IsA("Tool") then
            local toolhighlight = Instance.new("Highlight")
            toolhighlight.Name = "ToolHighlight"
            toolhighlight.Parent = v
            toolhighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

            if v.Name == "Medkit" then
                toolhighlight.FillColor = Color3.fromRGB(0, 255, 0)
            elseif v.Name == "BloxyCola" then
                toolhighlight.FillColor = Color3.fromRGB(88, 57, 39)
            end
        end
    end
end

local function enableCorruptNatureESP()
    for _, v in pairs(Workspace.Map.Ingame:GetChildren()) do
        if v:IsA("Model") and (v.Name == "HumanoidRootProjectile" or v.Name == "PizzaDeliveryRig" or v.Name == "Bunny" or 
                               v.Name == "Mafiaso1" or v.Name == "Mafiaso2" or v.Name == "Mafiaso3") then
            local highlight = Instance.new("Highlight")
            highlight.Name = "CorruptNatureHighlight"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = v
        end
    end
end

local function enableSurvivorUtilESP()
    for _, v in pairs(Workspace.Map.Ingame:GetChildren()) do
        if v:IsA("Model") or v:IsA("Part") then
            for _, util in pairs(survivorutil) do
                if v.Name == util then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "SurvivorUtilHighlight"
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.FillColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.5
                    highlight.Parent = v
                end
            end
        end
    end
end

local function enableSurvivorHighlighter()
    for _, v in pairs(Workspace.Players.Survivors:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Head") then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "billboard"
            billboard.Size = UDim2.new(0, 100, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = v.Head

            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.Text = v.Name
            textLabel.TextColor3 = Color3.new(1, 1, 1)
            textLabel.TextStrokeTransparency = 0
            textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Parent = billboard

            local highlight = Instance.new("Highlight")
            highlight.Name = "HiThere"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = Color3.fromRGB(0, 255, 0)
            highlight.Parent = v
        end
    end
end

local function enableKillerHighlighter()
    for _, v in pairs(Workspace.Players.Killers:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Head") then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "billboard"
            billboard.Size = UDim2.new(0, 100, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = v.Head

            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.Text = v.Name
            textLabel.TextColor3 = Color3.new(1, 0, 0)
            textLabel.TextStrokeTransparency = 0
            textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Parent = billboard

            local highlight = Instance.new("Highlight")
            highlight.Name = "HiThere"
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.Parent = v
        end
    end
end

local function Do1x1x1x1Popups()
    while true do
        if Do1x1PopupsLoop then
            local player = Players.LocalPlayer
            local popups = player.PlayerGui.TemporaryUI:GetChildren()

            for _, i in ipairs(popups) do
                if i.Name == "1x1x1x1Popup" then
                    local centerX = i.AbsolutePosition.X + (i.AbsoluteSize.X / 2)
                    local centerY = i.AbsolutePosition.Y + (i.AbsoluteSize.Y / 2)

                    VirtualInputManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, true, player.PlayerGui, 1)
                    VirtualInputManager:SendMouseButtonEvent(centerX, centerY, Enum.UserInputType.MouseButton1.Value, false, player.PlayerGui, 1)
                end
            end
        end
        task.wait(0.1)
    end
end

local function autogen()
    while true do
        local success, err = pcall(function()
            local debounce = {}
            while true do
                for _, v in pairs(Workspace.Map.Ingame.Map:GetChildren()) do
                    if v.Name == "Generator" and not debounce[v] then
                        debounce[v] = true
                        v:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
                        task.delay(2.5, function()
                            debounce[v] = nil
                        end)
                    end
                end
                task.wait(0.1)
            end
        end)
        if not success then
            warn("autogen encountered an error: " .. err)
            task.wait(1)
        end
    end
end

local Sprinting = game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting
local m = require(Sprinting)

local function KeepSprintingActive()
    while true do
        m.StaminaLossDisabled = true
        m.MinStamina = -30
        m.StaminaGain = 25
        m.StaminaLoss = 8
        m.SprintSpeed = 27
        task.wait(1)
    end
end

local Tab = Window:NewSection("Main")
local Tab1 = Window:NewSection("ESP")

Tab:CreateButton("Infinite Stamina", function()
    task.spawn(KeepSprintingActive)
end)

Tab:CreateButton("Auto Generator", function()
    task.spawn(autogen)
end)

Tab:CreateButton("Close 1x4 Popups", function()
    task.spawn(Do1x1x1x1Popups)
end)

Tab:CreateButton("Crosshair", function()
    loadstring(game:HttpGet('https://pastefy.app/3yO4M6Ux/raw'))()
end)

Tab1:CreateButton("Generator ESP", function()
    enableHighlightGen()
end)

Tab1:CreateButton("Tool ESP", function()
    enableHighlightTools()
end)

Tab1:CreateButton("c00lkidd ESP", function()
    enableCorruptNatureESP()
end)

Tab1:CreateButton("Survivor Utility ESP", function()
    enableSurvivorUtilESP()
end)

Tab1:CreateButton("Survivor ESP", function()
    enableSurvivorHighlighter()
end)

Tab1:CreateButton("Killer ESP", function()
    enableKillerHighlighter()
end)
