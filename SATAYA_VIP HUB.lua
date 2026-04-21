-- [[ ♛ SATAYA_ALG: THE GOD OF SCRIPTS 2026 ♛ ]] --
-- الواجهة العريضة، الطويلة، القابلة للتحريك، والمليئة بالأكواد العشوائية

local player = game.Players.LocalPlayer
local KeyURL = "https://link-to-your-key.com" -- رابط الربح الخاص بك

-- [[ قاعدة بيانات الأكواد العشوائية ]] --
local ValidKeys = {
    -- إمبراطور (لانهائي)
    ["7729104"] = "Admin", ["1182736"] = "Admin", ["9940521"] = "Admin", ["6638271"] = "Admin", ["5050192"] = "Admin",
    -- أسطوري (365 يوم)
    ["8837261"] = "Legend", ["2210394"] = "Legend", ["4475829"] = "Legend", ["3394817"] = "Legend", ["1029384"] = "Legend",
    -- مجاني
    ["SATAYA-2026"] = "Free"
}

-- [[ إنشاء الواجهة الإمبراطورية (عريضة وطويلة) ]] --
local sg = Instance.new("ScreenGui", player.PlayerGui); sg.Name = "SatayaGodMode"
local Main = Instance.new("Frame", sg)
Main.Size = UDim2.new(0, 600, 0, 750); Main.Position = UDim2.new(0.5, -300, 0.1, 0)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10); Main.BorderSizePixel = 4; Main.BorderColor3 = Color3.new(1, 0, 0)
Instance.new("UICorner", Main)

-- نظام التحريك (Drag)
local drag = Instance.new("TextButton", Main); drag.Size = UDim2.new(1, 0, 0, 45); drag.Text = "♛ لوحة تحكم إمبراطورية ستايا ♛"; drag.BackgroundColor3 = Color3.new(0,0,0); drag.TextColor3 = Color3.new(1,1,1); drag.TextScaled = true
local d, s, ip; drag.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = true; s = i.Position; ip = Main.Position end end) drag.InputChanged:Connect(function(i) if d and i.UserInputType == Enum.UserInputType.MouseMovement then local del = i.Position - s; Main.Position = UDim2.new(ip.X.Scale, ip.X.Offset + del.X, ip.Y.Scale, ip.Y.Offset + del.Y) end end) drag.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then d = false end end)

-- زر الإغلاق (X)
local Close = Instance.new("TextButton", Main); Close.Size = UDim2.new(0, 50, 0, 50); Close.Position = UDim2.new(0.91, 0, 0, 0); Close.Text = "X"; Close.BackgroundColor3 = Color3.new(0.7,0,0); Close.TextColor3 = Color3.new(1,1,1); Close.TextScaled = true
Close.MouseButton1Click:Connect(function() sg:Destroy() end)

-- القائمة العمودية المستقيمة
local Scroll = Instance.new("ScrollingFrame", Main); Scroll.Size = UDim2.new(0.96, 0, 0, 680); Scroll.Position = UDim2.new(0.02, 0, 0.08, 0); Scroll.BackgroundTransparency = 1; Scroll.CanvasSize = UDim2.new(0,0,12,0); Scroll.ScrollBarThickness = 5
local Layout = Instance.new("UIListLayout", Scroll); Layout.Padding = UDim.new(0, 15); Layout.HorizontalAlignment = "Center"

-- 1. صورة إيتاشي الفخمة
local Itachi = Instance.new("ImageLabel", Scroll); Itachi.Size = UDim2.new(0, 560, 0, 320); Itachi.Image = "rbxassetid://16377771746"; Itachi.BackgroundTransparency = 1; Instance.new("UICorner", Itachi)

-- 2. واجهة الدخول
local GetKey = Instance.new("TextButton", Scroll); GetKey.Size = UDim2.new(0.85, 0, 0, 65); GetKey.Text = "الحصول على الكود (نسخ الرابط المختصر)"; GetKey.BackgroundColor3 = Color3.fromRGB(0, 100, 200); GetKey.TextScaled = true; Instance.new("UICorner", GetKey)
GetKey.MouseButton1Click:Connect(function() setclipboard(KeyURL); print("تم نسخ رابط الأرباح!") end)

local Box = Instance.new("TextBox", Scroll); Box.Size = UDim2.new(0.85, 0, 0, 65); Box.PlaceholderText = "أدخل كود الـ 7 أرقام..."; Box.TextScaled = true; Instance.new("UICorner", Box)
local Go = Instance.new("TextButton", Scroll); Go.Size = UDim2.new(0.85, 0, 0, 75); Go.Text = "تفعيل وضع المطور ⚡"; Go.BackgroundColor3 = Color3.fromRGB(180, 0, 0); Go.TextScaled = true; Instance.new("UICorner", Go)

-- 3. ميزات التحكم الكلي (تظهر بعد الكود)
local function CreatePower(txt, clr, url)
    local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(0.9, 0, 0, 75); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1,1,1); b.TextScaled = true; b.Visible = false; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
    return b
end

local P1 = CreatePower("👑 أدمن المطور (قوة صاحب الماب)", Color3.fromRGB(40,40,40), "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
local P2 = CreatePower("⚔️ تختيم المابات والسرقة (Vape V4)", Color3.fromRGB(150,0,0), "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua")
local P3 = AddPower("💰 سرقة الموارد (Universal Hub)", Color3.fromRGB(0, 120, 0), "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua")

Go.MouseButton1Click:Connect(function()
    local rank = ValidKeys[Box.Text]
    if rank or player.Name == "SATAYA_ALG" then
        Box.Visible, Go.Visible, GetKey.Visible = false, false, false
        P1.Visible, P2.Visible, P3.Visible = true, true, true
        print("تم التفعيل! أنت الآن صاحب الماب.")
    else Go.Text = "كود عشوائي غير صحيح!"; wait(1.5); Go.Text = "تفعيل وضع المطور ⚡" end
end)
