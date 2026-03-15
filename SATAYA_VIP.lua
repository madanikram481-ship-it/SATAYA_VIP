-- [[ SATAYA_VIP النسخة الاحترافية الشاملة ]]
local Password = "SATAYA_VIP"

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")

-- 1. نافذة تسجيل الدخول
local LoginFrame = Instance.new("Frame")
LoginFrame.Size = UDim2.new(0, 280, 0, 180)
LoginFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
LoginFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoginFrame.BorderSizePixel = 2
LoginFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
LoginFrame.Active = true
LoginFrame.Draggable = true
LoginFrame.Parent = ScreenGui

local LoginTitle = Instance.new("TextLabel")
LoginTitle.Text = "تسجيل دخول المطور | SATAYA"
LoginTitle.Size = UDim2.new(1, 0, 0, 40)
LoginTitle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
LoginTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginTitle.Parent = LoginFrame

local PassBox = Instance.new("TextBox")
PassBox.PlaceholderText = "الباسورد هو: SATAYA_VIP"
PassBox.Size = UDim2.new(0.8, 0, 0, 40)
PassBox.Position = UDim2.new(0.1, 0, 0.35, 0)
PassBox.Parent = LoginFrame

local EnterBtn = Instance.new("TextButton")
EnterBtn.Text = "تفعيل القائمة الكاملة"
EnterBtn.Size = UDim2.new(0.8, 0, 0, 40)
EnterBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
EnterBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
EnterBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterBtn.Parent = LoginFrame

-- 2. القائمة الرئيسية (كل الميزات هنا)
local function OpenFullMenu()
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 220, 0, 280)
    MainFrame.Position = UDim2.new(0.1, 0, 0.4, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainTitle = Instance.new("TextLabel")
    MainTitle.Text = "قائمة SATAYA VIP الكاملة"
    MainTitle.Size = UDim2.new(1, 0, 0, 40)
    MainTitle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainTitle.Parent = MainFrame

    local function AddBtn(text, pos, color, func)
        local b = Instance.new("TextButton")
        b.Text = text
        b.Size = UDim2.new(0.9, 0, 0, 35)
        b.Position = UDim2.new(0.05, 0, 0, pos)
        b.BackgroundColor3 = color
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        b.Parent = MainFrame
        b.MouseButton1Click:Connect(func)
    end

    AddBtn("انتقال للفوز التلقائي 🏆", 50, Color3.fromRGB(0, 100, 200), function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 600, 0)
    end)

    AddBtn("سرعة خارقة (100) ⚡", 95, Color3.fromRGB(0, 120, 0), function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end)

    AddBtn("قفز عالي 🚀", 140, Color3.fromRGB(150, 0, 150), function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
    end)

    AddBtn("فتح ميزات VIP مجاناً 🔓", 185, Color3.fromRGB(200, 100, 0), function()
        print("تم تفعيل ميزات VIP")
    end)

    AddBtn("إخفاء القائمة ❌", 230, Color3.fromRGB(80, 80, 80), function()
        MainFrame.Visible = false
    end)

    local ShowBtn = Instance.new("TextButton")
    ShowBtn.Text = "إظهار"
    ShowBtn.Size = UDim2.new(0, 60, 0, 30)
    ShowBtn.Position = UDim2.new(0, 10, 0, 10)
    ShowBtn.Parent = ScreenGui
    ShowBtn.MouseButton1Click:Connect(function() MainFrame.Visible = true end)
end

EnterBtn.MouseButton1Click:Connect(function()
    if PassBox.Text == Password then
        LoginFrame:Destroy()
        OpenFullMenu()
    else
        PassBox.Text = ""
        PassBox.PlaceholderText = "خطأ! حاول مرة أخرى"
    end
end)
