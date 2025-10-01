local RFZ_UI = {}

local Icons = {
    user = "rbxassetid://136509788916321",
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
    play = "rbxassetid://140688372742211",
    home = "rbxassetid://92309619719802"
}

local TweenService = game:GetService("TweenService")

function RFZ_UI.CreateWindow(config)
    config = config or {}
    local Title = config.Title or "RFZ"
    local SubTitle = config.SubTitle or "BY FRONT EVILL"
    local Size = config.Size or UDim2.new(0, 600, 0, 500)
    local MinimizeKey = config.MinimizeKey or Enum.KeyCode.LeftControl
    local ToggleButton = config.ToggleButton or {}
    
    local IsMaximized = false
    local OriginalSize = Size
    local OriginalPosition = UDim2.new(0.5, -Size.X.Offset/2, 0.5, -Size.Y.Offset/2)
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RFZ_UI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game:GetService("CoreGui")
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = Size
    MainFrame.Position = OriginalPosition
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = false
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
    
    local HeaderFrame = Instance.new("Frame")
    HeaderFrame.Name = "Header"
    HeaderFrame.Size = UDim2.new(1, 0, 0, 60)
    HeaderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    HeaderFrame.BorderSizePixel = 0
    HeaderFrame.Parent = MainFrame
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 12)
    HeaderCorner.Parent = HeaderFrame
    
    local HeaderCover = Instance.new("Frame")
    HeaderCover.Size = UDim2.new(1, 0, 0, 15)
    HeaderCover.Position = UDim2.new(0, 0, 1, -15)
    HeaderCover.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    HeaderCover.BorderSizePixel = 0
    HeaderCover.Parent = HeaderFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -150, 0, 25)
    TitleLabel.Position = UDim2.new(0, 15, 0, 10)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = Title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 20
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = HeaderFrame
    
    local SubTitleLabel = Instance.new("TextLabel")
    SubTitleLabel.Size = UDim2.new(1, -150, 0, 16)
    SubTitleLabel.Position = UDim2.new(0, 15, 0, 38)
    SubTitleLabel.BackgroundTransparency = 1
    SubTitleLabel.Text = SubTitle
    SubTitleLabel.TextColor3 = Color3.fromRGB(140, 140, 150)
    SubTitleLabel.TextSize = 12
    SubTitleLabel.Font = Enum.Font.Gotham
    SubTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubTitleLabel.Parent = HeaderFrame
    
    local ControlsFrame = Instance.new("Frame")
    ControlsFrame.Size = UDim2.new(0, 120, 0, 35)
    ControlsFrame.Position = UDim2.new(1, -130, 0, 12)
    ControlsFrame.BackgroundTransparency = 1
    ControlsFrame.Parent = HeaderFrame
    
    local function CreateControlButton(icon, position)
        local Btn = Instance.new("ImageButton")
        Btn.Size = UDim2.new(0, 35, 0, 35)
        Btn.Position = position
        Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        Btn.BorderSizePixel = 0
        Btn.Image = Icons[icon]
        Btn.ImageColor3 = Color3.fromRGB(200, 200, 210)
        Btn.ScaleType = Enum.ScaleType.Fit
        Btn.Parent = ControlsFrame
        
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = Btn
        
        return Btn
    end
    
    local MaximizeBtn = CreateControlButton("maximize", UDim2.new(0, 0, 0, 0))
    local MinimizeBtn = CreateControlButton("minimize", UDim2.new(0, 42, 0, 0))
    local CloseBtn = CreateControlButton("trash", UDim2.new(0, 84, 0, 0))
    
    MaximizeBtn.MouseButton1Click:Connect(function()
        if IsMaximized then
            MainFrame:TweenSizeAndPosition(OriginalSize, OriginalPosition, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
            MaximizeBtn.Image = Icons.maximize
            IsMaximized = false
        else
            OriginalSize = MainFrame.Size
            OriginalPosition = MainFrame.Position
            MainFrame:TweenSizeAndPosition(UDim2.new(1, -40, 1, -40), UDim2.new(0, 20, 0, 20), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
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
    
    local TabsFrame = Instance.new("ScrollingFrame")
    TabsFrame.Size = UDim2.new(1, -20, 0, 50)
    TabsFrame.Position = UDim2.new(0, 10, 0, 70)
    TabsFrame.BackgroundTransparency = 1
    TabsFrame.BorderSizePixel = 0
    TabsFrame.ScrollBarThickness = 0
    TabsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabsFrame.ScrollingDirection = Enum.ScrollingDirection.X
    TabsFrame.Parent = MainFrame
    
    local TabsLayout = Instance.new("UIListLayout")
    TabsLayout.FillDirection = Enum.FillDirection.Horizontal
    TabsLayout.Padding = UDim.new(0, 8)
    TabsLayout.Parent = TabsFrame
    
    TabsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabsFrame.CanvasSize = UDim2.new(0, TabsLayout.AbsoluteContentSize.X, 0, 0)
    end)
    
    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Size = UDim2.new(1, -20, 1, -200)
    ContentFrame.Position = UDim2.new(0, 10, 0, 130)
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.BorderSizePixel = 0
    ContentFrame.ScrollBarThickness = 5
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ContentFrame.Parent = MainFrame
    
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Padding = UDim.new(0, 10)
    ContentLayout.Parent = ContentFrame
    
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentFrame.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 10)
    end)
    
    local FooterFrame = Instance.new("Frame")
    FooterFrame.Size = UDim2.new(1, -20, 0, 55)
    FooterFrame.Position = UDim2.new(0, 10, 1, -65)
    FooterFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    FooterFrame.BorderSizePixel = 0
    FooterFrame.Parent = MainFrame
    
    local FooterCorner = Instance.new("UICorner")
    FooterCorner.CornerRadius = UDim.new(0, 10)
    FooterCorner.Parent = FooterFrame
    
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    local PlayerAvatar = Instance.new("ImageLabel")
    PlayerAvatar.Size = UDim2.new(0, 40, 0, 40)
    PlayerAvatar.Position = UDim2.new(0, 8, 0.5, -20)
    PlayerAvatar.BackgroundTransparency = 1
    PlayerAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
    PlayerAvatar.Parent = FooterFrame
    
    local AvatarCorner = Instance.new("UICorner")
    AvatarCorner.CornerRadius = UDim.new(1, 0)
    AvatarCorner.Parent = PlayerAvatar
    
    local PlayerNameLabel = Instance.new("TextLabel")
    PlayerNameLabel.Size = UDim2.new(1, -120, 0, 20)
    PlayerNameLabel.Position = UDim2.new(0, 55, 0, 10)
    PlayerNameLabel.BackgroundTransparency = 1
    PlayerNameLabel.Text = LocalPlayer.Name
    PlayerNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlayerNameLabel.TextSize = 14
    PlayerNameLabel.Font = Enum.Font.GothamBold
    PlayerNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    PlayerNameLabel.Parent = FooterFrame
    
    local PlayerUsernameLabel = Instance.new("TextLabel")
    PlayerUsernameLabel.Size = UDim2.new(1, -120, 0, 16)
    PlayerUsernameLabel.Position = UDim2.new(0, 55, 0, 28)
    PlayerUsernameLabel.BackgroundTransparency = 1
    PlayerUsernameLabel.Text = "@" .. LocalPlayer.Name
    PlayerUsernameLabel.TextColor3 = Color3.fromRGB(140, 140, 150)
    PlayerUsernameLabel.TextSize = 12
    PlayerUsernameLabel.Font = Enum.Font.Gotham
    PlayerUsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    PlayerUsernameLabel.Parent = FooterFrame
    
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.TextSize = 15
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.Parent = ScreenGui
    
    if ToggleButton.UseImage and ToggleButton.ImageId then
        ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
        ToggleBtn.Position = UDim2.new(0, 15, 0, 15)
        ToggleBtn.Text = ""
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Size = UDim2.new(0.7, 0, 0.7, 0)
        ImageLabel.Position = UDim2.new(0.15, 0, 0.15, 0)
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.Image = tonumber(ToggleButton.ImageId) and "rbxassetid://" .. ToggleButton.ImageId or Icons[ToggleButton.ImageId] or ToggleButton.ImageId
        ImageLabel.ScaleType = Enum.ScaleType.Fit
        ImageLabel.Parent = ToggleBtn
    else
        ToggleBtn.Size = UDim2.new(0, 100, 0, 40)
        ToggleBtn.Position = UDim2.new(0, 15, 0, 15)
        ToggleBtn.Text = ToggleButton.Text or "OPEN"
    end
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 10)
    BtnCorner.Parent = ToggleBtn
    
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
    
    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Size = UDim2.new(0, 300, 1, -20)
    NotificationFrame.Position = UDim2.new(1, -310, 0, 10)
    NotificationFrame.BackgroundTransparency = 1
    NotificationFrame.Parent = ScreenGui
    
    local NotificationLayout = Instance.new("UIListLayout")
    NotificationLayout.Padding = UDim.new(0, 10)
    NotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NotificationLayout.Parent = NotificationFrame
    
    local Window = {}
    local Tabs = {}
    
    function Window:Notify(config)
        config = config or {}
        local Title = config.Title or "Notification"
        local Description = config.Description or ""
        local Duration = config.Duration or 3
        
        local NotifFrame = Instance.new("Frame")
        NotifFrame.Size = UDim2.new(1, 0, 0, 0)
        NotifFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
        NotifFrame.BorderSizePixel = 0
        NotifFrame.ClipsDescendants = true
        NotifFrame.Parent = NotificationFrame
        
        local NotifCorner = Instance.new("UICorner")
        NotifCorner.CornerRadius = UDim.new(0, 10)
        NotifCorner.Parent = NotifFrame
        
        local NotifTitle = Instance.new("TextLabel")
        NotifTitle.Size = UDim2.new(1, -20, 0, 22)
        NotifTitle.Position = UDim2.new(0, 10, 0, 10)
        NotifTitle.BackgroundTransparency = 1
        NotifTitle.Text = Title
        NotifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        NotifTitle.TextSize = 15
        NotifTitle.Font = Enum.Font.GothamBold
        NotifTitle.TextXAlignment = Enum.TextXAlignment.Left
        NotifTitle.Parent = NotifFrame
        
        local NotifDesc = Instance.new("TextLabel")
        NotifDesc.Size = UDim2.new(1, -20, 0, 40)
        NotifDesc.Position = UDim2.new(0, 10, 0, 35)
        NotifDesc.BackgroundTransparency = 1
        NotifDesc.Text = Description
        NotifDesc.TextColor3 = Color3.fromRGB(180, 180, 190)
        NotifDesc.TextSize = 13
        NotifDesc.Font = Enum.Font.Gotham
        NotifDesc.TextXAlignment = Enum.TextXAlignment.Left
        NotifDesc.TextWrapped = true
        NotifDesc.Parent = NotifFrame
        
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
        TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        TabButton.BorderSizePixel = 0
        TabButton.Font = Enum.Font.GothamBold
        TabButton.TextColor3 = Color3.fromRGB(160, 160, 170)
        TabButton.TextSize = 13
        TabButton.AutoButtonColor = false
        TabButton.Parent = TabsFrame
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 10)
        TabCorner.Parent = TabButton
        
        if TabIcon then
            TabButton.Text = ""
            local IconFrame = Instance.new("Frame")
            IconFrame.Size = UDim2.new(1, 0, 1, 0)
            IconFrame.BackgroundTransparency = 1
            IconFrame.Parent = TabButton
            
            local IconImage = Instance.new("ImageLabel")
            IconImage.Size = UDim2.new(0, 24, 0, 24)
            IconImage.Position = UDim2.new(0, 10, 0.5, -12)
            IconImage.BackgroundTransparency = 1
            IconImage.Image = tonumber(TabIcon) and "rbxassetid://" .. TabIcon or Icons[TabIcon] or TabIcon
            IconImage.ImageColor3 = Color3.fromRGB(160, 160, 170)
            IconImage.ScaleType = Enum.ScaleType.Fit
            IconImage.Parent = IconFrame
            
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Size = UDim2.new(1, -45, 1, 0)
            TextLabel.Position = UDim2.new(0, 40, 0, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.Text = TabTitle
            TextLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
            TextLabel.TextSize = 13
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
        TabContentLayout.Padding = UDim.new(0, 10)
        TabContentLayout.Parent = TabContent
        
        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(Tabs) do
                tab.Button.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
                tab.Content.Visible = false
                if tab.Button:FindFirstChild("Frame") then
                    for _, child in pairs(tab.Button.Frame:GetChildren()) do
                        if child:IsA("ImageLabel") then
                            child.ImageColor3 = Color3.fromRGB(160, 160, 170)
                        elseif child:IsA("TextLabel") then
                            child.TextColor3 = Color3.fromRGB(160, 160, 170)
                        end
                    end
                else
                    tab.Button.TextColor3 = Color3.fromRGB(160, 160, 170)
                end
            end
            
            TabButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
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
        end)
        
        if #Tabs == 0 then
            TabButton.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
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
        end
        
        local Tab = {Button = TabButton, Content = TabContent}
        table.insert(Tabs, Tab)
        
        function Tab:AddSection(name, icon)
            local SectionFrame = Instance.new("Frame")
            SectionFrame.Size = UDim2.new(1, 0, 0, 40)
            SectionFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            SectionFrame.BorderSizePixel = 0
            SectionFrame.Parent = TabContent
            
            local SectionCorner = Instance.new("UICorner")
            SectionCorner.CornerRadius = UDim.new(0, 8)
            SectionCorner.Parent = SectionFrame
            
            if icon then
                local LeftIcon = Instance.new("ImageLabel")
                LeftIcon.Size = UDim2.new(0, 22, 0, 22)
                LeftIcon.Position = UDim2.new(0, 10, 0.5, -11)
                LeftIcon.BackgroundTransparency = 1
                LeftIcon.Image = tonumber(icon) and "rbxassetid://" .. icon or Icons[icon] or icon
                LeftIcon.ImageColor3 = Color3.fromRGB(100, 150, 255)
                LeftIcon.ScaleType = Enum.ScaleType.Fit
                LeftIcon.Parent = SectionFrame
                
                local SectionLabel = Instance.new("TextLabel")
                SectionLabel.Size = UDim2.new(1, -45, 1, 0)
                SectionLabel.Position = UDim2.new(0, 38, 0, 0)
                SectionLabel.BackgroundTransparency = 1
                SectionLabel.Text = name
                SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                SectionLabel.TextSize = 15
                SectionLabel.Font = Enum.Font.GothamBold
                SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
                SectionLabel.Parent = SectionFrame
            else
                local SectionLabel = Instance.new("TextLabel")
                SectionLabel.Size = UDim2.new(1, -20, 1, 0)
                SectionLabel.Position = UDim2.new(0, 10, 0, 0)
                SectionLabel.BackgroundTransparency = 1
                SectionLabel.Text = name
                SectionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                SectionLabel.TextSize = 15
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
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
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
            TitleLabel.Size = UDim2.new(1, -20, 0, 22)
            TitleLabel.Position = UDim2.new(0, 10, 0, Description ~= "" and 8 or 14)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 14
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = ButtonFrame
            
            if Description ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -20, 0, 35)
                DescLabel.Position = UDim2.new(0, 10, 0, 32)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = Description
                DescLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
                DescLabel.TextSize = 12
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextWrapped = true
                DescLabel.Parent = ButtonFrame
            end
            
            Button.MouseButton1Click:Connect(function()
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
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.Parent = TabContent
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 8)
            ToggleCorner.Parent = ToggleFrame
            
            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(1, -80, 0, 22)
            TitleLabel.Position = UDim2.new(0, 10, 0, Description ~= "" and 8 or 14)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 14
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = ToggleFrame
            
            if Description ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -80, 0, 35)
                DescLabel.Position = UDim2.new(0, 10, 0, 32)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = Description
                DescLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
                DescLabel.TextSize = 12
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextWrapped = true
                DescLabel.Parent = ToggleFrame
            end
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Size = UDim2.new(0, 52, 0, 28)
            ToggleButton.Position = UDim2.new(1, -62, 0.5, -14)
            ToggleButton.BackgroundColor3 = Default and Color3.fromRGB(80, 200, 120) or Color3.fromRGB(60, 60, 70)
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
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
                    ToggleCircle:TweenPosition(UDim2.new(1, -25, 0.5, -11), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                else
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
                    ToggleCircle:TweenPosition(UDim2.new(0, 3, 0.5, -11), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                end
                Callback(State)
            end)
            
            local Toggle = {}
            function Toggle:SetValue(value)
                State = value
                if State then
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
                    ToggleCircle.Position = UDim2.new(1, -25, 0.5, -11)
                else
                    ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
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
            SliderFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Parent = TabContent
            
            local SliderCorner = Instance.new("UICorner")
            SliderCorner.CornerRadius = UDim.new(0, 8)
            SliderCorner.Parent = SliderFrame
            
            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(0.65, 0, 0, 22)
            TitleLabel.Position = UDim2.new(0, 10, 0, 8)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 14
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = SliderFrame
            
            local ValueLabel = Instance.new("TextLabel")
            ValueLabel.Size = UDim2.new(0.3, 0, 0, 22)
            ValueLabel.Position = UDim2.new(0.7, -10, 0, 8)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.Text = tostring(Default)
            ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueLabel.TextSize = 14
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            ValueLabel.Parent = SliderFrame
            
            if Description ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -20, 0, 28)
                DescLabel.Position = UDim2.new(0, 10, 0, 32)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = Description
                DescLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
                DescLabel.TextSize = 12
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextWrapped = true
                DescLabel.Parent = SliderFrame
            end
            
            local SliderBack = Instance.new("Frame")
            SliderBack.Size = UDim2.new(1, -20, 0, 8)
            SliderBack.Position = UDim2.new(0, 10, 1, -16)
            SliderBack.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            SliderBack.BorderSizePixel = 0
            SliderBack.Parent = SliderFrame
            
            local SliderBackCorner = Instance.new("UICorner")
            SliderBackCorner.CornerRadius = UDim.new(1, 0)
            SliderBackCorner.Parent = SliderBack
            
            local SliderFill = Instance.new("Frame")
            SliderFill.Size = UDim2.new((Default - Min) / (Max - Min), 0, 1, 0)
            SliderFill.BackgroundColor3 = Color3.fromRGB(80, 120, 255)
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
            DropdownFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            DropdownFrame.BorderSizePixel = 0
            DropdownFrame.ClipsDescendants = false
            DropdownFrame.Parent = TabContent
            
            local DropdownCorner = Instance.new("UICorner")
            DropdownCorner.CornerRadius = UDim.new(0, 8)
            DropdownCorner.Parent = DropdownFrame
            
            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(1, -80, 0, 22)
            TitleLabel.Position = UDim2.new(0, 10, 0, Description ~= "" and 8 or 14)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 14
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = DropdownFrame
            
            if Description ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -80, 0, 35)
                DescLabel.Position = UDim2.new(0, 10, 0, 32)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = Description
                DescLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
                DescLabel.TextSize = 12
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextWrapped = true
                DescLabel.Parent = DropdownFrame
            end
            
            local DropButton = Instance.new("TextButton")
            DropButton.Size = UDim2.new(0, 52, 0, 30)
            DropButton.Position = UDim2.new(1, -62, 0.5, -15)
            DropButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            DropButton.BorderSizePixel = 0
            DropButton.Text = "▼"
            DropButton.TextColor3 = Color3.fromRGB(200, 200, 210)
            DropButton.TextSize = 14
            DropButton.Font = Enum.Font.GothamBold
            DropButton.Parent = DropdownFrame
            
            local DropBtnCorner = Instance.new("UICorner")
            DropBtnCorner.CornerRadius = UDim.new(0, 6)
            DropBtnCorner.Parent = DropButton
            
            local DropList = Instance.new("Frame")
            DropList.Size = UDim2.new(1, 0, 0, 0)
            DropList.Position = UDim2.new(0, 0, 1, 5)
            DropList.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
            DropList.BorderSizePixel = 0
            DropList.Visible = false
            DropList.ClipsDescendants = true
            DropList.ZIndex = 10
            DropList.Parent = DropdownFrame
            
            local DropListCorner = Instance.new("UICorner")
            DropListCorner.CornerRadius = UDim.new(0, 8)
            DropListCorner.Parent = DropList
            
            local DropScroll = Instance.new("ScrollingFrame")
            DropScroll.Size = UDim2.new(1, -8, 1, -8)
            DropScroll.Position = UDim2.new(0, 4, 0, 4)
            DropScroll.BackgroundTransparency = 1
            DropScroll.BorderSizePixel = 0
            DropScroll.ScrollBarThickness = 4
            DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            DropScroll.Parent = DropList
            
            local DropLayout = Instance.new("UIListLayout")
            DropLayout.Padding = UDim.new(0, 3)
            DropLayout.Parent = DropScroll
            
            DropLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, DropLayout.AbsoluteContentSize.Y + 4)
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
                OptionButton.Size = UDim2.new(1, -4, 0, 36)
                OptionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
                OptionButton.BorderSizePixel = 0
                OptionButton.Text = ""
                OptionButton.Parent = DropScroll
                
                local OptionCorner = Instance.new("UICorner")
                OptionCorner.CornerRadius = UDim.new(0, 6)
                OptionCorner.Parent = OptionButton
                
                local OptionLabel = Instance.new("TextLabel")
                OptionLabel.Size = UDim2.new(1, Multi and -45 or -20, 1, 0)
                OptionLabel.Position = UDim2.new(0, Multi and 40 or 10, 0, 0)
                OptionLabel.BackgroundTransparency = 1
                OptionLabel.Text = value
                OptionLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
                OptionLabel.TextSize = 13
                OptionLabel.Font = Enum.Font.Gotham
                OptionLabel.TextXAlignment = Enum.TextXAlignment.Left
                OptionLabel.Parent = OptionButton
                
                if Multi then
                    local CheckBox = Instance.new("Frame")
                    CheckBox.Size = UDim2.new(0, 22, 0, 22)
                    CheckBox.Position = UDim2.new(0, 10, 0.5, -11)
                    CheckBox.BackgroundColor3 = table.find(Selected, value) and Color3.fromRGB(80, 200, 120) or Color3.fromRGB(60, 60, 70)
                    CheckBox.BorderSizePixel = 0
                    CheckBox.Parent = OptionButton
                    
                    local CheckCorner = Instance.new("UICorner")
                    CheckCorner.CornerRadius = UDim.new(0, 5)
                    CheckCorner.Parent = CheckBox
                    
                    local CheckIcon = Instance.new("TextLabel")
                    CheckIcon.Size = UDim2.new(1, 0, 1, 0)
                    CheckIcon.BackgroundTransparency = 1
                    CheckIcon.Text = table.find(Selected, value) and "✓" or ""
                    CheckIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
                    CheckIcon.TextSize = 16
                    CheckIcon.Font = Enum.Font.GothamBold
                    CheckIcon.Parent = CheckBox
                    
                    OptionButton.MouseButton1Click:Connect(function()
                        local index = table.find(Selected, value)
                        if index then
                            table.remove(Selected, index)
                            CheckBox.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
                            CheckIcon.Text = ""
                        else
                            table.insert(Selected, value)
                            CheckBox.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
                            CheckIcon.Text = "✓"
                        end
                        Callback(Selected)
                    end)
                else
                    OptionButton.MouseButton1Click:Connect(function()
                        Selected = value
                        DropList.Visible = false
                        IsOpen = false
                        DropButton.Text = "▼"
                        DropList:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
                        DropdownFrame:TweenSize(UDim2.new(1, 0, 0, Description ~= "" and 70 or 50), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
                        Callback(value)
                    end)
                end
            end
            
            DropButton.MouseButton1Click:Connect(function()
                IsOpen = not IsOpen
                if IsOpen then
                    DropList.Visible = true
                    local height = math.min(#Values * 39, 200)
                    DropButton.Text = "▲"
                    DropList:TweenSize(UDim2.new(1, 0, 0, height), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                    DropdownFrame:TweenSize(UDim2.new(1, 0, 0, (Description ~= "" and 70 or 50) + height + 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                else
                    DropButton.Text = "▼"
                    DropList:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true, function()
                        DropList.Visible = false
                    end)
                    DropdownFrame:TweenSize(UDim2.new(1, 0, 0, Description ~= "" and 70 or 50), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
                end
            end)
            
            local Dropdown = {}
            function Dropdown:SetValue(value)
                Selected = value
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
            InputFrame.Size = UDim2.new(1, 0, 0, Description ~= "" and 95 or 75)
            InputFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
            InputFrame.BorderSizePixel = 0
            InputFrame.Parent = TabContent
            
            local InputCorner = Instance.new("UICorner")
            InputCorner.CornerRadius = UDim.new(0, 8)
            InputCorner.Parent = InputFrame
            
            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Size = UDim2.new(1, -20, 0, 22)
            TitleLabel.Position = UDim2.new(0, 10, 0, 8)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 14
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = InputFrame
            
            if Description ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Size = UDim2.new(1, -20, 0, 28)
                DescLabel.Position = UDim2.new(0, 10, 0, 32)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Text = Description
                DescLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
                DescLabel.TextSize = 12
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextWrapped = true
                DescLabel.Parent = InputFrame
            end
            
            local InputBox = Instance.new("TextBox")
            InputBox.Size = UDim2.new(1, -20, 0, 34)
            InputBox.Position = UDim2.new(0, 10, 1, -42)
            InputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
            InputBox.BorderSizePixel = 0
            InputBox.Text = Default
            InputBox.PlaceholderText = Placeholder
            InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            InputBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
            InputBox.TextSize = 13
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
    
    function Window:Toggle()
        MainFrame.Visible = not MainFrame.Visible
        if not ToggleButton.UseImage then
            ToggleBtn.Text = MainFrame.Visible and "CLOSE" or (ToggleButton.Text or "OPEN")
        end
    end
    
    return Window
end

return RFZ_UI
