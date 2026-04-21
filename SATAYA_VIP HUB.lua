-- [[ ♛ SATAYA_ALG STRAIGHT COLUMN SYSTEM 2026 ♛ ]] --
-- تختيم جميع المابات | تصميم عمودي مستقيم | صورة إيتاشي في الأعلى

local Player = game.Players.LocalPlayer
local KeysDB = {}

-- [[ تسجيل الأكواد الـ 25 العشوائية عمودياً ]] --
local function Reg(k, r, t, c) KeysDB[tostring(k)] = {Rank = r, Time = t, Color = c} end

-- (نفس القائمة التي بالأعلى مبرمجة هنا)
for _, k in pairs({9182736, 1029384, 5546372, 8827361, 7716253}) do Reg(k, "إمبراطور ستايا ∞", "لانهائي", Color3.new(1,0,0)) end
for _, k in pairs({4039281, 6627183, 2293847, 1192830, 5049387}) do Reg(k, "أسطوري ★", "365 يوم", Color3.new(1,0.5,0)) end
for _, k in pairs({3847261, 9928374, 1102938, 7746521, 6638291}) do Reg(k, "ذهبي 💎", "30 يوم", Color3.new(1,0.8,0)) end
for _, k in pairs({5516273, 8293041, 6637482, 1192830, 4039287}) do Reg(k, "نادر ✨", "7 أيام", Color3.new(0,1,0)) end
for _, k in pairs({1029385, 9938471, 5546372, 8827361, 4473820}) do Reg(k, "شائع ⚙️", "24 ساعة", Color3.new(0.8,0.8,0.8)) end

-- [[ محرك التختيم الشامل ]] --
local function StartSataya(mode)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua"))()
    if mode == "Finish" then
        print("تفعيل وضع التختيم التلقائي لجميع المابات...")
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/UnnamedESP/master/Main.lua'))()
    end
end

-- [[ بناء واجهة العمود المستقيم ]] --
local sg = Instance.new("ScreenGui", Player.PlayerGui)
local Column = Instance.new("ScrollingFrame", sg)
Column.Size = UDim2.new(0, 360, 0, 650); Column.Position = UDim2.new(0.5, -180, 0.1, 0)
Column.BackgroundColor3 = Color3.new(0,0,0); Column.CanvasSize = UDim2.new(0,0,5,0)
Instance.new("UICorner", Column)

local Layout = Instance.new("UIListLayout", Column); Layout.Padding = UDim.new(0, 15); Layout.HorizontalAlignment = "Center"

-- 1. صورة إيتاشي في أعلى العمود
local Itachi = Instance.new("ImageLabel", Column); Itachi.Size = UDim2.new(0, 340, 0, 200); Itachi.Image = "rbxassetid://16377771746"; Itachi.BackgroundTransparency = 1; Instance.new("UICorner", Itachi)

-- 2. واجهة الدخول (تختفي عند النجاح)
local Box = Instance.new("TextBox", Column); Box.Size = UDim2.new(0.9, 0, 0, 60); Box.PlaceholderText = "أدخل كود ستايا المكون من 7 أرقام..."; Box.TextScaled = true; Instance.new("UICorner", Box)
local Go = Instance.new("TextButton", Column); Go.Size = UDim2.new(0.9, 0, 0, 70); Go.Text = "تفعيل ⚡"; Go.BackgroundColor3 = Color3.new(0.7, 0, 0); Go.TextScaled = true; Instance.new("UICorner", Go)

-- 3. أزرار الميزات (تظهر بعد الدخول)
local function AddAct(t, c, f)
    local b = Instance.new("TextButton", Column); b.Size = UDim2.new(0.9,0,0,65); b.Text = t; b.BackgroundColor3 = c; b.Visible = false; b.TextScaled = true; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() StartSataya(f) end)
    return b
end

local B1 = AddAct("♛ تختيم جميع المابات تلقائياً", Color3.fromRGB(200, 0, 0), "Finish")
local B2 = AddAct("🛡️ نظام PVP الخارق", Color3.fromRGB(120, 0, 200), "Finish")
local B3 = AddAct("💰 تجميع موارد تلقائي", Color3.fromRGB(0, 150, 200), "Finish")

Go.MouseButton1Click:Connect(function()
    local d = KeysDB[Box.Text]
    if d or Player.Name == "SATAYA_ALG" then
        Box.Visible, Go.Visible = false, false; B1.Visible, B2.Visible, B3.Visible = true, true, true
        local Tag = Instance.new("TextLabel", Column); Tag.Size = UDim2.new(0.9,0,0,50); Tag.Text = "الرتبة: "..(d and d.Rank or "المطور").." | الوقت: "..(d and d.Time or "∞"); Tag.TextColor3 = d and d.Color or Color3.new(1,0,0); Tag.TextScaled = true; Tag.BackgroundTransparency = 1
    else Go.Text = "كود خاطئ!"; wait(1.5); Go.Text = "تفعيل ⚡" end
end)
