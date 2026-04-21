-- [[ ♛ SATAYA_ALG: THE EVENT HACKER 2026 ♛ ]] --
-- تهكير الماب بالكامل | صناعة أحداث علنية | واجهة نيون عملاقة

local player = game.Players.LocalPlayer
local Keys = {["7192834"] = "Hacker", ["SATAYA-EVENT"] = "Hacker"}

-- [[ 1. أيقونة الإظهار الصغيرة (خاتم إيتاشي) ]] --
local ToggleGui = Instance.new("ScreenGui", player.PlayerGui)
local OpenBtn = Instance.new("ImageButton", ToggleGui)
OpenBtn.Size = UDim2.new(0, 95, 0, 95); OpenBtn.Position = UDim2.new(0, 20, 0.5, -47)
OpenBtn.Image = "rbxassetid://16377771746"; OpenBtn.BackgroundColor3 = Color3.new(0,0,0)
OpenBtn.Visible = false; Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)

-- [[ 2. الواجهة الرئيسية الإمبراطورية العملاقة ]] --
local MainGui = Instance.new("ScreenGui", player.PlayerGui)
local Main = Instance.new("Frame", MainGui)
Main.Size = UDim2.new(0, 920, 0, 1100); Main.Position = UDim2.new(0.5, -460, 0, 5)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0); Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 75)

-- [ 🌈 نظام النيون "HACKER" المتفجر ]
local Grad = Instance.new("UIGradient", Main)
Grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
})
spawn(function() while wait() do for i = 0, 360, 2 do Grad.Rotation = i; wait(0.01) end end end)

-- [ 📜 القائمة العمودية الإمبراطورية ]
local Scroll = Instance.new("ScrollingFrame", Main); Scroll.Size = UDim2.new(0.96, 0, 0, 1000); Scroll.Position = UDim2.new(0.02, 0, 0.05, 0); Scroll.BackgroundTransparency = 1; Scroll.CanvasSize = UDim2.new(0,0,40,0); Scroll.ScrollBarThickness = 0
Instance.new("UIListLayout", Scroll).HorizontalAlignment = "Center"

-- صورة إيتاشي (ملك التهكير)
local Itachi = Instance.new("ImageLabel", Scroll); Itachi.Size = UDim2.new(0, 860, 0, 500); Itachi.Image = "rbxassetid://16377771746"; Itachi.BackgroundTransparency = 1; Instance.new("UICorner", Itachi)

-- [[ 🛠️ وظائف التهكير والأحداث ]] --
local function TriggerEvent(type)
    if type == "RedSky" then
        -- حدث السماء الحمراء المرعبة
        local sky = Instance.new("Sky", game.Lighting)
        sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt, sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = "rbxassetid://252743303", "rbxassetid://252743303", "rbxassetid://252743303", "rbxassetid://252743303", "rbxassetid://252743303", "rbxassetid://252743303"
        game.Lighting.Ambient = Color3.new(1, 0, 0)
    elseif type == "NoGravity" then
        -- تهكير الجاذبية للسيرفر
        workspace.Gravity = 0
    elseif type == "GlitchMap" then
        -- جعل الماب يهتز ويختفي
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then v.Velocity = Vector3.new(0, 50, 0) end
        end
    end
end

-- [ 🎛️ أزرار القوة المطلقة ]
local function CreateHackBtn(txt, clr, act)
    local b = Instance.new("TextButton", Scroll); b.Size = UDim2.new(0.94, 0, 0, 130); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1,1,1); b.TextScaled = true; b.Visible = false; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() TriggerEvent(act) end)
    return b
end

local E1 = CreateHackBtn("🌑 بدء حدث السماء الحمراء (Red Sky Event)", Color3.fromRGB(150, 0, 0), "RedSky")
local E2 = CreateHackBtn("🌌 تهكير جاذبية الماب بالكامل (0 Gravity)", Color3.fromRGB(50, 0, 150), "NoGravity")
local E3 = CreateHackBtn("☣️ تدمير نظام الماب (Glitch Mode)", Color3.fromRGB(30, 30, 30), "GlitchMap")

-- [ 🔑 نظام الدخول ]
local KeyBox = Instance.new("TextBox", Scroll); KeyBox.Size = UDim2.new(0.85, 0, 0, 100); KeyBox.PlaceholderText = "أدخل كود التهكير المحرم..."; KeyBox.TextScaled = true; Instance.new("UICorner", KeyBox)
local Go = Instance.new("TextButton", Scroll); Go.Size = UDim2.new(0.85, 0, 0, 110); Go.Text = "تنفيذ عملية التهكير الشاملة ⚡"; Go.BackgroundColor3 = Color3.fromRGB(180, 0, 0); Go.TextScaled = true; Instance.new("UICorner", Go)

Go.MouseButton1Click:Connect(function()
    if Keys[KeyBox.Text] or player.Name == "SATAYA_ALG" then
        KeyBox.Visible, Go.Visible = false, false
        E1.Visible, E2.Visible, E3.Visible = true, true, true
    end
end)

-- [ نظام الإغلاق والإظهار ]
local Close = Instance.new("TextButton", Main); Close.Size = UDim2.new(0, 95, 0, 95); Close.Position = UDim2.new(0.91, 0, 0, 0); Close.Text = "X"; Close.BackgroundColor3 = Color3.new(0.8,0,0); Close.TextColor3 = Color3.new(1,1,1); Instance.new("UICorner", Close)
Close.MouseButton1Click:Connect(function() Main.Visible = false; OpenBtn.Visible = true end)
OpenBtn.MouseButton1Click:Connect(function() Main.Visible = true; OpenBtn.Visible = false end)
