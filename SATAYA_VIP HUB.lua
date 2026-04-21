-- [[ ♛ SATAYA_ALG: THE IMMORTAL OWNER 2026 ♛ ]] --
-- نظام إخفاء وإظهار الواجهة | تحكم صاحب الماب | نيون متحرك

local player = game.Players.LocalPlayer
local Keys = {["7192834"] = "Owner", ["SAMI-2026"] = "Owner"}

-- [[ 1. إنشاء واجهة الإظهار الصغيرة (Toggle Button) ]] --
local ToggleGui = Instance.new("ScreenGui", player.PlayerGui); ToggleGui.Name = "SatayaToggle"
local OpenBtn = Instance.new("ImageButton", ToggleGui)
OpenBtn.Size = UDim2.new(0, 60, 0, 60); OpenBtn.Position = UDim2.new(0, 10, 0.5, -30)
OpenBtn.Image = "rbxassetid://16377771746"; OpenBtn.BackgroundColor3 = Color3.new(0,0,0)
OpenBtn.Visible = false -- لا تظهر إلا بعد إدخال الكود
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)

-- [[ 2. إنشاء الواجهة العملاقة الرئيسية ]] --
local MainGui = Instance.new("ScreenGui", player.PlayerGui); MainGui.Name = "SatayaMain"
local Main = Instance.new("Frame", MainGui)
Main.Size = UDim2.new(0, 750, 0, 850); Main.Position = UDim2.new(0.5, -375, 0.05, 0)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0); Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 35)

-- [ 🌈 خلفية النيون المتحركة ]
local Grad = Instance.new("UIGradient", Main)
Grad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,0,0)), ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, Color3.new(1,0,0))})
spawn(function() while wait() do for i = 0, 360, 2 do Grad.Rotation = i; wait(0.01) end end end)

-- [ 📜 ترتيب المحتوى ]
local Scroll = Instance.new("ScrollingFrame", Main); Scroll.Size = UDim2.new(0.96, 0, 0, 780); Scroll.Position = UDim2.new(0.02, 0, 0.06, 0); Scroll.BackgroundTransparency = 1; Scroll.CanvasSize = UDim2.new(0,0,15,0); Scroll.ScrollBarThickness = 0
Instance.new("UIListLayout", Scroll).HorizontalAlignment = "Center"

-- صورة إيتاشي
local Itachi = Instance.new("ImageLabel", Scroll); Itachi.Size = UDim2.new(0, 700, 0, 350); Itachi.Image = "rbxassetid://16377771746"; Itachi.BackgroundTransparency = 1

-- واجهة الدخول
local KeyBox = Instance.new("TextBox", Scroll); KeyBox.Size = UDim2.new(0.85, 0, 0, 70); KeyBox.PlaceholderText = "أدخل كود المالك (7 أرقام)..."; KeyBox.TextScaled = true; Instance.new("UICorner", KeyBox)
local Go = Instance.new("TextButton", Scroll); Go.Size = UDim2.new(0.85, 0, 0, 80); Go.Text = "تفعيل صلاحيات صاحب الماب ⚡"; Go.BackgroundColor3 = Color3.fromRGB(150, 0, 0); Go.TextColor3 = Color3.new(1,1,1); Go.TextScaled = true; Instance.new("UICorner", Go)

-- [ 🛠️ وظائف الأزرار ]
local function CreatePower(txt, clr, url)
    local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(0.9, 0, 0, 80); b.Text = txt; b.BackgroundColor3 = clr; b.Visible = false; b.TextScaled = true; b.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
    return b
end

local P1 = CreatePower("💰 استلام مال لانهائي", Color3.fromRGB(0, 120, 0), "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
local P2 = CreatePower("💃 رقصة جماعية للسيرفر", Color3.fromRGB(120, 0, 150), "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")

-- [ 🛡️ نظام الإخفاء والإظهار ]
local Close = Instance.new("TextButton", Main); Close.Size = UDim2.new(0, 60, 0, 60); Close.Position = UDim2.new(0.91, 0, 0, 0); Close.Text = "X"; Close.BackgroundColor3 = Color3.new(0.7,0,0); Close.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", Close)

Close.MouseButton1Click:Connect(function()
    Main.Visible = false
    OpenBtn.Visible = true -- تظهر الأيقونة الصغيرة عند إغلاق الواجهة
end)

OpenBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    OpenBtn.Visible = false -- تختفي الأيقونة عند فتح الواجهة
end)

Go.MouseButton1Click:Connect(function()
    if Keys[KeyBox.Text] or player.Name == "SATAYA_ALG" then
        KeyBox.Visible, Go.Visible = false, false
        P1.Visible, P2.Visible = true, true
        print("تم التفعيل! يمكنك الآن إخفاء وإظهار الواجهة.")
    else Go.Text = "كود خاطئ!"; wait(1); Go.Text = "تفعيل صلاحيات صاحب الماب ⚡" end
end)
