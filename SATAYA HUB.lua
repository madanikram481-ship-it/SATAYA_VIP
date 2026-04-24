-- [[ SATAYA HUB - ITACHI EDITION ]] --

local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SatayaHubGui"
screenGui.Parent = game.CoreGui

-- 1. إنشاء زر الفتح (Open Button)
local openButton = Instance.new("TextButton")
openButton.Name = "OpenButton"
openButton.Parent = screenGui
openButton.Size = UDim2.new(0, 80, 0, 30)
openButton.Position = UDim2.new(0, 10, 0.45, 0)
openButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
openButton.TextColor3 = Color3.new(1, 1, 1)
openButton.Text = "Menu"
openButton.Font = Enum.Font.SourceSansBold

-- 2. إنشاء القائمة الرئيسية (Menu Frame)
local menuFrame = Instance.new("Frame")
menuFrame.Name = "SatayaMenu"
menuFrame.Parent = screenGui
menuFrame.Size = UDim2.new(0, 220, 0, 280)
menuFrame.Position = UDim2.new(-0.4, 0, 0.25, 0) -- مغلقة في البداية
menuFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
menuFrame.BorderSizePixel = 2
menuFrame.BorderColor3 = Color3.fromRGB(150, 0, 0)

-- 3. إضافة صورة إيتاشي (Itachi Background)
local itachiImg = Instance.new("ImageLabel")
itachiImg.Parent = menuFrame
itachiImg.Size = UDim2.new(0, 180, 0, 120)
itachiImg.Position = UDim2.new(0.1, 0, 0.15, 0)
itachiImg.Image = "rbxassetid://6522336214" -- معرف صورة إيتاشي (يمكنك تغييره)
itachiImg.BackgroundTransparency = 1

-- 4. العنوان
local title = Instance.new("TextLabel")
title.Parent = menuFrame
title.Text = "SATAYA HUB"
title.Size = UDim2.new(1, 0, 0.15, 0)
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 18

-- 5. الأزرار (Auto Farm, Speed, Sea 3)
local function createButton(name, pos, color)
    local btn = Instance.new("TextButton")
    btn.Parent = menuFrame
    btn.Text = name
    btn.Size = UDim2.new(0.8, 0, 0.12, 0)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSansBold
    return btn
end

local farmBtn = createButton("Auto Farm (Beta)", UDim2.new(0.1, 0, 0.6, 0), Color3.fromRGB(40, 40, 40))
local speedBtn = createButton("Max Speed", UDim2.new(0.1, 0, 0.73, 0), Color3.fromRGB(40, 40, 40))
local sea3Btn = createButton("Go to Sea 3", UDim2.new(0.1, 0, 0.86, 0), Color3.fromRGB(100, 0, 0))

-- [[ نظام الحركة (Tweening) ]] --

local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local menuOpenPos = UDim2.new(0.02, 0, 0.25, 0)
local menuClosedPos = UDim2.new(-0.4, 0, 0.25, 0)
local isOpened = false

local function toggleMenu()
    if isOpened then
        TweenService:Create(menuFrame, tweenInfo, {Position = menuClosedPos}):Play()
        openButton.Text = "Menu"
    else
        TweenService:Create(menuFrame, tweenInfo, {Position = menuOpenPos}):Play()
        openButton.Text = "Close"
    end
    isOpened = not isOpened
end

openButton.MouseButton1Click:Connect(toggleMenu)

-- [[ برمجة الأوامر ]] --

speedBtn.MouseButton1Click:Connect(function()
    player.Character.Humanoid.WalkSpeed = 100 -- سرعة عالية
end)

sea3Btn.MouseButton1Click:Connect(function()
    -- ملاحظة: هذا الأمر يحتاج لملف RemoteEvent الخاص باللعبة
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelThirdSea")
end)

farmBtn.MouseButton1Click:Connect(function()
    print("Auto Farm Activated - Sataya Hub")
    -- هنا يوضع منطق الفاروم التعليمي
end)
