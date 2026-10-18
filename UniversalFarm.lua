-- ============================================
-- WATERMARK v3.1 - Single Bar - by Mattix
-- ============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Stats = game:GetService("Stats")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local COLORS = {
    bg        = Color3.fromRGB(25, 12, 35),
    bgLight   = Color3.fromRGB(45, 25, 65),
    pink      = Color3.fromRGB(255, 105, 180),
    pinkLight = Color3.fromRGB(255, 182, 220),
    purple    = Color3.fromRGB(160, 90, 255),
    text      = Color3.fromRGB(255, 230, 245),
    textDim   = Color3.fromRGB(200, 170, 210),
    green     = Color3.fromRGB(120, 255, 150),
    yellow    = Color3.fromRGB(255, 220, 120),
    red       = Color3.fromRGB(255, 100, 120),
}

-- ============================================
-- GUI
-- ============================================
local gui = Instance.new("ScreenGui")
gui.Name = "Mattix_Watermark"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999
gui.Parent = playerGui

local wm = Instance.new("Frame")
wm.Size = UDim2.new(0, 480, 0, 32)
wm.Position = UDim2.new(0.5, -240, 0, 15)
wm.BackgroundColor3 = COLORS.bg
wm.BackgroundTransparency = 0.1
wm.BorderSizePixel = 0
wm.Active = true
wm.Draggable = true
wm.Parent = gui

local wmCorner = Instance.new("UICorner")
wmCorner.CornerRadius = UDim.new(0, 10)
wmCorner.Parent = wm

local wmStroke = Instance.new("UIStroke")
wmStroke.Color = COLORS.pink
wmStroke.Thickness = 1.5
wmStroke.Transparency = 0.2
wmStroke.Parent = wm

task.spawn(function()
    while wm.Parent do
        TweenService:Create(wmStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.7
        }):Play()
        task.wait(1.5)
        TweenService:Create(wmStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.2
        }):Play()
        task.wait(1.5)
    end
end)

-- Pulsing dot
local logoDot = Instance.new("Frame")
logoDot.Size = UDim2.new(0, 8, 0, 8)
logoDot.Position = UDim2.new(0, 12, 0.5, -4)
logoDot.BackgroundColor3 = COLORS.pink
logoDot.BorderSizePixel = 0
logoDot.Parent = wm
local logoDotCorner = Instance.new("UICorner")
logoDotCorner.CornerRadius = UDim.new(1, 0)
logoDotCorner.Parent = logoDot

task.spawn(function()
    while logoDot.Parent do
        TweenService:Create(logoDot, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            BackgroundColor3 = COLORS.pinkLight
        }):Play()
        task.wait(0.8)
        TweenService:Create(logoDot, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            BackgroundColor3 = COLORS.pink
        }):Play()
        task.wait(0.8)
    end
end)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 110, 1, 0)
title.Position = UDim2.new(0, 26, 0, 0)
title.BackgroundTransparency = 1
title.Text = "by Mattix ♡"
title.TextColor3 = COLORS.text
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = wm

-- Separator 1
local sep1 = Instance.new("Frame")
sep1.Size = UDim2.new(0, 1, 0, 16)
sep1.Position = UDim2.new(0, 138, 0.5, -8)
sep1.BackgroundColor3 = COLORS.purple
sep1.BackgroundTransparency = 0.5
sep1.BorderSizePixel = 0
sep1.Parent = wm

-- FPS
local fpsDot = Instance.new("Frame")
fpsDot.Size = UDim2.new(0, 6, 0, 6)
fpsDot.Position = UDim2.new(0, 146, 0.5, -3)
fpsDot.BackgroundColor3 = COLORS.green
fpsDot.BorderSizePixel = 0
fpsDot.Parent = wm
local fpsDotCorner = Instance.new("UICorner")
fpsDotCorner.CornerRadius = UDim.new(1, 0)
fpsDotCorner.Parent = fpsDot

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0, 26, 1, 0)
fpsLabel.Position = UDim2.new(0, 156, 0, 0)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS"
fpsLabel.TextColor3 = COLORS.textDim
fpsLabel.Font = Enum.Font.GothamMedium
fpsLabel.TextSize = 10
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Parent = wm

local fpsVal = Instance.new("TextLabel")
fpsVal.Size = UDim2.new(0, 30, 1, 0)
fpsVal.Position = UDim2.new(0, 180, 0, 0)
fpsVal.BackgroundTransparency = 1
fpsVal.Text = "--"
fpsVal.TextColor3 = COLORS.green
fpsVal.Font = Enum.Font.GothamBold
fpsVal.TextSize = 11
fpsVal.TextXAlignment = Enum.TextXAlignment.Left
fpsVal.Parent = wm

-- Separator 2
local sep2 = Instance.new("Frame")
sep2.Size = UDim2.new(0, 1, 0, 16)
sep2.Position = UDim2.new(0, 214, 0.5, -8)
sep2.BackgroundColor3 = COLORS.purple
sep2.BackgroundTransparency = 0.5
sep2.BorderSizePixel = 0
sep2.Parent = wm

-- PING
local pingDot = Instance.new("Frame")
pingDot.Size = UDim2.new(0, 6, 0, 6)
pingDot.Position = UDim2.new(0, 222, 0.5, -3)
pingDot.BackgroundColor3 = COLORS.yellow
pingDot.BorderSizePixel = 0
pingDot.Parent = wm
local pingDotCorner = Instance.new("UICorner")
pingDotCorner.CornerRadius = UDim.new(1, 0)
pingDotCorner.Parent = pingDot

local pingLabel = Instance.new("TextLabel")
pingLabel.Size = UDim2.new(0, 30, 1, 0)
pingLabel.Position = UDim2.new(0, 232, 0, 0)
pingLabel.BackgroundTransparency = 1
pingLabel.Text = "PING"
pingLabel.TextColor3 = COLORS.textDim
pingLabel.Font = Enum.Font.GothamMedium
pingLabel.TextSize = 10
pingLabel.TextXAlignment = Enum.TextXAlignment.Left
pingLabel.Parent = wm

local pingVal = Instance.new("TextLabel")
pingVal.Size = UDim2.new(0, 45, 1, 0)
pingVal.Position = UDim2.new(0, 262, 0, 0)
pingVal.BackgroundTransparency = 1
pingVal.Text = "-- ms"
pingVal.TextColor3 = COLORS.yellow
pingVal.Font = Enum.Font.GothamBold
pingVal.TextSize = 11
pingVal.TextXAlignment = Enum.TextXAlignment.Left
pingVal.Parent = wm

-- Separator 3
local sep3 = Instance.new("Frame")
sep3.Size = UDim2.new(0, 1, 0, 16)
sep3.Position = UDim2.new(0, 310, 0.5, -8)
sep3.BackgroundColor3 = COLORS.purple
sep3.BackgroundTransparency = 0.5
sep3.BorderSizePixel = 0
sep3.Parent = wm

-- TIME
local timeDot = Instance.new("Frame")
timeDot.Size = UDim2.new(0, 6, 0, 6)
timeDot.Position = UDim2.new(0, 318, 0.5, -3)
timeDot.BackgroundColor3 = COLORS.pink
timeDot.BorderSizePixel = 0
timeDot.Parent = wm
local timeDotCorner = Instance.new("UICorner")
timeDotCorner.CornerRadius = UDim.new(1, 0)
timeDotCorner.Parent = timeDot

local timeVal = Instance.new("TextLabel")
timeVal.Size = UDim2.new(0, 70, 1, 0)
timeVal.Position = UDim2.new(0, 330, 0, 0)
timeVal.BackgroundTransparency = 1
timeVal.Text = "--:--:--"
timeVal.TextColor3 = COLORS.pinkLight
timeVal.Font = Enum.Font.GothamBold
timeVal.TextSize = 11
timeVal.TextXAlignment = Enum.TextXAlignment.Left
timeVal.Parent = wm

-- Separator 4
local sep4 = Instance.new("Frame")
sep4.Size = UDim2.new(0, 1, 0, 16)
sep4.Position = UDim2.new(0, 400, 0.5, -8)
sep4.BackgroundColor3 = COLORS.purple
sep4.BackgroundTransparency = 0.5
sep4.BorderSizePixel = 0
sep4.Parent = wm

-- ============================================
-- AUTOFARM BUTTON
-- ============================================
local launchBtn = Instance.new("TextButton")
launchBtn.Size = UDim2.new(0, 70, 0, 22)
launchBtn.Position = UDim2.new(0, 406, 0.5, -11)
launchBtn.BackgroundColor3 = COLORS.pink
launchBtn.Text = "AUTOFARM"
launchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
launchBtn.Font = Enum.Font.GothamBold
launchBtn.TextSize = 10
launchBtn.AutoButtonColor = false
launchBtn.Parent = wm

local launchCorner = Instance.new("UICorner")
launchCorner.CornerRadius = UDim.new(0, 6)
launchCorner.Parent = launchBtn

local launchStroke = Instance.new("UIStroke")
launchStroke.Color = COLORS.pinkLight
launchStroke.Thickness = 1
launchStroke.Transparency = 0.3
launchStroke.Parent = launchBtn

-- ============================================
-- EMBEDDED AUTOFARM
-- ============================================
local AUTOFARM_SCRIPT = function()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    local CONFIG = {
        holdWTime = 1.5,
        returnDelay = 0.1,
        loopPause = 0.2,
    }

    local BG_IMAGE    = "rbxassetid://14640964801"
    local FLOAT_IMAGE = "rbxassetid://11425468695"

    local function getScooter()
        local scooters = workspace:FindFirstChild("Scooters")
        if not scooters then return nil end
        return scooters:FindFirstChild(player.Name .. "Scooter")
    end

    local function getScooterRoot(scooter)
        if not scooter then return nil end
        if scooter.PrimaryPart then return scooter.PrimaryPart end
        for _, d in ipairs(scooter:GetDescendants()) do
            if d:IsA("BasePart") then return d end
        end
        return nil
    end

    local function grabOwnership()
        local scooter = getScooter()
        if not scooter then return end
        for _, part in ipairs(scooter:GetDescendants()) do
            if part:IsA("BasePart") then
                pcall(function() part:SetNetworkOwner(player) end)
            end
        end
        local char = player.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    pcall(function() part:SetNetworkOwner(player) end)
                end
            end
        end
    end

    local function hardTeleport(scooter, savedScooterCF, savedHRPCF)
        if scooter and savedScooterCF then
            local root = getScooterRoot(scooter)
            if root then
                local offset = savedScooterCF * root.CFrame:Inverse()
                for _, part in ipairs(scooter:GetDescendants()) do
                    if part:IsA("BasePart") and not part.Anchored then
                        pcall(function() part.CFrame = offset * part.CFrame end)
                    end
                end
            end
        end
        if savedHRPCF then
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = savedHRPCF
                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                hrp.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            end
        end
    end

    local function pressW()
        pcall(function() VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.W, false, game) end)
    end

    local function releaseW()
        pcall(function() VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.W, false, game) end)
    end

    local farmActive = false

    local function startFarm()
        local scooter = getScooter()
        if not scooter then return false end
        grabOwnership()
        local root = getScooterRoot(scooter)
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return false end
        local savedScooterCF = root.CFrame
        local savedHRPCF = hrp and hrp.CFrame or nil
        farmActive = true
        task.spawn(function()
            while farmActive do
                grabOwnership()
                pressW()
                task.wait(CONFIG.holdWTime)
                releaseW()
                if not farmActive then break end
                task.wait(CONFIG.returnDelay)
                local sc = getScooter()
                hardTeleport(sc, savedScooterCF, savedHRPCF)
                task.wait(CONFIG.loopPause)
            end
            releaseW()
        end)
        return true
    end

    local function stopFarm()
        farmActive = false
        releaseW()
    end

    -- GUI
    local gui = Instance.new("ScreenGui")
    gui.Name = "Mattix_Anime"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.Parent = playerGui

    -- Floating button
    local floatBtn = Instance.new("ImageButton")
    floatBtn.Size = UDim2.new(0, 55, 0, 55)
    floatBtn.Position = UDim2.new(0, 20, 0.5, -27)
    floatBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    floatBtn.Image = FLOAT_IMAGE
    floatBtn.ScaleType = Enum.ScaleType.Crop
    floatBtn.AutoButtonColor = false
    floatBtn.Parent = gui

    local floatCorner = Instance.new("UICorner")
    floatCorner.CornerRadius = UDim.new(1, 0)
    floatCorner.Parent = floatBtn

    local floatStroke = Instance.new("UIStroke")
    floatStroke.Color = Color3.fromRGB(255, 182, 220)
    floatStroke.Thickness = 2
    floatStroke.Parent = floatBtn

    local dragToggle, dragStart, startPos
    floatBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = true
            dragStart = input.Position
            startPos = floatBtn.Position
        end
    end)
    floatBtn.InputChanged:Connect(function(input)
        if dragToggle and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
            local delta = input.Position - dragStart
            floatBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    floatBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = false
        end
    end)

    -- Menu
    local menu = Instance.new("Frame")
    menu.Size = UDim2.new(0, 280, 0, 340)
    menu.Position = UDim2.new(0.5, -140, 0.5, -170)
    menu.BackgroundColor3 = Color3.fromRGB(30, 15, 40)
    menu.BorderSizePixel = 0
    menu.Visible = false
    menu.Active = true
    menu.Draggable = true
    menu.ClipsDescendants = true
    menu.Parent = gui

    local menuCorner = Instance.new("UICorner")
    menuCorner.CornerRadius = UDim.new(0, 16)
    menuCorner.Parent = menu

    local bg = Instance.new("ImageLabel")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundTransparency = 1
    bg.Image = BG_IMAGE
    bg.ScaleType = Enum.ScaleType.Crop
    bg.ZIndex = 0
    bg.Parent = menu

    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3 = Color3.fromRGB(60, 20, 80)
    overlay.BackgroundTransparency = 0.55
    overlay.BorderSizePixel = 0
    overlay.ZIndex = 1
    overlay.Parent = menu
    local overlayCorner = Instance.new("UICorner")
    overlayCorner.CornerRadius = UDim.new(0, 16)
    overlayCorner.Parent = overlay

    local menuStroke = Instance.new("UIStroke")
    menuStroke.Color = Color3.fromRGB(255, 105, 180)
    menuStroke.Thickness = 2
    menuStroke.Parent = menu

    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0, 50)
    header.BackgroundColor3 = Color3.fromRGB(80, 20, 100)
    header.BackgroundTransparency = 0.3
    header.BorderSizePixel = 0
    header.Text = "by Mattix"
    header.TextColor3 = Color3.fromRGB(255, 220, 240)
    header.Font = Enum.Font.GothamBold
    header.TextSize = 18
    header.ZIndex = 2
    header.Parent = menu

    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 16)
    headerCorner.Parent = header

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 28, 0, 28)
    closeBtn.Position = UDim2.new(1, -35, 0, 10)
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 130)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.ZIndex = 3
    closeBtn.Parent = header

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 8)
    closeCorner.Parent = closeBtn

    local startBtn = Instance.new("TextButton")
    startBtn.Size = UDim2.new(0.8, 0, 0, 55)
    startBtn.Position = UDim2.new(0.1, 0, 0, 75)
    startBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
    startBtn.Text = "START"
    startBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    startBtn.Font = Enum.Font.GothamBold
    startBtn.TextSize = 20
    startBtn.AutoButtonColor = false
    startBtn.ZIndex = 2
    startBtn.Parent = menu

    local startCorner = Instance.new("UICorner")
    startCorner.CornerRadius = UDim.new(0, 14)
    startCorner.Parent = startBtn

    local startStroke = Instance.new("UIStroke")
    startStroke.Color = Color3.fromRGB(255, 200, 230)
    startStroke.Thickness = 2
    startStroke.Parent = startBtn

    local statusFrame = Instance.new("Frame")
    statusFrame.Size = UDim2.new(0.8, 0, 0, 32)
    statusFrame.Position = UDim2.new(0.1, 0, 0, 145)
    statusFrame.BackgroundColor3 = Color3.fromRGB(50, 15, 70)
    statusFrame.BackgroundTransparency = 0.3
    statusFrame.BorderSizePixel = 0
    statusFrame.ZIndex = 2
    statusFrame.Parent = menu

    local statusCorner = Instance.new("UICorner")
    statusCorner.CornerRadius = UDim.new(0, 10)
    statusCorner.Parent = statusFrame

    local statusDot = Instance.new("Frame")
    statusDot.Size = UDim2.new(0, 10, 0, 10)
    statusDot.Position = UDim2.new(0, 12, 0.5, -5)
    statusDot.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    statusDot.BorderSizePixel = 0
    statusDot.ZIndex = 3
    statusDot.Parent = statusFrame
    local dotCorner = Instance.new("UICorner")
    dotCorner.CornerRadius = UDim.new(1, 0)
    dotCorner.Parent = statusDot

    local statusText = Instance.new("TextLabel")
    statusText.Size = UDim2.new(1, -40, 1, 0)
    statusText.Position = UDim2.new(0, 35, 0, 0)
    statusText.BackgroundTransparency = 1
    statusText.Text = "Ready"
    statusText.TextColor3 = Color3.fromRGB(255, 230, 245)
    statusText.Font = Enum.Font.Gotham
    statusText.TextSize = 13
    statusText.TextXAlignment = Enum.TextXAlignment.Left
    statusText.ZIndex = 3
    statusText.Parent = statusFrame

    local function setStatus(txt, color)
        statusText.Text = txt
        if color then statusDot.BackgroundColor3 = color end
    end

    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(0.85, 0, 0, 80)
    info.Position = UDim2.new(0.075, 0, 0, 195)
    info.BackgroundTransparency = 1
    info.Text = "Sit on your scooter and press START\nAuto W + teleport back to start point\nContinuous loop"
    info.TextColor3 = Color3.fromRGB(255, 210, 235)
    info.Font = Enum.Font.Gotham
    info.TextSize = 12
    info.TextWrapped = true
    info.ZIndex = 3
    info.Parent = menu

    local hearts = Instance.new("TextLabel")
    hearts.Size = UDim2.new(1, 0, 0, 20)
    hearts.Position = UDim2.new(0, 0, 1, -25)
    hearts.BackgroundTransparency = 1
    hearts.Text = "♡  ♡  ♡  ♡  ♡"
    hearts.TextColor3 = Color3.fromRGB(255, 150, 200)
    hearts.Font = Enum.Font.GothamBold
    hearts.TextSize = 14
    hearts.ZIndex = 3
    hearts.Parent = menu

    local menuOpen = false

    local function openMenu()
        if menuOpen then return end
        menuOpen = true
        menu.Visible = true
        menu.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(menu, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 280, 0, 340)
        }):Play()
    end

    local function closeMenu()
        if not menuOpen then return end
        menuOpen = false
        local t = TweenService:Create(menu, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0)
        })
        t:Play()
        t.Completed:Wait()
        menu.Visible = false
    end

    floatBtn.MouseButton1Click:Connect(function()
        if menuOpen then closeMenu() else openMenu() end
    end)
    closeBtn.MouseButton1Click:Connect(closeMenu)

    local isRunning = false

    startBtn.MouseButton1Click:Connect(function()
        if not isRunning then
            local sc = getScooter()
            if not sc then
                setStatus("Sit on a scooter first!", Color3.fromRGB(255, 80, 80))
                return
            end
            local ok = startFarm()
            if ok then
                isRunning = true
                startBtn.Text = "STOP"
                TweenService:Create(startBtn, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(220, 40, 100)
                }):Play()
                setStatus("Running...", Color3.fromRGB(120, 255, 150))
            end
        else
            stopFarm()
            isRunning = false
            startBtn.Text = "START"
            TweenService:Create(startBtn, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(255, 105, 180)
            }):Play()
            setStatus("Stopped", Color3.fromRGB(255, 150, 180))
        end
    end)

    task.spawn(function()
        while gui.Parent do
            task.wait(2)
            if isRunning and not getScooter() then
                stopFarm()
                isRunning = false
                startBtn.Text = "START"
                startBtn.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
                setStatus("Scooter lost", Color3.fromRGB(255, 80, 80))
            end
        end
    end)

    print("[Mattix] Autofarm loaded")
end

-- ============================================
-- LAUNCH BUTTON LOGIC
-- ============================================
local autofarmLoaded = false

launchBtn.MouseButton1Click:Connect(function()
    if not autofarmLoaded then
        local success, err = pcall(AUTOFARM_SCRIPT)
        if success then
            autofarmLoaded = true
            launchBtn.Text = "LOADED"
            TweenService:Create(launchBtn, TweenInfo.new(0.3), {
                BackgroundColor3 = COLORS.green
            }):Play()
            task.wait(2)
            launchBtn.Text = "AUTOFARM"
            TweenService:Create(launchBtn, TweenInfo.new(0.3), {
                BackgroundColor3 = COLORS.pink
            }):Play()
        else
            launchBtn.Text = "ERROR"
            TweenService:Create(launchBtn, TweenInfo.new(0.2), {
                BackgroundColor3 = COLORS.red
            }):Play()
            warn("[Mattix] Autofarm error: " .. tostring(err))
            task.wait(2)
            launchBtn.Text = "AUTOFARM"
            TweenService:Create(launchBtn, TweenInfo.new(0.2), {
                BackgroundColor3 = COLORS.pink
            }):Play()
        end
    else
        launchBtn.Text = "ON"
        task.wait(1)
        launchBtn.Text = "AUTOFARM"
    end
end)

launchBtn.MouseEnter:Connect(function()
    TweenService:Create(launchBtn, TweenInfo.new(0.15), {
        BackgroundColor3 = COLORS.purple
    }):Play()
end)
launchBtn.MouseLeave:Connect(function()
    if not autofarmLoaded then
        TweenService:Create(launchBtn, TweenInfo.new(0.15), {
            BackgroundColor3 = COLORS.pink
        }):Play()
    end
end)

-- ============================================
-- STATS UPDATE
-- ============================================
local fps = 60
local frameCount = 0
local lastFpsUpdate = tick()

RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = tick()
    if now - lastFpsUpdate >= 1 then
        fps = frameCount / (now - lastFpsUpdate)
        frameCount = 0
        lastFpsUpdate = now
    end
end)

task.spawn(function()
    while gui.Parent do
        local fpsColor = fps >= 50 and COLORS.green or (fps >= 30 and COLORS.yellow or COLORS.red)
        fpsVal.Text = string.format("%d", math.floor(fps + 0.5))
        fpsVal.TextColor3 = fpsColor

        local ping = 0
        pcall(function()
            ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        end)
        local pingColor = ping < 80 and COLORS.green or (ping < 150 and COLORS.yellow or COLORS.red)
        pingVal.Text = string.format("%d ms", math.floor(ping))
        pingVal.TextColor3 = pingColor

        timeVal.Text = os.date("%H:%M:%S")

        task.wait(0.5)
    end
end)

print("[Mattix] Watermark loaded")
