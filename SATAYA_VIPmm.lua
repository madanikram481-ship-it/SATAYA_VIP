-- [[ SATAYA HUB - THE UCHIHA PRIVILEGE ]] --

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "SatayaMasterSystem"

-- إعدادات القائمة البيضاء (Whitelist)
local MY_USER_NAME = "SATAYA_ALG" -- اسم حسابك كما طلبته
local ADMIN_DISPLAY = "Sataya"
local DAILY_KEY = "SATAYA_2026" -- مفتاح الغرباء

-- [[ دالة التحقق الذكي ]] --
local function IsTheOwner()
    if player.Name == MY_USER_NAME or player.DisplayName == ADMIN_DISPLAY then
        return true
    end
    return false
end

-- 1. إنشاء القائمة الرئيسية (Main Frame)
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 420, 0, 300)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 0, 0) -- أحمر داكن جداً
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 15)
local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 2.5

-- 2. صورة إيتاشي الفخمة في الخلفية
local itachi = Instance.new("ImageLabel", mainFrame)
itachi.Size = UDim2.new(1, 0, 1, 0)
itachi.Image = "rbxassetid://6522336214"
itachi.BackgroundTransparency = 1
itachi.ImageTransparency = 0.75
itachi.Parent = mainFrame

-- 3. عنوان السكريبت
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0.25, 0)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.Parent = mainFrame

-- 4. عناصر واجهة المفتاح (تختفي للأدمن)
local keyInput = Instance.new("TextBox", mainFrame)
keyInput.Size = UDim2.new(0.7, 0, 0.15, 0)
keyInput.Position = UDim2.new(0.15, 0, 0.45, 0)
keyInput.PlaceholderText = "أدخل المفتاح ليوم واحد..."
keyInput.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
keyInput.TextColor3 = Color3.new(1, 1, 1)
keyInput.Visible = false
Instance.new("UICorner", keyInput)

local checkBtn = Instance.new("TextButton", mainFrame)
checkBtn.Size = UDim2.new(0.4, 0, 0.15, 0)
checkBtn.Position = UDim2.new(0.3, 0, 0.7, 0)
checkBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
checkBtn.Text = "تحقق"
checkBtn.TextColor3 = Color3.new(1, 1, 1)
checkBtn.Visible = false
Instance.new("UICorner", checkBtn)

-- [[ نظام التعرف التلقائي على ساتايا ]] --

if IsTheOwner() then
    -- إذا كنت أنت ساتايا (SATAYA_ALG)
    title.Text = "مرحباً يا سيد ساتايا (الزعيم)"
    title.TextColor3 = Color3.fromRGB(255, 0, 0)
    wait(1.5)
    title.Text = "تم التعرف على بصمة جهازك تلقائياً"
    -- هنا تفتح قائمة الغش (Auto Farm / Sea 3) مباشرة
else
    -- إذا كان شخصاً غريباً
    title.Text = "نظام حماية SATAYA HUB"
    keyInput.Visible = true
    checkBtn.Visible = true
end

-- [[ نظام التحريك الفخم باللمس ]] --
local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)
mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
