# RFZ UI Script Documentation

---

## English Section

### 📌 Overview
The **RFZ UI Script** is a Roblox User Interface Library designed to create clean, modern, and customizable GUIs.  
This documentation explains every element and provides a **complete example script** using all features.

---

## 🚀 How to Use
1. Copy the script into your Roblox **executor** or **local script**.  
2. Run the script in-game.  
3. The UI window will appear (toggle with **LeftControl** by default).  
4. Explore tabs, press buttons, move sliders, enter text, pick dropdowns, and toggle features.  
5. Expand the script with more features as you like.  

---

## 🛠 Elements Explained

### 1️⃣ Window
- Creates the main UI window.  
- Options: `Title`, `SubTitle`, `Size`, `Theme`, `Acrylic`, `MinimizeKey`, `ToggleButton`.  

---

### 2️⃣ Tabs
- Organize features into categories.  

**Example:**
```lua
Tabs.Main:AddSection("Main Features", "home")
Tabs.Player:AddSection("Player Controls", "user")
```

---

### 3️⃣ Notifications
Pop-up message to the user.  

**Example:**
```lua
Window:Notify({
    Title = "Welcome!",
    Description = "RFZ UI loaded!",
    Duration = 5
})
```

---

### 4️⃣ Button
Clickable action.  

**Example:**
```lua
Tabs.Main:AddButton({
    Title = "Click Me",
    Description = "Test button",
    Callback = function()
        print("Button Clicked!")
    end
})
```

---

### 5️⃣ Section
Group features under a label.  

---

### 6️⃣ Slider
Adjust numeric values.  
**Example: Change WalkSpeed.**

---

### 7️⃣ Input
Enter text or numbers.  

---

### 8️⃣ Dropdown
Choose one or more options.  

---

### 9️⃣ Toggle
Switch between ON/OFF.  

---

## 📜 Complete Example Script

Here is a full demo script using every feature:  

```lua
-- Import Library GUI
local RFZ_UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Front-Evill/Gui-front-evill/refs/heads/main/Index.lua"))()

-- Create Main Window
local Window = RFZ_UI:CreateWindow({
    Title = "RFZ UI Example",
    SubTitle = "BY FRONT EVILL",
    Size = UDim2.fromOffset(600, 480),
    Theme = "Dark",
    Acrylic = true,
    MinimizeKey = Enum.KeyCode.LeftControl,
    ToggleButton = {
        UseImage = true,
        ImageId = "rbxassetid://75708636934820"
    }
})

-- Create Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Player = Window:AddTab({ Title = "Player", Icon = "user" }),
    Combat = Window:AddTab({ Title = "Combat", Icon = "sword" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    Extra = Window:AddTab({ Title = "Extra", Icon = "star" })
}

-- Notification Example
Window:Notify({
    Title = "Welcome!",
    Description = "RFZ UI loaded successfully. Explore all features!",
    Duration = 6
})

-- BUTTON Example
Tabs.Main:AddButton({
    Title = "Hello Button",
    Description = "Click to print message",
    Callback = function()
        print("Hello from RFZ UI!")
    end
})

-- SECTION Example
Tabs.Main:AddSection("Main Features", "home")

-- SLIDER Example
Tabs.Player:AddSlider("WalkSpeed", {
    Title = "Walk Speed",
    Description = "Adjust your walk speed",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 1,
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end
})

-- INPUT Example
Tabs.Combat:AddInput("TargetName", {
    Title = "Target Name",
    Description = "Enter target player",
    Placeholder = "Type player name...",
    Finished = true,
    Callback = function(Value)
        print("Target set to:", Value)
    end
})

-- DROPDOWN Example
Tabs.Combat:AddDropdown("TargetList", {
    Title = "Auto Target",
    Description = "Select multiple targets",
    Values = {"Player1", "Player2", "NPC", "Boss"},
    Multi = true,
    Default = {"Boss"},
    Callback = function(values)
        print("Selected targets:", table.concat(values, ", "))
    end
})

-- TOGGLE Example
Tabs.Main:AddToggle("AutoFarm", {
    Title = "Auto Farm",
    Description = "Enable farming mode",
    Default = false,
    Callback = function(state)
        if state then
            print("Auto Farm ON")
        else
            print("Auto Farm OFF")
        end
    end
})

-- EXTRA Example Tab
Tabs.Extra:AddButton({
    Title = "Special Action",
    Description = "Runs a custom feature",
    Callback = function()
        game.Players.LocalPlayer:Kick("This is just a demo action!")
    end
})
```

---

## القسم العربي

### 📌 نظرة عامة
سكربت **RFZ UI** مكتبة واجهة رسومية لروبلكس.  
فيه كل الأدوات: نافذة، تبويبات، إشعارات، أزرار، أقسام، منزلقات، إدخالات نصية، قوائم منسدلة، وتبديلات.  

---

### 🚀 كيفية الاستخدام
1. انسخ الكود أعلاه في أداة التنفيذ الخاصة بك.  
2. شغل اللعبة والسكربت.  
3. الواجهة ستظهر ويمكنك التحكم بها.  

---

### 🛠 الأدوات
- زر (Button) → ينفذ أمر.  
- قسم (Section) → لفصل الأدوات.  
- منزلق (Slider) → لتغيير قيمة مثل سرعة المشي.  
- إدخال (Input) → لكتابة نص.  
- قائمة (Dropdown) → لاختيار لاعبين/أهداف.  
- تبديل (Toggle) → لتشغيل/إيقاف ميزة.  
- إشعار (Notification) → يظهر رسالة.  

---

✦ **Author**: FRONT EVILL  
✦ **Project**: RFZ UI Library  
✦ **Version**: 1.0  

```yaml
نسخ الكود
```
