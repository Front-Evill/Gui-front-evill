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
    minus = "rbxassetid://126383291972386",
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
    ScreenGui.Name = "REX 0_0"
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
    ContentFrame.Size = UDim2.new(1, -20, 1, -185)
    ContentFrame.Position = UDim2.new(0, 10, 0, 125)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.BorderSizePixel = 0
    ContentFrame.ScrollBarThickness = 4
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentFrame.Parent = MainFrame
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Padding = UDim.new(0, 8)
    ContentLayout.Parent = ContentFrame
    
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentFrame.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 10)
    end)
    
    local FooterFrame = Instance.new("Frame")
    FooterFrame.Name = "Footer"
    FooterFrame.Size = UDim2.new(1, -20, 0, 50)
    FooterFrame.Position = UDim2.new(0, 10, 1, -60)
    FooterFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    FooterFrame.BackgroundTransparency = 0.5
    FooterFrame.BorderSizePixel = 0
    FooterFrame.Parent = MainFrame
    
    local FooterCorner = Instance.new("UICorner")
    FooterCorner.CornerRadius = UDim.new(0, 8)
    FooterCorner.Parent = FooterFrame
    
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    local PlayerAvatar = Instance.new("ImageLabel")
    PlayerAvatar.Size = UDim2.new(0, 40, 0, 40)
    PlayerAvatar.Position = UDim2.new(0, 5, 0, 5)
    PlayerAvatar.BackgroundTransparency = 1
    PlayerAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
    PlayerAvatar.Parent = FooterFrame
    
    local AvatarCorner = Instance.new("UICorner")
    AvatarCorner.CornerRadius = UDim.new(1, 0)
    AvatarCorner.Parent = PlayerAvatar
    
    local PlayerNameLabel = Instance.new("TextLabel")
    PlayerNameLabel.Size = UDim2.new(1, -110, 0, 20)
    PlayerNameLabel.Position = UDim2.new(0, 50, 0, 5)
    PlayerNameLabel.BackgroundTransparency = 1
    PlayerNameLabel.Text = LocalPlayer.Name
    PlayerNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlayerNameLabel.TextSize = 14
    PlayerNameLabel.Font = Enum.Font.GothamBold
    PlayerNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    PlayerNameLabel.Parent = FooterFrame
    
    local PlayerUsernameLabel = Instance.new("TextLabel")
    PlayerUsernameLabel.Size = UDim2.new(1, -110, 0, 18)
    PlayerUsernameLabel.Position = UDim2.new(0, 50, 0, 25)
    PlayerUsernameLabel.BackgroundTransparency = 1
    PlayerUsernameLabel.Text = "@" .. LocalPlayer.Name
    PlayerUsernameLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    PlayerUsernameLabel.TextSize = 12
    PlayerUsernameLabel.Font = Enum.Font.Gotham
    PlayerUsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    PlayerUsernameLabel.Parent = FooterFrame
    
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
    
    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Name = "Notifications"
    NotificationFrame.Size = UDim2.new(0, 300, 1, -20)
    NotificationFrame.Position = UDim2.new(1, -310, 0, 10)
    NotificationFrame.BackgroundTransparency = 1
    NotificationFrame.Parent = ScreenGui
    
    local NotificationLayout = Instance.new("UIListLayout")
    NotificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotificationLayout.Padding = UDim.new(0, 10)
    NotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NotificationLayout.Parent = NotificationFrame
    
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
    
    function Window:Notify(config)
        config = config or {}
        local Title = config.Title or "Notification"
        local Description = config.Description or ""
        local Duration = config.Duration or 3
        
        local NotifFrame = Instance.new("Frame")
        NotifFrame.Size = UDim2.new(1, 0, 0, 80)
        NotifFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        NotifFrame.BackgroundTransparency = 0.2
        NotifFrame.BorderSizePixel = 0
        NotifFrame.ClipsDescendants = true
        NotifFrame.Parent = NotificationFrame
        
        local NotifCorner = Instance.new("UICorner")
        NotifCorner.CornerRadius = UDim.new(0, 10)
        NotifCorner.Parent = NotifFrame
        
        local NotifTitle = Instance.new("TextLabel")
        NotifTitle.Size = UDim2.new(1, -20, 0, 25)
        NotifTitle.Position = UDim2.new(0, 10, 0, 10)
        NotifTitle.BackgroundTransparency = 1
        NotifTitle.Text = Title
        NotifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotifTitle.TextSize = 16
        NotifTitle.Font = Enum.Font.GothamBold
        NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
        NotifTitle.Parent = NotifFrame
        
        local NotifDesc = Instance.new("TextLabel")
        NotifDesc.Size = UDim2.new(1, -20, 0, 40)
        NotifDesc.Position = UDim2.new(0, 10, 0, 35)
        NotifDesc.BackgroundTransparency = 1
        NotifDesc.Text = Description
        NotifDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
        NotifDesc.TextSize = 13
        NotifDesc.Font = Enum.Font.Gotham
        NotifDesc.TextXAlignment = Enum.TextXAlignment.Left
        NotifDesc.TextWrapped = true
        NotifDesc.Parent = NotifFrame
        
        local Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://6647898651"
        Sound.Volume = 0.5
        Sound.Parent = game:GetService("SoundService")
        Sound:Play()
        
        game:GetService("Debris"):AddItem(Sound, 2)
        
        NotifFrame:TweenSize(UDim2.new(1, 0, 0, 80), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        
        task.wait(Duration)
        
        NotifFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true, function()
            NotifFrame:Destroy()
        end)
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
        
        function Tab:AddSection(name, icon)
            local SectionFrame = Instance.new("Frame")
            SectionFrame.Size = UDim2.new(1, 0, 0, 40)
            SectionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionFrame.BackgroundTransparency = 0.95
            SectionFrame.BorderSizePixel = 0
            SectionFrame.Parent = TabContent
            
            local SectionCorner = Instance.new("UICorner")
            SectionCorner.CornerRadius = UDim.new(0, 8)
            SectionCorner.Parent = SectionFrame
            
            if icon then
                local LeftIcon = Instance.new("ImageLabel")
                LeftIcon.Size = UDim2.new(0, 20, 0, 20)
                LeftIcon.Position = UDim2.new(0, 10, 0.5, -10)
                LeftIcon.BackgroundTransparency = 1
                LeftIcon.Image = tonumber(icon) and "rbxassetid://" .. icon or Icons[icon] or icon
                LeftIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                LeftIcon.ScaleType = Enum.ScaleType.Fit
                LeftIcon.Parent = SectionFrame
                
                local SectionLabel = Instance.new("TextLabel")
                SectionLabel.Size = UDim2.new(1, -80, 1, 0)
                SectionLabel.Position = UDim2.new(0, 35, 0, 0)
                SectionLabel.BackgroundTransparency = 1
                SectionLabel.Text = name
                SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                SectionLabel.TextSize = 16
                SectionLabel.Font = Enum.Font.GothamBold
                SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
                SectionLabel.Parent = SectionFrame
                
                local RightIcon = Instance.new("ImageLabel")
                RightIcon.Size = UDim2.new(0, 20, 0, 20)
                RightIcon.Position = UDim2.new(1, -30, 0.5, -10)
                RightIcon.BackgroundTransparency = 1
                RightIcon.Image = tonumber(icon) and "rbxassetid://" .. icon or Icons[icon] or icon
                RightIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                RightIcon.ScaleType = Enum.ScaleType.Fit
                RightIcon.Parent = SectionFrame
            else
                local SectionLabel = Instance.new("TextLabel")
                SectionLabel.Size = UDim2.new(1, -20, 1, 0)
                SectionLabel.Position = UDim2.new(0, 10, 0, 0)
                SectionLabel.BackgroundTransparency = 1
                SectionLabel.Text = name
                SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                SectionLabel.TextSize = 16
                SectionLabel.Font = Enum.Font.GothamBold
                SectionLabel.TextXAlignment = Enum.TextXAlignment.Center
                SectionLabel.Parent = SectionFrame
            end
            
            return SectionFrame
        end
        
        function Tab:AddButton(config)
            config = config or {}
            local Title = config.Title or "Button"
            local Description = config.Description or ""
            local Callback = config.Callback or function() end
            
            local ButtonFrame = Instance.new("Frame")
            ButtonFrame.Size = UDim2.new(1, 0, 0, Description ~= "" and 70 or 50)
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            ButtonFrame.BackgroundTransparency = 0.5
            ButtonFrame.BorderSizePixel = 0
            ButtonFrame.Parent = TabContent
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = ButtonFrame
            
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(1, 0, 1, 0)
            Button.BackgroundTransparency = 1
            Button.Text = ""
            Button.Parent = ButtonFrame
            
            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(1, -20, 0, 25)
            TitleLabel.Position = UDim2.new(0, 10, 0, Description ~= "" and 10 or 12.5)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 15
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = ButtonFrame
            
            if Description ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -20, 0, 30)
                DescLabel.Position = UDim2.new(0, 10, 0, 35)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = Description
                DescLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                DescLabel.TextSize = 13
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextWrapped = true
                DescLabel.Parent = ButtonFrame
            end
            
            Button.MouseButton1Click:Connect(function()
                ButtonFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                task.wait(0.1)
                ButtonFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                Callback()
            end)
            
            return ButtonFrame
        end
        
        function Tab:AddToggle(id, config)
            config = config or {}
            local Title = config.Title or "Toggle"
            local Description = config.Description or ""
            local Default = config.Default or false
            local Callback = config.Callback or function() end
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(1, 0, 0, Description ~= "" and 70 or 50)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            ToggleFrame.BackgroundTransparency = 0.5
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.Parent = TabContent
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 8)
            ToggleCorner.Parent = ToggleFrame
            
            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(1, -80, 0, 25)
            TitleLabel.Position = UDim2.new(0, 10, 0, Description ~= "" and 10 or 12.5)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 15
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = ToggleFrame
            
            if Description ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -80, 0, 30)
                DescLabel.Position = UDim2.new(0, 10, 0, 35)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = Description
                DescLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                DescLabel.TextSize = 13
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextWrapped = true
                DescLabel.Parent = ToggleFrame
            end
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Size = UDim2.new(0, 50, 0, 28)
            ToggleButton.Position = UDim2.new(1, -60, 0.5, -14)
            ToggleButton.BackgroundColor3 = Default and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(80, 80, 80)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Text = ""
            ToggleButton.Parent = ToggleFrame
            
            local ToggleBtnCorner = Instance.new("UICorner")
            ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
            ToggleBtnCorner.Parent = ToggleButton
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Size = UDim2.new(0, 22, 0, 22)
            ToggleCircle.Position = Default and UDim2.new(1, -25, 0.5, -11) or UDim2.new(0, 3, 0.5, -11)
            ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleCircle.BorderSizePixel = 0
            ToggleCircle.Parent = ToggleButton
            
            local CircleCorner = Instance.new("UICorner")
            CircleCorner.CornerRadius = UDim.new(1, 0)
            CircleCorner.Parent = ToggleCircle
            
            local State = Default
            
            ToggleButton.MouseButton1Click:Connect(function()
                State = not State
                
                if State then
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
                    ToggleCircle:TweenPosition(UDim2.new(1, -25, 0.5, -11), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                else
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    ToggleCircle:TweenPosition(UDim2.new(0, 3, 0.5, -11), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                end
                
                Callback(State)
            end)
            
            local Toggle = {}
            
            function Toggle:SetValue(value)
                State = value
                if State then
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
                    ToggleCircle.Position = UDim2.new(1, -25, 0.5, -11)
                else
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                    ToggleCircle.Position = UDim2.new(0, 3, 0.5, -11)
                end
            end
            
            return Toggle
        end
        
        function Tab:AddSlider(id, config)
            config = config or {}
            local Title = config.Title or "Slider"
            local Description = config.Description or ""
            local Default = config.Default or 0
            local Min = config.Min or 0
            local Max = config.Max or 100
            local Rounding = config.Rounding or 1
            local Callback = config.Callback or function() end
            
            local SliderFrame = Instance.new("Frame")
            SliderFrame.Size = UDim2.new(1, 0, 0, Description ~= "" and 90 or 70)
            SliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            SliderFrame.BackgroundTransparency = 0.5
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Parent = TabContent
            
            local SliderCorner = Instance.new("UICorner")
            SliderCorner.CornerRadius = UDim.new(0, 8)
            SliderCorner.Parent = SliderFrame
            
            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(0.7, 0, 0, 25)
            TitleLabel.Position = UDim2.new(0, 10, 0, 10)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 15
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = SliderFrame
            
            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Size = UDim2.new(0.25, 0, 0, 25)
            ValueLabel.Position = UDim2.new(0.75, -10, 0, 10)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Text = tostring(Default)
            ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueLabel.TextSize = 15
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            ValueLabel.Parent = SliderFrame
            
            if Description ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -20, 0, 25)
                DescLabel.Position = UDim2.new(0, 10, 0, 35)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = Description
                DescLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                DescLabel.TextSize = 13
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextWrapped = true
                DescLabel.Parent = SliderFrame
            end
            
            local SliderBack = Instance.new("Frame")
            SliderBack.Size = UDim2.new(1, -20, 0, 8)
            SliderBack.Position = UDim2.new(0, 10, 1, -18)
            SliderBack.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            SliderBack.BorderSizePixel = 0
            SliderBack.Parent = SliderFrame
            
            local SliderBackCorner = Instance.new("UICorner")
            SliderBackCorner.CornerRadius = UDim.new(1, 0)
            SliderBackCorner.Parent = SliderBack
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Size = UDim2.new((Default - Min) / (Max - Min), 0, 1, 0)
            SliderFill.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            SliderFill.BorderSizePixel = 0
            SliderFill.Parent = SliderBack
            
            local SliderFillCorner = Instance.new("UICorner")
            SliderFillCorner.CornerRadius = UDim.new(1, 0)
            SliderFillCorner.Parent = SliderFill
            
            local Dragging = false
            
            SliderBack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                end
            end)
            
            game:GetService("UserInputService").InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = false
                end
            end)
            
            game:GetService("UserInputService").InputChanged:Connect(function(input)
                if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
                    local Percent = math.clamp((Mouse.X - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X, 0, 1)
                    local Value = math.floor(((Max - Min) * Percent + Min) / Rounding + 0.5) * Rounding
                    
                    SliderFill.Size = UDim2.new(Percent, 0, 1, 0)
                    ValueLabel.Text = tostring(Value)
                    Callback(Value)
                end
            end)
            
            local Slider = {}
            
            function Slider:SetValue(value)
                local Percent = (value - Min) / (Max - Min)
                SliderFill.Size = UDim2.new(Percent, 0, 1, 0)
                ValueLabel.Text = tostring(value)
            end
            
            return Slider
        end
        
        function Tab:AddDropdown(id, config)
            config = config or {}
            local Title = config.Title or "Dropdown"
            local Description = config.Description or ""
            local Values = config.Values or {}
            local Multi = config.Multi or false
            local Default = config.Default or (Multi and {} or 1)
            local Callback = config.Callback or function() end
            
            local DropdownFrame = Instance.new("Frame")
            DropdownFrame.Size = UDim2.new(1, 0, 0, Description ~= "" and 70 or 50)
            DropdownFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            DropdownFrame.BackgroundTransparency = 0.5
            DropdownFrame.BorderSizePixel = 0
            DropdownFrame.ClipsDescendants = false
            DropdownFrame.Parent = TabContent
            
            local DropdownCorner = Instance.new("UICorner")
            DropdownCorner.CornerRadius = UDim.new(0, 8)
            DropdownCorner.Parent = DropdownFrame
            
            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(1, -80, 0, 25)
            TitleLabel.Position = UDim2.new(0, 10, 0, Description ~= "" and 10 or 12.5)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 15
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = DropdownFrame
            
            if Description ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -80, 0, 30)
                DescLabel.Position = UDim2.new(0, 10, 0, 35)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = Description
                DescLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                DescLabel.TextSize = 13
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextWrapped = true
                DescLabel.Parent = DropdownFrame
            end
            
            local DropButton = Instance.new("TextButton")
            DropButton.Size = UDim2.new(0, 50, 0, 30)
            DropButton.Position = UDim2.new(1, -60, 0.5, -15)
            DropButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            DropButton.BorderSizePixel = 0
            DropButton.Text = "▼"
            DropButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropButton.TextSize = 14
            DropButton.Font = Enum.Font.GothamBold
            DropButton.Parent = DropdownFrame
            
            local DropBtnCorner = Instance.new("UICorner")
            DropBtnCorner.CornerRadius = UDim.new(0, 6)
            DropBtnCorner.Parent = DropButton
            
            local DropList = Instance.new("Frame")
            DropList.Size = UDim2.new(1, 0, 0, 0)
            DropList.Position = UDim2.new(0, 0, 1, 5)
            DropList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            DropList.BorderSizePixel = 0
            DropList.Visible = false
            DropList.ClipsDescendants = true
            DropList.ZIndex = 10
            DropList.Parent = DropdownFrame
            
            local DropListCorner = Instance.new("UICorner")
            DropListCorner.CornerRadius = UDim.new(0, 8)
            DropListCorner.Parent = DropList
            
            local DropScroll = Instance.new("ScrollingFrame")
            DropScroll.Size = UDim2.new(1, 0, 1, 0)
            DropScroll.BackgroundTransparency = 1
            DropScroll.BorderSizePixel = 0
            DropScroll.ScrollBarThickness = 4
            DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            DropScroll.Parent = DropList
            
            local DropLayout = Instance.new("UIListLayout")
            DropLayout.SortOrder = Enum.SortOrder.LayoutOrder
            DropLayout.Padding = UDim.new(0, 2)
            DropLayout.Parent = DropScroll
            
            DropLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropLayout.AbsoluteContentSize.Y)
            end)
            
            local Selected = Multi and {} or nil
            local IsOpen = false
            
            if Multi then
                for _, v in ipairs(Default) do
                    table.insert(Selected, v)
                end
            else
                Selected = Values[Default]
            end
            
            for i, value in ipairs(Values) do
                local OptionButton = Instance.new("TextButton")
                OptionButton.Size = UDim2.new(1, -8, 0, 35)
                OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                OptionButton.BackgroundTransparency = 0.3
                OptionButton.BorderSizePixel = 0
                OptionButton.Text = value
                OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                OptionButton.TextSize = 14
                OptionButton.Font = Enum.Font.Gotham
                OptionButton.Parent = DropScroll
                
                local OptionCorner = Instance.new("UICorner")
                OptionCorner.CornerRadius = UDim.new(0, 6)
                OptionCorner.Parent = OptionButton
                
                if Multi then
                    local CheckBox = Instance.new("Frame")
                    CheckBox.Size = UDim2.new(0, 20, 0, 20)
                    CheckBox.Position = UDim2.new(0, 10, 0.5, -10)
                    CheckBox.BackgroundColor3 = table.find(Selected, value) and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(80, 80, 80)
                    CheckBox.BorderSizePixel = 0
                    CheckBox.Parent = OptionButton
                    
                    local CheckCorner = Instance.new("UICorner")
                    CheckCorner.CornerRadius = UDim.new(0, 4)
                    CheckCorner.Parent = CheckBox
                    
                    OptionButton.MouseButton1Click:Connect(function()
                        local index = table.find(Selected, value)
                        if index then
                            table.remove(Selected, index)
                            CheckBox.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                        else
                            table.insert(Selected, value)
                            CheckBox.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
                        end
                        Callback(Selected)
                    end)
                else
                    OptionButton.MouseButton1Click:Connect(function()
                        Selected = value
                        DropList.Visible = false
                        IsOpen = false
                        DropButton.Text = "▼"
                        DropdownFrame.Size = UDim2.new(1, 0, 0, Description ~= "" and 70 or 50)
                        Callback(value)
                    end)
                end
            end
            
            DropButton.MouseButton1Click:Connect(function()
                IsOpen = not IsOpen
                if IsOpen then
                    DropList.Visible = true
                    local height = math.min(#Values * 37, 200)
                    DropList:TweenSize(UDim2.new(1, 0, 0, height), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                    DropdownFrame:TweenSize(UDim2.new(1, 0, 0, (Description ~= "" and 70 or 50) + height + 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                    DropButton.Text = "▲"
                else
                    DropList:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true, function()
                        DropList.Visible = false
                    end)
                    DropdownFrame:TweenSize(UDim2.new(1, 0, 0, Description ~= "" and 70 or 50), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
                    DropButton.Text = "▼"
                end
            end)
            
            local Dropdown = {}
            
            function Dropdown:SetValue(value)
                if Multi then
                    Selected = value
                else
                    Selected = value
                end
            end
            
            return Dropdown
        end
        
        function Tab:AddInput(id, config)
            config = config or {}
            local Title = config.Title or "Input"
            local Description = config.Description or ""
            local Default = config.Default or ""
            local Placeholder = config.Placeholder or "Enter text..."
            local Numeric = config.Numeric or false
            local Finished = config.Finished or false
            local Callback = config.Callback or function() end
            
            local InputFrame = Instance.new("Frame")
            InputFrame.Size = UDim2.new(1, 0, 0, Description ~= "" and 90 or 70)
            InputFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                        InputFrame.BackgroundTransparency = 0.5
                                    InputFrame.BorderSizePixel = 0
            InputFrame.Parent = TabContent
            
            local InputCorner = Instance.new("UICorner")
            InputCorner.CornerRadius = UDim.new(0, 8)
            InputCorner.Parent = InputFrame
            
            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(1, -20, 0, 25)
            TitleLabel.Position = UDim2.new(0, 10, 0, 10)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 15
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = InputFrame
            
            if Description ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -20, 0, 25)
                DescLabel.Position = UDim2.new(0, 10, 0, 35)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = Description
                DescLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
                DescLabel.TextSize = 13
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextWrapped = true
                DescLabel.Parent = InputFrame
            end
            
            local InputBox = Instance.new("TextBox")
            InputBox.Size = UDim2.new(1, -20, 0, 30)
            InputBox.Position = UDim2.new(0, 10, 1, -38)
            InputBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            InputBox.BorderSizePixel = 0
            InputBox.Text = Default
            InputBox.PlaceholderText = Placeholder
            InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            InputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
            InputBox.TextSize = 14
            InputBox.Font = Enum.Font.Gotham
            InputBox.ClearTextOnFocus = false
            InputBox.Parent = InputFrame
            
            local InputBoxCorner = Instance.new("UICorner")
            InputBoxCorner.CornerRadius = UDim.new(0, 6)
            InputBoxCorner.Parent = InputBox
            
            if Numeric then
                InputBox:GetPropertyChangedSignal("Text"):Connect(function()
                    InputBox.Text = InputBox.Text:gsub("[^%d]", "")
                end)
            end
            
            if Finished then
                InputBox.FocusLost:Connect(function(enterPressed)
                    if enterPressed then
                        Callback(InputBox.Text)
                    end
                end)
            else
                InputBox:GetPropertyChangedSignal("Text"):Connect(function()
                    Callback(InputBox.Text)
                end)
            end
            
            local Input = {}
            
            function Input:SetValue(value)
                InputBox.Text = value
            end
            
            return Input
        end
        
        return Tab
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
