local RFZ_UI = {}

function RFZ_UI:CreateWindow(config)
    local Title = config.Title or "RFZ"
    local SubTitle = config.SubTitle or "BY FRONT EVILL"
    local Size = config.Size or UDim2.new(0, 580, 0, 460)
    local Theme = config.Theme or "Dark"
    local MinimizeKey = config.MinimizeKey or Enum.KeyCode.LeftControl
    local Acrylic = config.Acrylic ~= false
    local ToggleButton = config.ToggleButton or {}
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RFZ_UI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = Size
    MainFrame.Position = UDim2.new(0.5, -Size.X.Offset/2, 0.5, -Size.Y.Offset/2)
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
    TitleLabel.Size = UDim2.new(1, -20, 0, 30)
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
    SubTitleLabel.Size = UDim2.new(1, -20, 0, 20)
    SubTitleLabel.Position = UDim2.new(0, 10, 0, 35)
    SubTitleLabel.BackgroundTransparency = 1
    SubTitleLabel.Text = SubTitle
    SubTitleLabel.TextColor3 = Theme == "Dark" and Color3.fromRGB(180, 180, 180) or Color3.fromRGB(100, 100, 100)
    SubTitleLabel.TextSize = 14
    SubTitleLabel.Font = Enum.Font.Gotham
    SubTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubTitleLabel.Parent = HeaderFrame
    
    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Name = "Content"
    ContentFrame.Size = UDim2.new(1, -20, 1, -80)
    ContentFrame.Position = UDim2.new(0, 10, 0, 70)
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
    ToggleBtn.Size = UDim2.new(0, 100, 0, 40)
    ToggleBtn.Position = UDim2.new(0, 10, 0, 10)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleBtn.BackgroundTransparency = 0.3
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.TextSize = 18
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.Parent = ScreenGui
    
    if ToggleButton.UseImage and ToggleButton.ImageId then
        ToggleBtn.Text = ""
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Size = UDim2.new(1, -10, 1, -10)
        ImageLabel.Position = UDim2.new(0, 5, 0, 5)
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.Image = "rbxassetid://" .. ToggleButton.ImageId
        ImageLabel.ScaleType = Enum.ScaleType.Fit
        ImageLabel.Parent = ToggleBtn
    else
        ToggleBtn.Text = ToggleButton.Text or "OPEN"
    end
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
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
    
    ScreenGui.Parent = game:GetService("CoreGui")
    
    local Window = {}
    
    function Window:SetTheme(theme)
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
