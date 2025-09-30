local RFZ_UI = {}

local Icons = {
    user = "rbxassetid://136509788916321",
    ["circle-user-round"] = "rbxassetid://119187409409970",
    ["circle-user"] = "rbxassetid://135598955722566",
    ["user-star"] = "rbxassetid://132039118179132",
    ["user-round-x"] = "rbxassetid://105685644314972",
    ["user-x"] = "rbxassetid://89636354614373",
    ["user-search"] = "rbxassetid://88263660286715",
    ["user-plus"] = "rbxassetid://94590989406401",
    ["user-pen"] = "rbxassetid://98599695611279",
    ["user-minus"] = "rbxassetid://93217113536529",
    eye = "rbxassetid://104204898570798",
    info = "rbxassetid://135092911564619",
    cog = "rbxassetid://139782720158838",
    minus = "rbxassetid://",
    search = "rbxassetid://106781983851832",
    menu = "rbxassetid://10747384394",
    close = "rbxassetid://126383291972386",
    minimize = "rbxassetid://96581319665722",
    maximize = "rbxassetid://76005171102389",
    restore = "rbxassetid://10734949586",
    trash = "rbxassetid://10747384394",
    plus = "rbxassetid://10747372992",
    check = "rbxassetid://10734896144",
    x = "rbxassetid://10747384394",
    settings = "rbxassetid://10734950309",
    home = "rbxassetid://92309619719802",
    minus = "126383291972386"
    ["map-pin-house"] = "rbxassetid://114294190550941",
    ["house-plus"] = "rbxassetid://97631974975774",
    ["house-wifi"] = "rbxassetid://126763764531115",
    ["phone-call"] = "rbxassetid://90184163844046",
    ["save-off"] = "rbxassetid://94322470847780",
    ["signal-high"] = "rbxassetid://84621858630690",
    ["square-terminal"] = "rbxassetid://106713732085548",
    ["undo-dot"] = "rbxassetid://82459573493832",
    ["wifi-low"] = "rbxassetid://119974531057294",
    ["wind-arrow-down"] = "rbxassetid://90150061617947",
    wrench = "rbxassetid://75760172015867",
    terminal = "rbxassetid://86935080083630",
    ["square-menu"] = "rbxassetid://124363101399299",
    ["shield-ban"] = "rbxassetid://125733003566871",
    ["server-crash"] = "rbxassetid://134344214403302",
    ["scroll-text"] = "rbxassetid://130077059981083",
    ["screen-share"] = "rbxassetid://78407375693434",
    play = "rbxassetid://140688372742211",
    ["mouse-pointer-click"] = "rbxassetid://134698195130356",
    ["mouse-pointer"] = "rbxassetid://113303138946224",
    logs = "rbxassetid://125195928083757",
    ["lock-keyhole"] = "rbxassetid://101626468102285",
    ["locate-fixed"] = "rbxassetid://109203127645538",
    locate = "rbxassetid://117295186471094",
    ["map-plus"] = "rbxassetid://132129417926899",
    ["user-round-check"] = "rbxassetid://89989366513016",
    ["shield-user"] = "rbxassetid://72549166753190",
    ["notepad-text-dashed"] = "rbxassetid://109802149635043",
    ["notepad-text"] = "rbxassetid://78566545135896",
    ["panel-right-open"] = "rbxassetid://111855496283529",
    ["panel-top"] = "rbxassetid://105628045711252",
    ["panel-top-close"] = "rbxassetid://137699602890459",
    phone = "rbxassetid://117916436209255",
    ["plug-zap"] = "rbxassetid://88443033310481",
    plug = "rbxassetid://127640868105866",
    ["radio-receiver"] = "rbxassetid://99030541960024",
    ruler = "rbxassetid://130521784598692",
    save = "rbxassetid://124502845829112",
    ["save-all"] = "rbxassetid://115892453613638",
    scaling = "rbxassetid://138342522500370",
    ["signal-medium"] = "rbxassetid://121589034843436",
    smartphone = "rbxassetid://92613756801622",
    ["smartphone-charging"] = "rbxassetid://91659381468634",
    ["square-plus"] = "rbxassetid://123364205903197",
    star = "rbxassetid://126945835022671",
    ["sticky-note"] = "rbxassetid://97120631432477",
    sticker = "rbxassetid://119340479392140",
    ["ticket-x"] = "rbxassetid://105383579491803",
    ["ticket-slash"] = "rbxassetid://104823509312194",
    transgender = "rbxassetid://75596633760140",
    ["trending-up-down"] = "rbxassetid://73414152507992",
    ["undo-2"] = "rbxassetid://116283716426162",
    ["zoom-out"] = "rbxassetid://82816972511954"
}

function RFZ_UI.CreateWindow(config)
    config = config or {}
    local Title = config.Title or "RFZ"
    local SubTitle = config.SubTitle or "BY FRONT EVILL"
    local Size = config.Size or UDim2.new(0, 580, 0, 460)
    local Theme = config.Theme or "Dark"
    local MinimizeKey = config.MinimizeKey or Enum.KeyCode.LeftControl
    local Acrylic = config.Acrylic ~= false
    local ToggleButton = config.ToggleButton or {}
    
    local CurrentTheme = Theme
    local IsMaximized = false
    local OriginalSize = Size
    local OriginalPosition = UDim2.new(0.5, -Size.X.Offset/2, 0.5, -Size.Y.Offset/2)
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RFZ_UI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = Size
    MainFrame.Position = OriginalPosition
    MainFrame.BackgroundColor3 = Theme == "Dark" and Color3.fromRGB(30, 30, 30) or Color3.fromRGB(255, 255, 255)
    MainFrame.BackgroundTransparency = Acrylic and 0.3 or 0.1
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = false
    MainFrame.Parent = ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    local HeaderFrame = Instance.new("Frame")
    HeaderFrame.Name = "Header"
    HeaderFrame.Size = UDim2.new(1, 0, 0, 60)
    HeaderFrame.BackgroundTransparency = 1
    HeaderFrame.Parent = MainFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.Size = UDim2.new(1, -150, 0, 30)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = Title
    TitleLabel.TextColor3 = Theme == "Dark" and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
    TitleLabel.TextSize = 24
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = HeaderFrame
    
    local SubTitleLabel = Instance.new("TextLabel")
    SubTitleLabel.Name = "SubTitle"
    SubTitleLabel.Size = UDim2.new(1, -150, 0, 20)
    SubTitleLabel.Position = UDim2.new(0, 10, 0, 35)
    SubTitleLabel.BackgroundTransparency = 1
    SubTitleLabel.Text = SubTitle
    SubTitleLabel.TextColor3 = Theme == "Dark" and Color3.fromRGB(180, 180, 180) or Color3.fromRGB(100, 100, 100)
    SubTitleLabel.TextSize = 14
    SubTitleLabel.Font = Enum.Font.Gotham
    SubTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubTitleLabel.Parent = HeaderFrame
    
    local ControlsFrame = Instance.new("Frame")
    ControlsFrame.Name = "Controls"
    ControlsFrame.Size = UDim2.new(0, 120, 0, 40)
    ControlsFrame.Position = UDim2.new(1, -130, 0, 10)
    ControlsFrame.BackgroundTransparency = 1
    ControlsFrame.Parent = HeaderFrame
    
    local function CreateControlButton(icon, position)
        local Btn = Instance.new("ImageButton")
        Btn.Size = UDim2.new(0, 35, 0, 35)
        Btn.Position = position
        Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Btn.BackgroundTransparency = 0.5
        Btn.BorderSizePixel = 0
        Btn.Image = Icons[icon]
        Btn.ImageColor3 = Color3.fromRGB(255, 255, 255)
        Btn.ScaleType = Enum.ScaleType.Fit
        Btn.Parent = ControlsFrame
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = Btn
        
        return Btn
    end
    
    local MaximizeBtn = CreateControlButton("maximize", UDim2.new(0, 0, 0, 0))
    local MinimizeBtn = CreateControlButton("minimize", UDim2.new(0, 40, 0, 0))
    local CloseBtn = CreateControlButton("trash", UDim2.new(0, 80, 0, 0))
    
    MaximizeBtn.MouseButton1Click:Connect(function()
        if IsMaximized then
            MainFrame.Size = OriginalSize
            MainFrame.Position = OriginalPosition
            MaximizeBtn.Image = Icons.maximize
            IsMaximized = false
        else
            OriginalSize = MainFrame.Size
            OriginalPosition = MainFrame.Position
            MainFrame.Size = UDim2.new(1, -40, 1, -40)
            MainFrame.Position = UDim2.new(0, 20, 0, 20)
            MaximizeBtn.Image = Icons.restore
            IsMaximized = true
        end
    end)
    
    MinimizeBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
    end)
    
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    local TabsFrame = Instance.new("Frame")
    TabsFrame.Name = "Tabs"
    TabsFrame.Size = UDim2.new(1, -20, 0, 50)
    TabsFrame.Position = UDim2.new(0, 10, 0, 65)
    TabsFrame.BackgroundTransparency = 1
    TabsFrame.Parent = MainFrame
    
    local TabsLayout = Instance.new("UIListLayout")
    TabsLayout.FillDirection = Enum.FillDirection.Horizontal
    TabsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabsLayout.Padding = UDim.new(0, 8)
    TabsLayout.Parent = TabsFrame
    
    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Name = "Content"
    ContentFrame.Size = UDim2.new(1, -20, 1, -135)
    ContentFrame.Position = UDim2.new(0, 10, 0, 125)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.BorderSizePixel = 0
    ContentFrame.ScrollBarThickness = 4
    ContentFrame.Parent = MainFrame
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Padding = UDim.new(0, 8)
    ContentLayout.Parent = ContentFrame
    
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Name = "ToggleButton"
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleBtn.BackgroundTransparency = 0.3
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.TextSize = 18
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.Parent = ScreenGui
    
    if ToggleButton.UseImage and ToggleButton.ImageId then
        ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
        ToggleBtn.Position = UDim2.new(0, 10, 0, 10)
        ToggleBtn.Text = ""
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Size = UDim2.new(1, -10, 1, -10)
        ImageLabel.Position = UDim2.new(0, 5, 0, 5)
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.Image = tonumber(ToggleButton.ImageId) and "rbxassetid://" .. ToggleButton.ImageId or Icons[ToggleButton.ImageId] or ToggleButton.ImageId
        ImageLabel.ScaleType = Enum.ScaleType.Fit
        ImageLabel.Parent = ToggleBtn
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 12)
        Corner.Parent = ToggleBtn
    else
        ToggleBtn.Size = UDim2.new(0, 100, 0, 40)
        ToggleBtn.Position = UDim2.new(0, 10, 0, 10)
        ToggleBtn.Text = ToggleButton.Text or "OPEN"
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = ToggleBtn
    end
    
    local Dragging = false
    local DragInput, DragStart, StartPos
    
    ToggleBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPos = ToggleBtn.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)
    
    ToggleBtn.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            DragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local Delta = input.Position - DragStart
            ToggleBtn.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
        end
    end)
    
    local FrameDragging = false
    local FrameDragInput, FrameDragStart, FrameStartPos
    
    HeaderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            FrameDragging = true
            FrameDragStart = input.Position
            FrameStartPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    FrameDragging = false
                end
            end)
        end
    end)
    
    HeaderFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            FrameDragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == FrameDragInput and FrameDragging then
            local Delta = input.Position - FrameDragStart
            MainFrame.Position = UDim2.new(FrameStartPos.X.Scale, FrameStartPos.X.Offset + Delta.X, FrameStartPos.Y.Scale, FrameStartPos.Y.Offset + Delta.Y)
        end
    end)
    
    ToggleBtn.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
        if not ToggleButton.UseImage then
            ToggleBtn.Text = MainFrame.Visible and "CLOSE" or (ToggleButton.Text or "OPEN")
        end
    end)
    
    game:GetService("UserInputService").InputBegan:Connect(function(input)
        if input.KeyCode == MinimizeKey then
            MainFrame.Visible = not MainFrame.Visible
            if not ToggleButton.UseImage then
                ToggleBtn.Text = MainFrame.Visible and "CLOSE" or (ToggleButton.Text or "OPEN")
            end
        end
    end)
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    local Window = {}
    local Tabs = {}
    local CurrentTab = nil
    
    local function GetThemeColor()
        if CurrentTheme == "Dark" then
            return Color3.fromRGB(30, 30, 30)
        elseif CurrentTheme == "White" then
            return Color3.fromRGB(255, 255, 255)
        elseif CurrentTheme == "Red" then
            return Color3.fromRGB(255, 0, 0)
        elseif CurrentTheme == "Black" then
            return Color3.fromRGB(0, 0, 0)
        elseif CurrentTheme == "Purple" then
            return Color3.fromRGB(150, 0, 255)
        else
            return Color3.fromRGB(30, 30, 30)
        end
    end
    
    function Window:AddTab(config)
        local TabTitle = config.Title or "Tab"
        local TabIcon = config.Icon
        
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(0, 120, 0, 45)
        TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        TabButton.BackgroundTransparency = 0.5
        TabButton.BorderSizePixel = 0
        TabButton.Font = Enum.Font.GothamBold
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabButton.TextSize = 14
        TabButton.Parent = TabsFrame
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 8)
        TabCorner.Parent = TabButton
        
        if TabIcon then
            TabButton.Text = ""
            local IconFrame = Instance.new("Frame")
            IconFrame.Size = UDim2.new(1, 0, 1, 0)
            IconFrame.BackgroundTransparency = 1
            IconFrame.Parent = TabButton
            
            local IconImage = Instance.new("ImageLabel")
            IconImage.Size = UDim2.new(0, 25, 0, 25)
            IconImage.Position = UDim2.new(0, 10, 0.5, -12.5)
            IconImage.BackgroundTransparency = 1
            IconImage.Image = tonumber(TabIcon) and "rbxassetid://" .. TabIcon or Icons[TabIcon] or TabIcon
            IconImage.ImageColor3 = Color3.fromRGB(200, 200, 200)
            IconImage.ScaleType = Enum.ScaleType.Fit
            IconImage.Parent = IconFrame
            
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Size = UDim2.new(1, -45, 1, 0)
            TextLabel.Position = UDim2.new(0, 40, 0, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.Text = TabTitle
            TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            TextLabel.TextSize = 14
            TextLabel.Font = Enum.Font.GothamBold
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel.Parent = IconFrame
        else
            TabButton.Text = TabTitle
        end
        
        local TabContent = Instance.new("Frame")
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.Visible = false
        TabContent.Parent = ContentFrame
        
        local TabContentLayout = Instance.new("UIListLayout")
        TabContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabContentLayout.Padding = UDim.new(0, 8)
        TabContentLayout.Parent = TabContent
        
        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(Tabs) do
                tab.Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                tab.Button.BackgroundTransparency = 0.5
                tab.Content.Visible = false
                
                if tab.Button:FindFirstChild("Frame") then
                    for _, child in pairs(tab.Button.Frame:GetChildren()) do
                        if child:IsA("ImageLabel") then
                            child.ImageColor3 = Color3.fromRGB(200, 200, 200)
                        elseif child:IsA("TextLabel") then
                            child.TextColor3 = Color3.fromRGB(200, 200, 200)
                        end
                    end
                else
                    tab.Button.TextColor3 = Color3.fromRGB(200, 200, 200)
                end
            end
            
            TabButton.BackgroundColor3 = GetThemeColor()
            TabButton.BackgroundTransparency = 0.3
            TabContent.Visible = true
            
            if TabButton:FindFirstChild("Frame") then
                for _, child in pairs(TabButton.Frame:GetChildren()) do
                    if child:IsA("ImageLabel") then
                        child.ImageColor3 = Color3.fromRGB(255, 255, 255)
                    elseif child:IsA("TextLabel") then
                        child.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                end
            else
                TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
            
            CurrentTab = {Button = TabButton, Content = TabContent}
        end)
        
        if #Tabs == 0 then
            TabButton.BackgroundColor3 = GetThemeColor()
            TabButton.BackgroundTransparency = 0.3
            TabContent.Visible = true
            
            if TabButton:FindFirstChild("Frame") then
                for _, child in pairs(TabButton.Frame:GetChildren()) do
                    if child:IsA("ImageLabel") then
                        child.ImageColor3 = Color3.fromRGB(255, 255, 255)
                    elseif child:IsA("TextLabel") then
                        child.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                end
            else
                TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
            
            CurrentTab = {Button = TabButton, Content = TabContent}
        end
        
        local Tab = {
            Button = TabButton,
            Content = TabContent
        }
        
        table.insert(Tabs, Tab)
        
        return TabContent
    end
    
    function Window:SetTheme(theme)
        CurrentTheme = theme
        if theme == "Dark" then
            MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SubTitleLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        elseif theme == "White" then
            MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
            SubTitleLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
        elseif theme == "Red" then
            MainFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SubTitleLabel.TextColor3 = Color3.fromRGB(255, 200, 200)
        elseif theme == "Black" then
            MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SubTitleLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        elseif theme == "Purple" then
            MainFrame.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SubTitleLabel.TextColor3 = Color3.fromRGB(220, 180, 255)
        end
        
        if CurrentTab then
            CurrentTab.Button.BackgroundColor3 = GetThemeColor()
        end
    end
    
    function Window:SetTransparency(value)
        MainFrame.BackgroundTransparency = value
    end
    
    function Window:Toggle()
        MainFrame.Visible = not MainFrame.Visible
        if not ToggleButton.UseImage then
            ToggleBtn.Text = MainFrame.Visible and "CLOSE" or (ToggleButton.Text or "OPEN")
        end
    end
    
    function Window:GetContent()
        return ContentFrame
    end
    
    return Window
end

return RFZ_UI
