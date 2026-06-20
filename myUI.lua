local Quantum = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local TextService = game:GetService("TextService")
local RunService = game:GetService("RunService")

local Config = {
    Name = "Quantum",
    DefaultVersion = "5.1",
    DefaultTheme = "QuantumDark",
    CornerRadius = 10,
    ElementCorner = 6,
    SidebarWidth = 140,
    TopbarHeight = 38,
    MinWindowSize = Vector2.new(320, 220),
    Themes = {
        QuantumDark = {
            Background = Color3.fromRGB(0, 0, 0),
            Sidebar = Color3.fromRGB(5, 5, 5),
            Accent = Color3.fromRGB(80, 220, 120),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(120, 120, 130),
            Element = Color3.fromRGB(12, 12, 12),
            ElementHover = Color3.fromRGB(20, 20, 20),
            ToggleOn = Color3.fromRGB(80, 220, 120),
            ToggleOff = Color3.fromRGB(40, 40, 45),
            Border = Color3.fromRGB(30, 30, 35),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(80, 220, 120)
        },
        Dark = {
            Background = Color3.fromRGB(18, 18, 22),
            Sidebar = Color3.fromRGB(24, 24, 30),
            Accent = Color3.fromRGB(124, 92, 242),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(150, 150, 160),
            Element = Color3.fromRGB(32, 32, 40),
            ElementHover = Color3.fromRGB(42, 42, 52),
            ToggleOn = Color3.fromRGB(124, 92, 242),
            ToggleOff = Color3.fromRGB(50, 50, 60),
            Border = Color3.fromRGB(50, 50, 60),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(90, 220, 140)
        },
        Light = {
            Background = Color3.fromRGB(245, 245, 250),
            Sidebar = Color3.fromRGB(235, 235, 240),
            Accent = Color3.fromRGB(100, 80, 220),
            Text = Color3.fromRGB(30, 30, 35),
            SubText = Color3.fromRGB(100, 100, 110),
            Element = Color3.fromRGB(220, 220, 230),
            ElementHover = Color3.fromRGB(210, 210, 220),
            ToggleOn = Color3.fromRGB(100, 80, 220),
            ToggleOff = Color3.fromRGB(180, 180, 190),
            Border = Color3.fromRGB(200, 200, 210),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(60, 200, 120)
        },
        Ocean = {
            Background = Color3.fromRGB(18, 22, 28),
            Sidebar = Color3.fromRGB(24, 28, 36),
            Accent = Color3.fromRGB(60, 180, 220),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(150, 150, 160),
            Element = Color3.fromRGB(32, 38, 48),
            ElementHover = Color3.fromRGB(42, 50, 62),
            ToggleOn = Color3.fromRGB(60, 180, 220),
            ToggleOff = Color3.fromRGB(50, 50, 60),
            Border = Color3.fromRGB(50, 50, 60),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(80, 220, 160)
        },
        Midnight = {
            Background = Color3.fromRGB(18, 18, 22),
            Sidebar = Color3.fromRGB(24, 24, 30),
            Accent = Color3.fromRGB(220, 60, 120),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(150, 150, 160),
            Element = Color3.fromRGB(32, 32, 40),
            ElementHover = Color3.fromRGB(42, 42, 52),
            ToggleOn = Color3.fromRGB(220, 60, 120),
            ToggleOff = Color3.fromRGB(50, 50, 60),
            Border = Color3.fromRGB(50, 50, 60),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(220, 60, 120)
        },
        Forest = {
            Background = Color3.fromRGB(18, 22, 18),
            Sidebar = Color3.fromRGB(24, 30, 24),
            Accent = Color3.fromRGB(80, 200, 120),
            Text = Color3.fromRGB(240, 240, 245),
            SubText = Color3.fromRGB(150, 150, 160),
            Element = Color3.fromRGB(32, 40, 32),
            ElementHover = Color3.fromRGB(42, 52, 42),
            ToggleOn = Color3.fromRGB(80, 200, 120),
            ToggleOff = Color3.fromRGB(50, 50, 60),
            Border = Color3.fromRGB(50, 50, 60),
            Shadow = Color3.fromRGB(0, 0, 0),
            Overlay = Color3.fromRGB(0, 0, 0),
            Success = Color3.fromRGB(100, 220, 100)
        }
    }
}

local Icons = {
    Custom = "rbxassetid://109647740279101",
    Home = "rbxassetid://7733960981",
    Settings = "rbxassetid://7734053495",
    User = "rbxassetid://7743875962",
    Eye = "rbxassetid://7733774602",
    EyeOff = "rbxassetid://7733774495",
    Shield = "rbxassetid://7734056608",
    ShieldCheck = "rbxassetid://7734056411",
    Search = "rbxassetid://7734052925",
    ChevronDown = "rbxassetid://7733717447",
    ChevronRight = "rbxassetid://7733717755",
    ChevronUp = "rbxassetid://7733919605",
    ChevronLeft = "rbxassetid://7733717651",
    X = "rbxassetid://7743878857",
    Minus = "rbxassetid://7734000129",
    Maximize = "rbxassetid://7733992982",
    Maximize2 = "rbxassetid://7733992901",
    Minimize = "rbxassetid://7733997941",
    Minimize2 = "rbxassetid://7733997870",
    Moon = "rbxassetid://7743870134",
    Sun = "rbxassetid://7734068495",
    Palette = "rbxassetid://7734021595",
    Sliders = "rbxassetid://7734058803",
    ToggleLeft = "rbxassetid://7734091286",
    ToggleRight = "rbxassetid://7743873539",
    Type = "rbxassetid://7743874740",
    MousePointer = "rbxassetid://7743870392",
    Layers = "rbxassetid://7743868936",
    Command = "rbxassetid://7733924046",
    Star = "rbxassetid://7734068321",
    Bell = "rbxassetid://7733911828",
    Folder = "rbxassetid://7733799185",
    Terminal = "rbxassetid://7743872929",
    Activity = "rbxassetid://7733655755",
    Target = "rbxassetid://7743872758",
    Anchor = "rbxassetid://7733911490",
    Compass = "rbxassetid://7733924216",
    Cpu = "rbxassetid://7733765045",
    Globe = "rbxassetid://7733954760",
    Hash = "rbxassetid://7733955906",
    Key = "rbxassetid://7733965118",
    Lock = "rbxassetid://7733992528",
    Unlock = "rbxassetid://7743875263",
    Move = "rbxassetid://7743870731",
    Power = "rbxassetid://7734042493",
    RefreshCw = "rbxassetid://7734051052",
    Trash = "rbxassetid://7743873871",
    Trash2 = "rbxassetid://7743873772",
    Wifi = "rbxassetid://7743878148",
    Wrench = "rbxassetid://7743878358",
    Check = "rbxassetid://7733715400",
    AlertCircle = "rbxassetid://7733911490",
    Info = "rbxassetid://7733960981",
    AlertTriangle = "rbxassetid://7733911490",
    ["bot"] = "rbxassetid://7733924046",
    ["fish"] = "rbxassetid://7733954760",
    ["droplets"] = "rbxassetid://7733924216",
    ["map-pin"] = "rbxassetid://7743872758",
    ["shopping-cart"] = "rbxassetid://7733799185",
    ["calendar"] = "rbxassetid://7733911828",
    ["settings"] = "rbxassetid://7734053495",
    ["repeat"] = "rbxassetid://7734051052",
    ["scroll"] = "rbxassetid://7743874740",
    ["check"] = "rbxassetid://7733715400",
    ["alert-triangle"] = "rbxassetid://7733911490",
    ["x"] = "rbxassetid://7743878857",
    ["refresh-cw"] = "rbxassetid://7734051052",
    ["user-x"] = "rbxassetid://7743875962",
    ["bar-chart-2"] = "rbxassetid://7734058803",
    ["smile"] = "rbxassetid://7743875962",
    ["sword"] = "rbxassetid://7743872758",
    ["gem"] = "rbxassetid://7734068321",
    ["sparkles"] = "rbxassetid://7734068321",
    ["egg"] = "rbxassetid://7733911828",
    ["heart"] = "rbxassetid://7734068321",
    ["cloud"] = "rbxassetid://7733954760",
    ["flame"] = "rbxassetid://7733911490",
    ["leaf"] = "rbxassetid://7733924216",
    ["candy"] = "rbxassetid://7733911828",
    ["rainbow"] = "rbxassetid://7734068321",
    ["code"] = "rbxassetid://7743872929",
    ["wand"] = "rbxassetid://7733965118",
    ["dna"] = "rbxassetid://7733765045",
    ["clover"] = "rbxassetid://7733924216",
    ["coins"] = "rbxassetid://7733954760",
    ["skull"] = "rbxassetid://7733911490",
    ["zap"] = "rbxassetid://7733765045",
    ["telescope"] = "rbxassetid://7733924216",
    ["cloud-lightning"] = "rbxassetid://7733911490",
    ["trending-up"] = "rbxassetid://7734058803",
    ["lock"] = "rbxassetid://7733992528",
    ["bug"] = "rbxassetid://7733924046",
    ["waves"] = "rbxassetid://7733954760",
    ["camera"] = "rbxassetid://7733774602",
    ["box"] = "rbxassetid://7733799185",
    ["layers"] = "rbxassetid://7743868936",
    ["clock"] = "rbxassetid://7733911828",
    ["rotate-ccw"] = "rbxassetid://7734051052",
    ["moon"] = "rbxassetid://7743870134",
    ["sun"] = "rbxassetid://7734068495",
    ["thumbs-up"] = "rbxassetid://7733715400",
    ["info"] = "rbxassetid://7733960981",
    ["user"] = "rbxassetid://7743875962",
    ["star"] = "rbxassetid://7734068321",
    ["target"] = "rbxassetid://7743872758",
    ["anchor"] = "rbxassetid://7733911490",
    ["shield"] = "rbxassetid://7734056608",
    ["cpu"] = "rbxassetid://7733765045",
    ["hash"] = "rbxassetid://7733955906",
    ["key"] = "rbxassetid://7733965118",
    ["move"] = "rbxassetid://7743870731",
    ["trash"] = "rbxassetid://7743873871",
    ["wifi"] = "rbxassetid://7743878148",
    ["wrench"] = "rbxassetid://7743878358",
    ["alert-circle"] = "rbxassetid://7733911490",
    ["shrub"] = "rbxassetid://7733924216",
    ["droplet"] = "rbxassetid://7733924216",
    ["plus"] = "rbxassetid://7734042493",
    ["eye"] = "rbxassetid://7733774602",
    ["eye-off"] = "rbxassetid://7733774495",
    ["shield-check"] = "rbxassetid://7734056411",
    ["toggle-left"] = "rbxassetid://7734091286",
    ["toggle-right"] = "rbxassetid://7743873539",
    ["mouse-pointer"] = "rbxassetid://7743870392",
    ["globe"] = "rbxassetid://7733954760",
    ["compass"] = "rbxassetid://7733924216",
    ["activity"] = "rbxassetid://7733655755",
    ["command"] = "rbxassetid://7733924046",
    ["terminal"] = "rbxassetid://7743872929",
    ["folder"] = "rbxassetid://7733799185",
    ["bell"] = "rbxassetid://7733911828",
    ["trash-2"] = "rbxassetid://7743873772",
    ["unlock"] = "rbxassetid://7743875263",
    ["minimize-2"] = "rbxassetid://7733997870",
    ["maximize-2"] = "rbxassetid://7733992901",
    ["chevron-left"] = "rbxassetid://7733717651",
    ["chevron-right"] = "rbxassetid://7733717755",
    ["chevron-up"] = "rbxassetid://7733919605",
    ["chevron-down"] = "rbxassetid://7733717447",
    ["search"] = "rbxassetid://7734052925",
    ["minus"] = "rbxassetid://7734000129",
    ["power"] = "rbxassetid://7734042493",
    ["atom"] = "rbxassetid://7733765045",
    ["refreshCw"] = "rbxassetid://7734051052",
    ["alertTriangle"] = "rbxassetid://7733911490",
    ["alertCircle"] = "rbxassetid://7733911490",
    ["barChart2"] = "rbxassetid://7734058803",
    ["userX"] = "rbxassetid://7743875962",
    ["mapPin"] = "rbxassetid://7743872758",
    ["shoppingCart"] = "rbxassetid://7733799185",
    ["rotateCcw"] = "rbxassetid://7734051052",
    ["cloudLightning"] = "rbxassetid://7733911490",
    ["trendingUp"] = "rbxassetid://7734058803",
}

local function Create(className, properties)
    local instance = Instance.new(className)
    for prop, value in pairs(properties or {}) do
        instance[prop] = value
    end
    return instance
end

local function Tween(instance, properties, duration, easingStyle, easingDirection)
    if not instance or not instance.Parent then return end
    local tween = TweenService:Create(instance, TweenInfo.new(
        duration or 0.25,
        easingStyle or Enum.EasingStyle.Quart,
        easingDirection or Enum.EasingDirection.Out
    ), properties)
    tween:Play()
    return tween
end

local function Round(number, precision)
    precision = precision or 2
    return math.round(number * 10^precision) / 10^precision
end

local function GetIcon(name)
    if not name then return Icons.Info end
    if Icons[name] then return Icons[name] end
    if type(name) == "string" and (name:sub(1, 13) == "rbxassetid://" or name:sub(1, 4) == "http") then
        return name
    end
    return Icons.Info
end

local function NormalizeOption(opt)
    if type(opt) == "table" then
        return opt.Title or opt.title or tostring(opt), opt.Icon or opt.icon
    end
    return tostring(opt), nil
end

local CurrentTheme = Config.Themes[Config.DefaultTheme]
local ThemeListeners = {}
local OpenDropdowns = {}
local DropdownConnections = {}

local function ApplyTheme(themeName)
    if not Config.Themes[themeName] then return end
    CurrentTheme = Config.Themes[themeName]
    for _, callback in ipairs(ThemeListeners) do
        callback(CurrentTheme)
    end
end

local function ListenTheme(callback)
    table.insert(ThemeListeners, callback)
    callback(CurrentTheme)
end

local function CloseAllDropdowns()
    for _, data in ipairs(OpenDropdowns) do
        if data and data.Menu and data.Menu.Parent then
            data.Menu.Visible = false
            data.Menu.Size = UDim2.new(0, data.Menu.Size.X.Offset, 0, 0)
            if data.Arrow then
                data.Arrow.Rotation = 0
            end
            data.IsOpen = false
            if data.HeartbeatConn then
                pcall(function() data.HeartbeatConn:Disconnect() end)
                data.HeartbeatConn = nil
            end
        end
    end
end

local function RegisterDropdown(menu, arrow, btnRef)
    local data = {Menu = menu, Arrow = arrow, Button = btnRef, IsOpen = false, HeartbeatConn = nil}
    table.insert(OpenDropdowns, data)
    return data
end

-- Config Manager
local ConfigManager = {}
ConfigManager.__index = ConfigManager

function ConfigManager.new(windowName)
    local self = setmetatable({}, ConfigManager)
    self.WindowName = windowName or "Quantum"
    self.Data = {}
    self.Path = self.WindowName .. "_QuantumConfig.json"
    self.AutoSave = false
    self.AutoSaveInterval = 3
    self.Thread = nil
    self.Elements = {}
    return self
end

function ConfigManager:Load()
    if typeof(readfile) == "function" then
        local ok, content = pcall(readfile, self.Path)
        if ok and content and content ~= "" then
            local ok2, data = pcall(function()
                return HttpService:JSONDecode(content)
            end)
            if ok2 and type(data) == "table" then
                self.Data = data
                return true
            end
        end
    end
    return false
end

function ConfigManager:Save()
    if typeof(writefile) == "function" then
        local ok, content = pcall(function()
            return HttpService:JSONEncode(self.Data)
        end)
        if ok then
            pcall(writefile, self.Path, content)
        end
    end
end

function ConfigManager:StartAutoSave()
    if self.AutoSave then return end
    self.AutoSave = true
    self.Thread = task.spawn(function()
        while self.AutoSave do
            task.wait(self.AutoSaveInterval)
            self:Save()
        end
    end)
end

function ConfigManager:StopAutoSave()
    self.AutoSave = false
    if self.Thread then
        pcall(function() task.cancel(self.Thread) end)
        self.Thread = nil
    end
end

function ConfigManager:Set(key, value)
    self.Data[key] = value
end

function ConfigManager:Get(key, defaultValue)
    if self.Data[key] ~= nil then
        return self.Data[key]
    end
    return defaultValue
end

function ConfigManager:BindElement(key, elementType, getValueFunc, setValueFunc)
    self.Elements[key] = {
        Type = elementType,
        Get = getValueFunc,
        Set = setValueFunc
    }
    local saved = self:Get(key)
    if saved ~= nil and setValueFunc then
        pcall(function() setValueFunc(saved) end)
    end
end

-- Notify System (Instant, no animation)
local NotifyScreen = nil
local NotifyLayout = nil
local ActiveNotifications = {}

local function InitNotify()
    if NotifyScreen then return end
    NotifyScreen = Create("ScreenGui", {
        Name = "QuantumNotify",
        Parent = game.CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
    })
    NotifyLayout = Create("Frame", {
        Parent = NotifyScreen,
        Size = UDim2.new(0, 260, 1, -20),
        Position = UDim2.new(1, -270, 0, 10),
        BackgroundTransparency = 1,
        ZIndex = 200,
    })
    Create("UIListLayout", {
        Parent = NotifyLayout,
        Padding = UDim.new(0, 6),
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
end

function Quantum:Notify(data)
    data = data or {}
    local title = data.Title or "Notification"
    local content = data.Content or ""
    local duration = data.Duration or 3
    local icon = data.Icon or "Info"
    local iconId = GetIcon(icon)

    InitNotify()

    local notifFrame = Create("Frame", {
        Parent = NotifyLayout,
        Size = UDim2.new(0, 240, 0, 0),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        LayoutOrder = #ActiveNotifications,
        ZIndex = 201,
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 8), Parent = notifFrame})
    local IconImg = Create("ImageLabel", {
        Parent = notifFrame,
        Size = UDim2.new(0, 18, 0, 18),
        Position = UDim2.new(0, 6, 0, 6),
        BackgroundTransparency = 1,
        Image = iconId,
        ImageColor3 = CurrentTheme.Accent,
        ZIndex = 202,
    })

    local TitleLbl = Create("TextLabel", {
        Parent = notifFrame,
        Size = UDim2.new(1, -28, 0, 16),
        Position = UDim2.new(0, 28, 0, 6),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = CurrentTheme.Text,
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 202,
    })

    local ContentLbl = Create("TextLabel", {
        Parent = notifFrame,
        Size = UDim2.new(1, -28, 0, 0),
        Position = UDim2.new(0, 28, 0, 22),
        BackgroundTransparency = 1,
        Text = content,
        TextColor3 = CurrentTheme.SubText,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        AutomaticSize = Enum.AutomaticSize.Y,
        ZIndex = 202,
    })

    table.insert(ActiveNotifications, notifFrame)

    task.wait()
    local contentHeight = math.max(38, 18 + ContentLbl.AbsoluteSize.Y + 6)
    notifFrame.Size = UDim2.new(0, 240, 0, contentHeight)

    task.delay(duration, function()
        notifFrame.Size = UDim2.new(0, 0, 0, contentHeight)
        task.wait(0.1)
        notifFrame:Destroy()
        for i, n in ipairs(ActiveNotifications) do
            if n == notifFrame then
                table.remove(ActiveNotifications, i)
                break
            end
        end
    end)
end

local FloatingIconScreen = nil
local FloatingIconBtn = nil
local FloatingConnections = {}
local MainWindowScreen = nil
local MainFrame = nil
local IsMinimized = false
local IsClosed = false

local function CreateFloatingIcon(customIcon)
    for _, conn in ipairs(FloatingConnections) do
        if conn then conn:Disconnect() end
    end
    FloatingConnections = {}

    if FloatingIconScreen then
        FloatingIconScreen:Destroy()
    end

    local iconToUse = customIcon or Icons.Custom

    FloatingIconScreen = Create("ScreenGui", {
        Name = "QuantumFloatingIcon",
        Parent = game.CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
        Enabled = true
    })

    -- Backdrop: dark rounded background, slightly bigger than the icon
    local Backdrop = Create("Frame", {
        Name = "Backdrop",
        Parent = FloatingIconScreen,
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 14, 0.5, -20),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Active = true,
        ClipsDescendants = true,
        ZIndex = 1000
    })

    Create("UICorner", {
        CornerRadius = UDim.new(0, 12),
        Parent = Backdrop
    })

    Create("UIStroke", {
        Color = Color3.fromRGB(0, 0, 0),
        Thickness = 1,
        Transparency = 0.4,
        Parent = Backdrop
    })

    local isCustomImage = customIcon ~= nil
    local Icon = Create("ImageLabel", {
        Name = "Icon",
        Parent = Backdrop,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, 22, 0, 22),
        BackgroundTransparency = 1,
        Image = iconToUse,
        ImageColor3 = isCustomImage and Color3.fromRGB(255, 255, 255) or CurrentTheme.Text,
        ScaleType = Enum.ScaleType.Fit,
        ZIndex = 1001
    })

    local mouseDownOnIcon = false
    local isDragging = false
    local dragStart = nil
    local startPos = nil
    local hasMoved = false
    local dragThreshold = 5

    local conn1 = Backdrop.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            mouseDownOnIcon = true
            isDragging = true
            hasMoved = false
            dragStart = input.Position
            startPos = Backdrop.Position
        end
    end)

    local conn2 = UserInputService.InputChanged:Connect(function(input)
        if isDragging and mouseDownOnIcon and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            if math.abs(delta.X) > dragThreshold or math.abs(delta.Y) > dragThreshold then
                hasMoved = true
            end
            if Backdrop and Backdrop.Parent then
                Backdrop.Position = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + delta.X,
                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                )
            end
        end
    end)

    local conn3 = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if mouseDownOnIcon and not hasMoved then
                CloseAllDropdowns()
                if IsClosed then
                    IsClosed = false
                    if MainWindowScreen then
                        MainWindowScreen.Enabled = true
                    end
                    if MainFrame then
                        MainFrame.Visible = true
                        MainFrame.Size = UDim2.new(0, 400, 0, 260)
                        MainFrame.Position = UDim2.new(0.5, -200, 0.5, -130)
                    end
                elseif IsMinimized then
                    IsMinimized = false
                    if MainFrame then
                        MainFrame.Visible = true
                    end
                else
                    IsMinimized = true
                    if MainFrame then
                        MainFrame.Visible = false
                    end
                end
            end
            mouseDownOnIcon = false
            isDragging = false
        end
    end)

    table.insert(FloatingConnections, conn1)
    table.insert(FloatingConnections, conn2)
    table.insert(FloatingConnections, conn3)

    ListenTheme(function(theme)
        if Backdrop and Backdrop.Parent then
            Backdrop.BackgroundColor3 = theme.Sidebar
            Backdrop.UIStroke.Color = theme.Border
            if not isCustomImage then
                Icon.ImageColor3 = theme.Text
            end
        end
    end)

    FloatingIconBtn = Backdrop
    return FloatingIconScreen
end

function Quantum:CreateWindow(data)
    data = data or {}
    local windowName = data.Name or "Quantum"
    local windowIcon = data.Icon or "atom"
    local floatingIcon = data.FloatingIcon or nil
    local customVersion = data.Version or Config.DefaultVersion
    local toggleKey = data.ToggleKey

    if MainWindowScreen then
        MainWindowScreen:Destroy()
    end

    CreateFloatingIcon(floatingIcon)

    MainWindowScreen = Create("ScreenGui", {
        Name = "QuantumUI",
        Parent = game.CoreGui,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        ResetOnSpawn = false,
        Enabled = true
    })

    MainFrame = Create("Frame", {
        Name = "Main",
        Parent = MainWindowScreen,
        Size = UDim2.new(0, 420, 0, 260),
        Position = UDim2.new(0.5, -210, 0.5, -130),
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Active = true,
        ZIndex = 10
    })

    Create("UICorner", {
        CornerRadius = UDim.new(0, Config.CornerRadius),
        Parent = MainFrame
    })

    local Shadow = Create("ImageLabel", {
        Name = "Shadow",
        Parent = MainFrame,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 50, 1, 50),
        BackgroundTransparency = 1,
        Image = "rbxassetid://10806158995",
        ImageColor3 = CurrentTheme.Shadow,
        ImageTransparency = 0.5,
        ZIndex = 0
    })

    local Topbar = Create("Frame", {
        Name = "Topbar",
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 0, Config.TopbarHeight),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        Active = true,
        ZIndex = 20
    })

    Create("UICorner", {
        CornerRadius = UDim.new(0, Config.CornerRadius),
        Parent = Topbar
    })

    local TopbarFix = Create("Frame", {
        Name = "Fix",
        Parent = Topbar,
        Size = UDim2.new(1, 0, 0.5, 0),
        Position = UDim2.new(0, 0, 0.5, 0),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        ZIndex = 20
    })

    local TitleIcon = Create("ImageLabel", {
        Name = "TitleIcon",
        Parent = Topbar,
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(0, 10, 0, 8),
        BackgroundTransparency = 1,
        Image = GetIcon("atom"),
        ImageColor3 = CurrentTheme.Accent,
        ScaleType = Enum.ScaleType.Fit,
        ZIndex = 21
    })

    local Title = Create("TextLabel", {
        Name = "Title",
        Parent = Topbar,
        Size = UDim2.new(0, 160, 0, 18),
        Position = UDim2.new(0, 32, 0, 6),
        BackgroundTransparency = 1,
        Text = windowName,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextStrokeTransparency = 0.6,
        TextStrokeColor3 = CurrentTheme.Accent,
        ZIndex = 21
    })

    local TitleGlowTween = TweenService:Create(Title, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        TextStrokeTransparency = 0.25
    })
    TitleGlowTween:Play()

    local Version = Create("TextLabel", {
        Name = "Version",
        Parent = Topbar,
        Size = UDim2.new(0, 160, 0, 12),
        Position = UDim2.new(0, 30, 0, 22),
        BackgroundTransparency = 1,
        Text = "v" .. customVersion,
        TextColor3 = CurrentTheme.SubText,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 21
    })

    local ProfileSection = Create("Frame", {
        Name = "ProfileSection",
        Parent = Topbar,
        Size = UDim2.new(0, 110, 0, 30),
        Position = UDim2.new(1, -180, 0.5, -11),
        BackgroundTransparency = 1,
        ZIndex = 21
    })

    local ProfileFrame = Create("Frame", {
        Name = "ProfileFrame",
        Parent = ProfileSection,
        Size = UDim2.new(0, 28, 0, 28),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = CurrentTheme.Element,
        BorderSizePixel = 0,
        ZIndex = 22
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = ProfileFrame})
    Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = ProfileFrame})

    local ProfileImg = Create("ImageLabel", {
        Parent = ProfileFrame,
        Size = UDim2.new(1, -4, 1, -4),
        Position = UDim2.new(0, 2, 0, 2),
        BackgroundTransparency = 1,
        Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=48&h=48",
        ZIndex = 23
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = ProfileImg})

    local ProfileName = Create("TextLabel", {
        Name = "ProfileName",
        Parent = ProfileSection,
        Size = UDim2.new(0, 80, 0, 14),
        Position = UDim2.new(0, 28, 0, 0),
        BackgroundTransparency = 1,
        Text = LocalPlayer.DisplayName or LocalPlayer.Name,
        TextColor3 = CurrentTheme.Text,
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 22
    })

    local ProfileUser = Create("TextLabel", {
        Name = "ProfileUser",
        Parent = ProfileSection,
        Size = UDim2.new(0, 80, 0, 12),
        Position = UDim2.new(0, 28, 0, 12),
        BackgroundTransparency = 1,
        Text = "@" .. LocalPlayer.Name,
        TextColor3 = CurrentTheme.SubText,
        TextSize = 9,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 22
    })

    local ConfirmOverlay = Create("Frame", {
        Name = "ConfirmOverlay",
        Parent = MainFrame,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = CurrentTheme.Overlay,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 100
    })
    Create("UICorner", {CornerRadius = UDim.new(0, Config.CornerRadius), Parent = ConfirmOverlay})

    local ConfirmBox = Create("Frame", {
        Name = "ConfirmBox",
        Parent = ConfirmOverlay,
        Size = UDim2.new(0, 220, 0, 110),
        Position = UDim2.new(0.5, -100, 0.5, -45),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ZIndex = 101
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 6), Parent = ConfirmBox})

    Create("TextLabel", {
        Parent = ConfirmBox,
        Size = UDim2.new(1, 0, 0, 34),
        Position = UDim2.new(0, 0, 0, 8),
        BackgroundTransparency = 1,
        Text = "Close Quantum?",
        TextColor3 = CurrentTheme.Text,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        ZIndex = 102
    })

    Create("TextLabel", {
        Parent = ConfirmBox,
        Size = UDim2.new(1, -20, 0, 28),
        Position = UDim2.new(0, 10, 0, 26),
        BackgroundTransparency = 1,
        Text = "You can reopen using the floating icon.",
        TextColor3 = CurrentTheme.SubText,
        TextSize = 9,
        Font = Enum.Font.Gotham,
        TextWrapped = true,
        ZIndex = 102
    })

    local ConfirmYes = Create("TextButton", {
        Parent = ConfirmBox,
        Size = UDim2.new(0, 76, 0, 26),
        Position = UDim2.new(0.5, 4, 1, -28),
        BackgroundColor3 = Color3.fromRGB(220, 60, 60),
        Text = "Close",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        ZIndex = 102
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = ConfirmYes})

    local ConfirmNo = Create("TextButton", {
        Parent = ConfirmBox,
        Size = UDim2.new(0, 76, 0, 26),
        Position = UDim2.new(0.5, -74, 1, -28),
        BackgroundColor3 = CurrentTheme.Element,
        Text = "Cancel",
        TextColor3 = CurrentTheme.Text,
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        ZIndex = 102
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = ConfirmNo})

    local Controls = Create("Frame", {
        Name = "Controls",
        Parent = Topbar,
        Size = UDim2.new(0, 84, 0, Config.TopbarHeight),
        Position = UDim2.new(1, -86, 0, 0),
        BackgroundTransparency = 1,
        ZIndex = 21
    })

    local function MakeControl(name, icon, pos, callback)
        local btn = Create("ImageButton", {
            Name = name,
            Parent = Controls,
            Size = UDim2.new(0, 22, 0, 22),
            Position = pos,
            BackgroundColor3 = CurrentTheme.Element,
            AutoButtonColor = false,
            Image = GetIcon(icon),
            ImageColor3 = CurrentTheme.SubText,
            ZIndex = 22
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = btn})
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = CurrentTheme.ElementHover
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = CurrentTheme.Element
        end)
        btn.MouseButton1Click:Connect(callback)
        return btn
    end

    MakeControl("Minimize", "Minus", UDim2.new(0, 0, 0.5, -11), function()
        CloseAllDropdowns()
        IsMinimized = true
        MainFrame.Visible = false
    end)

    local IsMaximized = false
    MakeControl("Resize", "Maximize2", UDim2.new(0, 25, 0.5, -11), function()
        IsMaximized = not IsMaximized
        if IsMaximized then
            MainFrame.Size = UDim2.new(0, 400, 0, 260)
        else
            MainFrame.Size = UDim2.new(0, 320, 0, 200)
        end
    end)

    MakeControl("Close", "X", UDim2.new(0, 50, 0.5, -11), function()
        CloseAllDropdowns()
        ConfirmOverlay.Visible = true
    end)

    ConfirmYes.MouseButton1Click:Connect(function()
        CloseAllDropdowns()
        IsClosed = true
        MainWindowScreen.Enabled = false
        ConfirmOverlay.Visible = false
    end)

    ConfirmNo.MouseButton1Click:Connect(function()
        ConfirmOverlay.Visible = false
    end)

    local Sidebar = Create("Frame", {
        Name = "Sidebar",
        Parent = MainFrame,
        Size = UDim2.new(0, Config.SidebarWidth, 1, -Config.TopbarHeight),
        Position = UDim2.new(0, 0, 0, Config.TopbarHeight),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 15
    })
    Create("UICorner", {CornerRadius = UDim.new(0, Config.CornerRadius), Parent = Sidebar})

    Create("Frame", {
        Name = "Fix",
        Parent = Sidebar,
        Size = UDim2.new(1, 0, 0, 10),
        Position = UDim2.new(0, 0, 0, -10),
        BackgroundColor3 = CurrentTheme.Sidebar,
        BorderSizePixel = 0,
        ZIndex = 15
    })

    -- Search Box in Sidebar
    local SearchFrame = Create("Frame", {
        Parent = Sidebar,
        Size = UDim2.new(1, -10, 0, 30),
        Position = UDim2.new(0, 5, 0, 6),
        BackgroundColor3 = CurrentTheme.Element,
        BorderSizePixel = 0,
        ZIndex = 16
    })
    Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = SearchFrame})

    local SearchIcon = Create("ImageLabel", {
        Parent = SearchFrame,
        Size = UDim2.new(0, 12, 0, 12),
        Position = UDim2.new(0, 6, 0.5, -6),
        BackgroundTransparency = 1,
        Image = GetIcon("Search"),
        ImageColor3 = CurrentTheme.SubText,
        ZIndex = 17
    })

    local SearchBox = Create("TextBox", {
        Parent = SearchFrame,
        Size = UDim2.new(1, -24, 1, 0),
        Position = UDim2.new(0, 20, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        PlaceholderText = "Search tabs...",
        TextColor3 = CurrentTheme.Text,
        PlaceholderColor3 = CurrentTheme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        ClearTextOnFocus = false,
        ZIndex = 17
    })

    local TabList = Create("ScrollingFrame", {
        Name = "TabList",
        Parent = Sidebar,
        Size = UDim2.new(1, -10, 1, -40),
        Position = UDim2.new(0, 5, 0, 42),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = CurrentTheme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ZIndex = 16
    })

    Create("UIListLayout", {
        Parent = TabList,
        Padding = UDim.new(0, 3),
        SortOrder = Enum.SortOrder.LayoutOrder
    })

    local Content = Create("Frame", {
        Name = "Content",
        Parent = MainFrame,
        Size = UDim2.new(1, -Config.SidebarWidth + 4, 1, -Config.TopbarHeight),
        Position = UDim2.new(0, Config.SidebarWidth - 4, 0, Config.TopbarHeight),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 14
    })
    Create("UICorner", {CornerRadius = UDim.new(0, Config.CornerRadius), Parent = Content})

    Create("Frame", {
        Name = "Fix",
        Parent = Content,
        Size = UDim2.new(0, 10, 0, 10),
        Position = UDim2.new(0, -10, 0, 0),
        BackgroundColor3 = CurrentTheme.Background,
        BorderSizePixel = 0,
        ZIndex = 14
    })

    local ResizeHandle = Create("ImageButton", {
        Name = "ResizeHandle",
        Parent = MainFrame,
        Size = UDim2.new(0, 20, 0, 20),
        Position = UDim2.new(1, -18, 1, -18),
        BackgroundTransparency = 1,
        Image = GetIcon("ChevronLeft"),
        ImageColor3 = CurrentTheme.SubText,
        ImageTransparency = 0.4,
        Rotation = -45,
        ZIndex = 30,
        Active = true
    })

    local resizing = false
    local resizeStart = nil
    local startSize = nil

    ResizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = true
            resizeStart = input.Position
            startSize = MainFrame.Size
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - resizeStart
            local newWidth = math.max(Config.MinWindowSize.X, startSize.X.Offset + delta.X)
            local newHeight = math.max(Config.MinWindowSize.Y, startSize.Y.Offset + delta.Y)
            MainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            resizing = false
        end
    end)

    local dragging = false
    local dragStart = nil
    local startPos = nil

    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            local changedConn
            changedConn = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.Cancel then
                    dragging = false
                    changedConn:Disconnect()
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    if toggleKey then
        UserInputService.InputBegan:Connect(function(input, gpe)
            if not gpe and input.KeyCode == toggleKey then
                if MainFrame then
                    if MainFrame.Visible then
                        CloseAllDropdowns()
                    end
                    MainFrame.Visible = not MainFrame.Visible
                    IsMinimized = not MainFrame.Visible
                end
            end
        end)
    end

    ListenTheme(function(theme)
        MainFrame.BackgroundColor3 = theme.Background
        Shadow.ImageColor3 = theme.Shadow
        Topbar.BackgroundColor3 = theme.Sidebar
        TopbarFix.BackgroundColor3 = theme.Sidebar
        Sidebar.BackgroundColor3 = theme.Sidebar
        Content.BackgroundColor3 = theme.Background
        Title.TextStrokeColor3 = theme.Accent
        TitleIcon.ImageColor3 = theme.Accent
        TabList.ScrollBarImageColor3 = theme.Accent
        ConfirmOverlay.BackgroundColor3 = theme.Overlay
        ConfirmBox.BackgroundColor3 = theme.Background
        ConfirmNo.BackgroundColor3 = theme.Element
        ConfirmNo.TextColor3 = theme.Text
        ResizeHandle.ImageColor3 = theme.SubText
        ProfileFrame.BackgroundColor3 = theme.Element
        ProfileFrame.UIStroke.Color = theme.Border
        ProfileName.TextColor3 = theme.Text
        ProfileUser.TextColor3 = theme.SubText
        SearchFrame.BackgroundColor3 = theme.Element
        SearchIcon.ImageColor3 = theme.SubText
        SearchBox.TextColor3 = theme.Text
        SearchBox.PlaceholderColor3 = theme.SubText
    end)

    local WindowAPI = {}
    WindowAPI.Notify = function(_, d) Quantum:Notify(d) end
    WindowAPI.SetTheme = function(_, name) ApplyTheme(name) end
    WindowAPI.Config = ConfigManager.new(windowName)
    WindowAPI.Config:Load()
    WindowAPI.Config:StartAutoSave()

    local Tabs = {}
    local ActiveTab = nil
    local TabButtons = {}

    function WindowAPI:CreateTab(tabData)
        tabData = tabData or {}
        local tabName = tabData.Name or "Tab"
        local tabIcon = tabData.Icon or "Settings"

        local TabBtn = Create("TextButton", {
            Parent = TabList,
            Size = UDim2.new(1, -6, 0, 34),
            BackgroundColor3 = CurrentTheme.Element,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = #Tabs + 1,
            ZIndex = 17
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = TabBtn})

        local TabBtnIcon = Create("ImageLabel", {
            Parent = TabBtn,
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(0, 8, 0.5, -7),
            BackgroundTransparency = 1,
            Image = GetIcon(tabIcon),
            ImageColor3 = CurrentTheme.SubText,
            ZIndex = 18
        })

        local TabBtnText = Create("TextLabel", {
            Parent = TabBtn,
            Size = UDim2.new(0, 100, 0, 26),
            Position = UDim2.new(0, 24, 0, 2),
            BackgroundTransparency = 1,
            Text = tabName,
            TextColor3 = CurrentTheme.SubText,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 18
        })

        local TabIndicator = Create("Frame", {
            Parent = TabBtn,
            Size = UDim2.new(0, 2, 0.5, 0),
            Position = UDim2.new(0, 0, 0.25, 0),
            BackgroundColor3 = CurrentTheme.Accent,
            BorderSizePixel = 0,
            Visible = false,
            ZIndex = 18
        })
        Create("UICorner", {CornerRadius = UDim.new(0, 2), Parent = TabIndicator})

        local TabContent = Create("ScrollingFrame", {
            Parent = Content,
            Size = UDim2.new(1, -14, 1, -14),
            Position = UDim2.new(0, 6, 0, 6),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = CurrentTheme.Accent,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
            ZIndex = 15
        })

        Create("UIListLayout", {
            Parent = TabContent,
            Padding = UDim.new(0, 5),
            SortOrder = Enum.SortOrder.LayoutOrder
        })

        local function Activate()
            CloseAllDropdowns()
            if ActiveTab then
                ActiveTab.Content.Visible = false
                ActiveTab.Indicator.Visible = false
                ActiveTab.Button.BackgroundColor3 = CurrentTheme.Element
                ActiveTab.Icon.ImageColor3 = CurrentTheme.SubText
                ActiveTab.Label.TextColor3 = CurrentTheme.SubText
            end

            ActiveTab = {
                Button = TabBtn,
                Content = TabContent,
                Icon = TabBtnIcon,
                Label = TabBtnText,
                Indicator = TabIndicator
            }

            TabContent.Visible = true
            TabIndicator.Visible = true
            TabBtn.BackgroundColor3 = CurrentTheme.ElementHover
            TabBtnIcon.ImageColor3 = CurrentTheme.Accent
            TabBtnText.TextColor3 = CurrentTheme.Text
        end

        TabBtn.MouseButton1Click:Connect(Activate)
        TabBtn.MouseEnter:Connect(function()
            if ActiveTab and ActiveTab.Button == TabBtn then return end
            TabBtn.BackgroundColor3 = CurrentTheme.ElementHover
        end)
        TabBtn.MouseLeave:Connect(function()
            if ActiveTab and ActiveTab.Button == TabBtn then return end
            TabBtn.BackgroundColor3 = CurrentTheme.Element
        end)

        table.insert(Tabs, {Activate = Activate, Name = tabName, Button = TabBtn})
        table.insert(TabButtons, {Btn = TabBtn, Name = tabName:lower()})
        if #Tabs == 1 then Activate() end

        ListenTheme(function(theme)
            if ActiveTab and ActiveTab.Button == TabBtn then
                TabBtn.BackgroundColor3 = theme.ElementHover
                TabBtnIcon.ImageColor3 = theme.Accent
                TabBtnText.TextColor3 = theme.Text
            else
                TabBtn.BackgroundColor3 = theme.Element
                TabBtnIcon.ImageColor3 = theme.SubText
                TabBtnText.TextColor3 = theme.SubText
            end
            TabIndicator.BackgroundColor3 = theme.Accent
            TabContent.ScrollBarImageColor3 = theme.Accent
        end)

        local TabAPI = {}
        TabAPI._CurrentSection = nil
        TabAPI._Sections = {}
        TabAPI._TabContent = TabContent

        function TabAPI:CreateSection(sectionData)
            sectionData = sectionData or {}
            local sectionName = sectionData.Name or "Section"
            local sectionIcon = sectionData.Icon or "Folder"
            local collapsed = sectionData.Collapsed or false
            local opened = sectionData.Opened
            if opened == nil then opened = not collapsed end
            if opened == false then collapsed = true end
            local isCollapsed = collapsed

            local SectionFrame = Create("Frame", {
                Parent = TabContent,
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundColor3 = CurrentTheme.Element,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                LayoutOrder = #TabContent:GetChildren(),
                ZIndex = 16
            })
            Create("UICorner", {CornerRadius = UDim.new(0, Config.ElementCorner), Parent = SectionFrame})

            local SectionHeader = Create("TextButton", {
                Parent = SectionFrame,
                Size = UDim2.new(1, 0, 0, 40),
                BackgroundColor3 = CurrentTheme.Element,
                Text = "",
                AutoButtonColor = false,
                ZIndex = 17
            })
            Create("UICorner", {CornerRadius = UDim.new(0, Config.ElementCorner), Parent = SectionHeader})

            Create("ImageLabel", {
                Parent = SectionHeader,
                Size = UDim2.new(0, 16, 0, 16),
                Position = UDim2.new(0, 10, 0.5, -8),
                BackgroundTransparency = 1,
                Image = GetIcon(sectionIcon),
                ImageColor3 = CurrentTheme.Accent,
                ZIndex = 18
            })

            Create("TextLabel", {
                Parent = SectionHeader,
                Size = UDim2.new(1, -60, 0, 20),
                Position = UDim2.new(0, 32, 0.5, -10),
                BackgroundTransparency = 1,
                Text = sectionName,
                TextColor3 = CurrentTheme.Text,
                TextSize = 11,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 18
            })

            local Arrow = Create("ImageLabel", {
                Parent = SectionHeader,
                Size = UDim2.new(0, 12, 0, 12),
                Position = UDim2.new(1, -28, 0.5, -6),
                BackgroundTransparency = 1,
                Image = GetIcon("ChevronDown"),
                ImageColor3 = CurrentTheme.SubText,
                ZIndex = 18
            })

            local SectionItems = Create("Frame", {
                Parent = SectionFrame,
                Size = UDim2.new(1, -12, 0, 0),
                Position = UDim2.new(0, 8, 0, 40),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Visible = not isCollapsed,
                ClipsDescendants = true,
                ZIndex = 17
            })

            Create("UIListLayout", {
                Parent = SectionItems,
                Padding = UDim.new(0, 3),
                SortOrder = Enum.SortOrder.LayoutOrder
            })

            local isCollapsed = collapsed
            local targetHeight = 36
            local sectionDropdowns = {}

            local function UpdateSize()
                local itemsHeight = SectionItems.UIListLayout.AbsoluteContentSize.Y
                targetHeight = 40 + itemsHeight + 6
                if isCollapsed then
                    SectionFrame.Size = UDim2.new(1, 0, 0, 40)
                    SectionItems.Visible = false
                    SectionItems.Size = UDim2.new(1, -12, 0, 0)
                    Arrow.Rotation = 0
                    for _, dd in ipairs(sectionDropdowns) do
                        if dd and dd.Menu and dd.Menu.Parent then
                            dd.Menu.Visible = false
                            dd.Menu.Size = UDim2.new(0, dd.Menu.Size.X.Offset, 0, 0)
                            if dd.Arrow then dd.Arrow.Rotation = 0 end
                            dd.IsOpen = false
                            if dd.HeartbeatConn then
                                pcall(function() dd.HeartbeatConn:Disconnect() end)
                                dd.HeartbeatConn = nil
                            end
                        end
                    end
                else
                    SectionFrame.Size = UDim2.new(1, 0, 0, targetHeight)
                    SectionItems.Visible = true
                    SectionItems.Size = UDim2.new(1, -12, 0, itemsHeight + 6)
                    Arrow.Rotation = 180
                end
                TabContent.CanvasSize = UDim2.new(0, 0, 0, TabContent.UIListLayout.AbsoluteContentSize.Y + 16)
            end

            SectionHeader.MouseButton1Click:Connect(function()
                isCollapsed = not isCollapsed
                UpdateSize()
            end)

            if not collapsed then
                Arrow.Rotation = 180
                task.wait(0.05)
                UpdateSize()
            end

            ListenTheme(function(theme)
                SectionFrame.BackgroundColor3 = theme.Element
                SectionHeader.BackgroundColor3 = theme.Element
                Arrow.ImageColor3 = theme.SubText
            end)

            SectionItems.ChildAdded:Connect(function()
                task.wait(0.1)
                if not isCollapsed then
                    UpdateSize()
                end
            end)

            local SectionAPI = {}
            SectionAPI._SectionItems = SectionItems
            SectionAPI._SectionDropdowns = sectionDropdowns
            SectionAPI._UpdateSize = UpdateSize

            function SectionAPI:CreateToggle(toggleData)
                toggleData = toggleData or {}
                local toggleName = toggleData.Name or "Toggle"
                local toggleIcon = toggleData.Icon or "ToggleLeft"
                local default = toggleData.Default or false
                local callback = toggleData.Callback or function() end
                local desc = toggleData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 30

                local ToggleFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = ToggleFrame})

                Create("ImageLabel", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 7),
                    BackgroundTransparency = 1,
                    Image = GetIcon(toggleIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(0, 140, 0, 12),
                    Position = UDim2.new(0, 20, 0, hasDesc and 1 or 4),
                    BackgroundTransparency = 1,
                    Text = toggleName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = ToggleFrame,
                        Size = UDim2.new(1, -60, 0, 10),
                        Position = UDim2.new(0, 20, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 9,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local ToggleBtn = Create("Frame", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(0, 48, 0, 26),
                    Position = UDim2.new(1, -56, 0.5, -13),
                    BackgroundColor3 = CurrentTheme.ToggleOff,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ToggleBtn})

                local ToggleCircle = Create("Frame", {
                    Parent = ToggleBtn,
                    Size = UDim2.new(0, 16, 0, 16),
                    Position = UDim2.new(0, 4, 0.5, -8),
                    BackgroundColor3 = CurrentTheme.Text,
                    BorderSizePixel = 0,
                    ZIndex = 20
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = ToggleCircle})

                local ToggleClick = Create("TextButton", {
                    Parent = ToggleFrame,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = "",
                    ZIndex = 25
                })

                local state = default
                if default then
                    ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOn
                    ToggleCircle.Position = UDim2.new(0, 24, 0.5, -7)
                end

                ToggleClick.MouseButton1Click:Connect(function()
                    state = not state
                    if state then
                        ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOn
                        ToggleCircle.Position = UDim2.new(0, 24, 0.5, -7)
                    else
                        ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOff
                        ToggleCircle.Position = UDim2.new(0, 3, 0.5, -7)
                    end
                    callback(state)
                end)

                ListenTheme(function(theme)
                    ToggleFrame.BackgroundColor3 = theme.Background
                    ToggleCircle.BackgroundColor3 = theme.Text
                    if state then
                        ToggleBtn.BackgroundColor3 = theme.ToggleOn
                    else
                        ToggleBtn.BackgroundColor3 = theme.ToggleOff
                    end
                end)

                local API = {
                    Set = function(val)
                        state = val
                        if state then
                            ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOn
                            ToggleCircle.Position = UDim2.new(0, 24, 0.5, -7)
                        else
                            ToggleBtn.BackgroundColor3 = CurrentTheme.ToggleOff
                            ToggleCircle.Position = UDim2.new(0, 3, 0.5, -7)
                        end
                        callback(state)
                    end,
                    Get = function() return state end
                }
                return API
            end

            function SectionAPI:CreateSlider(sliderData)
                sliderData = sliderData or {}
                local sliderName = sliderData.Name or "Slider"
                local sliderIcon = sliderData.Icon or "Sliders"
                local min = sliderData.Min or 0
                local max = sliderData.Max or 100
                local default = sliderData.Default or min
                local increment = sliderData.Increment or 1
                local callback = sliderData.Callback or function() end
                local desc = sliderData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 50 or 40

                local SliderFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = SliderFrame})

                Create("ImageLabel", {
                    Parent = SliderFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(sliderIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = SliderFrame,
                    Size = UDim2.new(0, 100, 0, 12),
                    Position = UDim2.new(0, 20, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = sliderName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = SliderFrame,
                        Size = UDim2.new(1, -14, 0, 10),
                        Position = UDim2.new(0, 20, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 9,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local ValueLabel = Create("TextLabel", {
                    Parent = SliderFrame,
                    Size = UDim2.new(0, 34, 0, 12),
                    Position = UDim2.new(1, -38, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = tostring(default),
                    TextColor3 = CurrentTheme.Accent,
                    TextSize = 9,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    ZIndex = 19
                })

                local Track = Create("Frame", {
                    Parent = SliderFrame,
                    Size = UDim2.new(1, -14, 0, 4),
                    Position = UDim2.new(0, 7, 0, hasDesc and 34 or 24),
                    BackgroundColor3 = CurrentTheme.Element,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Track})

                local Fill = Create("Frame", {
                    Parent = Track,
                    Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
                    BackgroundColor3 = CurrentTheme.Accent,
                    BorderSizePixel = 0,
                    ZIndex = 20
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Fill})

                local Knob = Create("Frame", {
                    Parent = Track,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new((default - min) / (max - min), -5, 0.5, -5),
                    BackgroundColor3 = CurrentTheme.Text,
                    BorderSizePixel = 0,
                    ZIndex = 21
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Knob})

                local draggingSlider = false

                local function UpdateSlider(input)
                    local pos = math.clamp((input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
                    local value = math.clamp(Round(min + (pos * (max - min)), math.log10(1/increment)), min, max)
                    value = math.floor(value / increment + 0.5) * increment
                    Fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                    Knob.Position = UDim2.new((value - min) / (max - min), -6, 0.5, -6)
                    ValueLabel.Text = tostring(value)
                    callback(value)
                end

                Knob.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingSlider = true
                    end
                end)

                Track.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingSlider = true
                        UpdateSlider(input)
                    end
                end)

                UserInputService.InputChanged:Connect(function(input)
                    if draggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        UpdateSlider(input)
                    end
                end)

                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        draggingSlider = false
                    end
                end)

                ListenTheme(function(theme)
                    SliderFrame.BackgroundColor3 = theme.Background
                    Track.BackgroundColor3 = theme.Element
                    Fill.BackgroundColor3 = theme.Accent
                    Knob.BackgroundColor3 = theme.Text
                    ValueLabel.TextColor3 = theme.Accent
                end)

                local API = {
                    Set = function(val)
                        val = math.clamp(val, min, max)
                        val = math.floor(val / increment + 0.5) * increment
                        Fill.Size = UDim2.new((val - min) / (max - min), 0, 1, 0)
                        Knob.Position = UDim2.new((val - min) / (max - min), -6, 0.5, -6)
                        ValueLabel.Text = tostring(val)
                        callback(val)
                    end,
                    Get = function() return tonumber(ValueLabel.Text) or default end
                }
                return API
            end

            function SectionAPI:CreateButton(buttonData)
                buttonData = buttonData or {}
                local buttonName = buttonData.Name or "Button"
                local buttonIcon = buttonData.Icon or "Command"
                local callback = buttonData.Callback or function() end
                local desc = buttonData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local Btn = Create("TextButton", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Accent,
                    Text = "",
                    AutoButtonColor = false,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = Btn})

                Create("ImageLabel", {
                    Parent = Btn,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(buttonIcon),
                    ImageColor3 = CurrentTheme.Text,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = Btn,
                    Size = UDim2.new(0, 140, 0, 12),
                    Position = UDim2.new(0, 20, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = buttonName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = Btn,
                        Size = UDim2.new(1, -26, 0, 10),
                        Position = UDim2.new(0, 20, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.Text,
                        TextTransparency = 0.3,
                        TextSize = 9,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                Btn.MouseEnter:Connect(function()
                    Btn.BackgroundColor3 = Color3.fromRGB(
                        math.clamp(CurrentTheme.Accent.R * 255 + 20, 0, 255),
                        math.clamp(CurrentTheme.Accent.G * 255 + 20, 0, 255),
                        math.clamp(CurrentTheme.Accent.B * 255 + 20, 0, 255)
                    )
                end)
                Btn.MouseLeave:Connect(function()
                    Btn.BackgroundColor3 = CurrentTheme.Accent
                end)
                Btn.MouseButton1Click:Connect(function()
                    callback()
                end)

                ListenTheme(function(theme)
                    Btn.BackgroundColor3 = theme.Accent
                end)

                return {Click = callback}
            end

            function SectionAPI:CreateDropdown(dropdownData)
                dropdownData = dropdownData or {}
                local dropdownName = dropdownData.Name or "Dropdown"
                local dropdownIcon = dropdownData.Icon or "ChevronDown"
                local options = dropdownData.Options or dropdownData.Values or {}
                local default = dropdownData.Default or ""
                local callback = dropdownData.Callback or function() end
                local desc = dropdownData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local DropdownFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = DropdownFrame})

                Create("ImageLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(dropdownIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 70, 0, 12),
                    Position = UDim2.new(0, 20, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = dropdownName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = DropdownFrame,
                        Size = UDim2.new(1, -120, 0, 10),
                        Position = UDim2.new(0, 20, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 9,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local DropdownBtn = Create("TextButton", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 85, 0, 22),
                    Position = UDim2.new(1, -92, 0, hasDesc and 8 or 3),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    TextColor3 = CurrentTheme.SubText,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = DropdownBtn})

                local Arrow = Create("ImageLabel", {
                    Parent = DropdownBtn,
                    Size = UDim2.new(0, 12, 0, 12),
                    Position = UDim2.new(1, -16, 0.5, -6),
                    BackgroundTransparency = 1,
                    Image = GetIcon("ChevronDown"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 20
                })

                local defaultText, _ = NormalizeOption(default)
                if defaultText ~= "" then
                    DropdownBtn.Text = defaultText
                    DropdownBtn.TextColor3 = CurrentTheme.Text
                else
                    DropdownBtn.Text = "Select option"
                    DropdownBtn.TextColor3 = CurrentTheme.SubText
                end

                local MenuFrame = Create("Frame", {
                    Parent = MainWindowScreen,
                    Size = UDim2.new(0, 85, 0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    ClipsDescendants = true,
                    Visible = false,
                    ZIndex = 500
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = MenuFrame})
                Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = MenuFrame})

                local ddData = RegisterDropdown(MenuFrame, Arrow, DropdownBtn)
                table.insert(sectionDropdowns, ddData)

                local SearchBox = Create("TextBox", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -8, 0, 24),
                    Position = UDim2.new(0, 4, 0, 4),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    PlaceholderText = "Search...",
                    TextColor3 = CurrentTheme.Text,
                    PlaceholderColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = SearchBox})

                Create("ImageLabel", {
                    Parent = SearchBox,
                    Size = UDim2.new(0, 12, 0, 12),
                    Position = UDim2.new(1, -16, 0.5, -6),
                    BackgroundTransparency = 1,
                    Image = GetIcon("Search"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 32
                })

                local OptionsScroll = Create("ScrollingFrame", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -8, 0, 0),
                    Position = UDim2.new(0, 4, 0, 26),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScrollBarThickness = 2,
                    ScrollBarImageColor3 = CurrentTheme.Accent,
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ZIndex = 31
                })

                Create("UIListLayout", {
                    Parent = OptionsScroll,
                    Padding = UDim.new(0, 2)
                })

                local selected = default
                local optionButtons = {}

                local function BuildOptions(filterText)
                    for _, btn in ipairs(optionButtons) do
                        if btn then btn:Destroy() end
                    end
                    optionButtons = {}

                    local count = 0
                    for _, opt in ipairs(options) do
                        local optText, optIcon = NormalizeOption(opt)
                        if not filterText or filterText == "" or string.find(string.lower(optText), string.lower(filterText), 1, true) then
                            local optBtn = Create("TextButton", {
                                Parent = OptionsScroll,
                                Size = UDim2.new(1, 0, 0, 34),
                                BackgroundColor3 = CurrentTheme.Element,
                                Text = "",
                                TextColor3 = CurrentTheme.Text,
                                TextSize = 9,
                                Font = Enum.Font.Gotham,
                                ZIndex = 32
                            })
                            Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = optBtn})

                            if optIcon then
                                Create("ImageLabel", {
                                    Parent = optBtn,
                                    Size = UDim2.new(0, 10, 0, 10),
                                    Position = UDim2.new(0, 5, 0.5, -5),
                                    BackgroundTransparency = 1,
                                    Image = GetIcon(optIcon),
                                    ImageColor3 = CurrentTheme.SubText,
                                    ZIndex = 33,
                                })
                                local txt = Create("TextLabel", {
                                    Parent = optBtn,
                                    Size = UDim2.new(1, -20, 1, 0),
                                    Position = UDim2.new(0, 18, 0, 0),
                                    BackgroundTransparency = 1,
                                    Text = optText,
                                    TextColor3 = CurrentTheme.Text,
                                    TextSize = 11,
                                    Font = Enum.Font.Gotham,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    ZIndex = 33,
                                })
                            else
                                optBtn.Text = optText
                            end

                            optBtn.MouseButton1Click:Connect(function()
                                selected = opt
                                local selText, _ = NormalizeOption(selected)
                                DropdownBtn.Text = selText
                                DropdownBtn.TextColor3 = CurrentTheme.Text
                                callback(selected)
                                ddData.IsOpen = false
                                MenuFrame.Visible = false
                                MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                                Arrow.Rotation = 0
                                if ddData.HeartbeatConn then
                                    pcall(function() ddData.HeartbeatConn:Disconnect() end)
                                    ddData.HeartbeatConn = nil
                                end
                            end)

                            optBtn.MouseEnter:Connect(function()
                                optBtn.BackgroundColor3 = CurrentTheme.Accent
                            end)
                            optBtn.MouseLeave:Connect(function()
                                optBtn.BackgroundColor3 = CurrentTheme.Element
                            end)

                            table.insert(optionButtons, optBtn)
                            count = count + 1
                        end
                    end

                    local listHeight = math.min(count * 24 + 4, 120)
                    OptionsScroll.Size = UDim2.new(1, -10, 0, listHeight)
                    OptionsScroll.CanvasSize = UDim2.new(0, 0, 0, count * 24 + 4)
                end

                BuildOptions("")

                SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
                    BuildOptions(SearchBox.Text)
                end)

                local function UpdateMenuPosition()
                    if not DropdownBtn or not DropdownBtn.Parent then return end
                    local btnPos = DropdownBtn.AbsolutePosition
                    local btnSize = DropdownBtn.AbsoluteSize
                    MenuFrame.Position = UDim2.new(0, btnPos.X, 0, btnPos.Y + btnSize.Y + 3)
                    MenuFrame.Size = UDim2.new(0, btnSize.X, 0, MenuFrame.Size.Y.Offset)
                end

                DropdownBtn.MouseButton1Click:Connect(function()
                    if ddData.IsOpen then
                        ddData.IsOpen = false
                        MenuFrame.Visible = false
                        MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                        Arrow.Rotation = 0
                        if ddData.HeartbeatConn then
                            pcall(function() ddData.HeartbeatConn:Disconnect() end)
                            ddData.HeartbeatConn = nil
                        end
                    else
                        CloseAllDropdowns()
                        ddData.IsOpen = true
                        UpdateMenuPosition()
                        MenuFrame.Visible = true
                        local menuHeight = math.min(#options * 24 + 32, 180)
                        MenuFrame.Size = UDim2.new(0, DropdownBtn.AbsoluteSize.X, 0, menuHeight)
                        Arrow.Rotation = 180
                        SearchBox.Text = ""
                        BuildOptions("")
                        -- Start heartbeat to track button position while scrolling
                        ddData.HeartbeatConn = RunService.Heartbeat:Connect(function()
                            if ddData.IsOpen and DropdownBtn and DropdownBtn.Parent then
                                UpdateMenuPosition()
                            else
                                if ddData.HeartbeatConn then
                                    pcall(function() ddData.HeartbeatConn:Disconnect() end)
                                    ddData.HeartbeatConn = nil
                                end
                            end
                        end)
                    end
                end)

                -- Close dropdown when scrolling the content area
                TabContent:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                    if ddData.IsOpen then
                        ddData.IsOpen = false
                        MenuFrame.Visible = false
                        MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                        Arrow.Rotation = 0
                        if ddData.HeartbeatConn then
                            pcall(function() ddData.HeartbeatConn:Disconnect() end)
                            ddData.HeartbeatConn = nil
                        end
                    end
                end)

                local clickConn = UserInputService.InputBegan:Connect(function(input, gpe)
                    if not gpe and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                        if ddData.IsOpen then
                            local mousePos = UserInputService:GetMouseLocation()
                            local menuPos = MenuFrame.AbsolutePosition
                            local menuSize = MenuFrame.AbsoluteSize
                            if mousePos.X < menuPos.X or mousePos.X > menuPos.X + menuSize.X or
                               mousePos.Y < menuPos.Y or mousePos.Y > menuPos.Y + menuSize.Y then
                                local btnPos = DropdownBtn.AbsolutePosition
                                local btnSize = DropdownBtn.AbsoluteSize
                                if mousePos.X < btnPos.X or mousePos.X > btnPos.X + btnSize.X or
                                   mousePos.Y < btnPos.Y or mousePos.Y > btnPos.Y + btnSize.Y then
                                    ddData.IsOpen = false
                                    MenuFrame.Visible = false
                                    MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                                    Arrow.Rotation = 0
                                    if ddData.HeartbeatConn then
                                        pcall(function() ddData.HeartbeatConn:Disconnect() end)
                                        ddData.HeartbeatConn = nil
                                    end
                                end
                            end
                        end
                    end
                end)
                table.insert(DropdownConnections, clickConn)

                ListenTheme(function(theme)
                    DropdownFrame.BackgroundColor3 = theme.Background
                    DropdownBtn.BackgroundColor3 = theme.Element
                    local selText, _ = NormalizeOption(selected)
                    DropdownBtn.TextColor3 = selText ~= "" and selText ~= "Select option" and theme.Text or theme.SubText
                    Arrow.ImageColor3 = theme.SubText
                    MenuFrame.BackgroundColor3 = theme.Background
                    SearchBox.BackgroundColor3 = theme.Element
                    SearchBox.TextColor3 = theme.Text
                    SearchBox.PlaceholderColor3 = theme.SubText
                    OptionsScroll.ScrollBarImageColor3 = theme.Accent
                    for _, btn in ipairs(optionButtons) do
                        if btn and btn.Parent then
                            btn.BackgroundColor3 = theme.Element
                            if btn:IsA("TextButton") and btn.Text ~= "" then
                                btn.TextColor3 = theme.Text
                            end
                        end
                    end
                end)

                local DropdownAPI = {}
                function DropdownAPI:Refresh(newOptions, newDefault)
                    options = newOptions or {}
                    if newDefault ~= nil then
                        selected = newDefault
                        local selText, _ = NormalizeOption(selected)
                        DropdownBtn.Text = selText
                        DropdownBtn.TextColor3 = CurrentTheme.Text
                    end
                    BuildOptions("")
                end
                function DropdownAPI:Set(value)
                    selected = value
                    local selText, _ = NormalizeOption(selected)
                    DropdownBtn.Text = selText
                    DropdownBtn.TextColor3 = CurrentTheme.Text
                    callback(selected)
                end
                function DropdownAPI:Get()
                    return selected
                end
                return DropdownAPI
            end

            function SectionAPI:CreateMultiDropdown(dropdownData)
                dropdownData = dropdownData or {}
                local dropdownName = dropdownData.Name or "MultiDropdown"
                local dropdownIcon = dropdownData.Icon or "ChevronDown"
                local options = dropdownData.Options or dropdownData.Values or {}
                local default = dropdownData.Default or {}
                local callback = dropdownData.Callback or function() end
                local desc = dropdownData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local DropdownFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = DropdownFrame})

                Create("ImageLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(dropdownIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 70, 0, 12),
                    Position = UDim2.new(0, 20, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = dropdownName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = DropdownFrame,
                        Size = UDim2.new(1, -120, 0, 10),
                        Position = UDim2.new(0, 20, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 9,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local DropdownBtn = Create("TextButton", {
                    Parent = DropdownFrame,
                    Size = UDim2.new(0, 85, 0, 22),
                    Position = UDim2.new(1, -92, 0, hasDesc and 8 or 3),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    TextColor3 = CurrentTheme.SubText,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = DropdownBtn})

                local Arrow = Create("ImageLabel", {
                    Parent = DropdownBtn,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(1, -14, 0.5, -4),
                    BackgroundTransparency = 1,
                    Image = GetIcon("ChevronDown"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 20
                })

                local selected = {}
                if type(default) == "table" then
                    for _, v in ipairs(default) do
                        table.insert(selected, v)
                    end
                end

                local function UpdateButtonText()
                    if #selected == 0 then
                        DropdownBtn.Text = "Select options"
                        DropdownBtn.TextColor3 = CurrentTheme.SubText
                    elseif #selected == 1 then
                        local t, _ = NormalizeOption(selected[1])
                        DropdownBtn.Text = t
                        DropdownBtn.TextColor3 = CurrentTheme.Text
                    else
                        DropdownBtn.Text = #selected .. " selected"
                        DropdownBtn.TextColor3 = CurrentTheme.Text
                    end
                end
                UpdateButtonText()

                local MenuFrame = Create("Frame", {
                    Parent = MainWindowScreen,
                    Size = UDim2.new(0, 85, 0, 0),
                    Position = UDim2.new(0, 0, 0, 0),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    ClipsDescendants = true,
                    Visible = false,
                    ZIndex = 500
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = MenuFrame})
                Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = MenuFrame})

                local ddData = RegisterDropdown(MenuFrame, Arrow, DropdownBtn)
                table.insert(sectionDropdowns, ddData)

                local SearchBox = Create("TextBox", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -8, 0, 24),
                    Position = UDim2.new(0, 4, 0, 4),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = "",
                    PlaceholderText = "Search...",
                    TextColor3 = CurrentTheme.Text,
                    PlaceholderColor3 = CurrentTheme.SubText,
                    TextSize = 11,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = SearchBox})

                Create("ImageLabel", {
                    Parent = SearchBox,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(1, -14, 0.5, -4),
                    BackgroundTransparency = 1,
                    Image = GetIcon("Search"),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 32
                })

                local OptionsScroll = Create("ScrollingFrame", {
                    Parent = MenuFrame,
                    Size = UDim2.new(1, -8, 0, 0),
                    Position = UDim2.new(0, 4, 0, 26),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    ScrollBarThickness = 2,
                    ScrollBarImageColor3 = CurrentTheme.Accent,
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ZIndex = 31
                })

                Create("UIListLayout", {
                    Parent = OptionsScroll,
                    Padding = UDim.new(0, 2)
                })

                local optionItems = {}

                local function IsSelected(opt)
                    for _, s in ipairs(selected) do
                        local sText, _ = NormalizeOption(s)
                        local oText, _ = NormalizeOption(opt)
                        if sText == oText then return true end
                    end
                    return false
                end

                local function BuildOptions(filterText)
                    for _, item in ipairs(optionItems) do
                        if item then item:Destroy() end
                    end
                    optionItems = {}

                    local count = 0
                    for _, opt in ipairs(options) do
                        local optText, optIcon = NormalizeOption(opt)
                        if not filterText or filterText == "" or string.find(string.lower(optText), string.lower(filterText), 1, true) then

                        local row = Create("Frame", {
                            Parent = OptionsScroll,
                            Size = UDim2.new(1, 0, 0, 24),
                            BackgroundColor3 = CurrentTheme.Element,
                            ZIndex = 32,
                        })
                        Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = row})

                        local checkBox = Create("Frame", {
                            Parent = row,
                            Size = UDim2.new(0, 12, 0, 12),
                            Position = UDim2.new(0, 6, 0.5, -6),
                            BackgroundColor3 = CurrentTheme.Background,
                            BorderSizePixel = 0,
                            ZIndex = 33,
                        })
                        Create("UICorner", {CornerRadius = UDim.new(0, 2), Parent = checkBox})

                        local checkMark = Create("ImageLabel", {
                            Parent = checkBox,
                            Size = UDim2.new(0, 10, 0, 10),
                            Position = UDim2.new(0.5, -5, 0.5, -5),
                            BackgroundTransparency = 1,
                            Image = GetIcon("Check"),
                            ImageColor3 = CurrentTheme.Accent,
                            ZIndex = 34,
                            Visible = IsSelected(opt),
                        })

                        local textX = 26
                        if optIcon then
                            Create("ImageLabel", {
                                Parent = row,
                                Size = UDim2.new(0, 10, 0, 10),
                                Position = UDim2.new(0, 20, 0.5, -5),
                                BackgroundTransparency = 1,
                                Image = GetIcon(optIcon),
                                ImageColor3 = CurrentTheme.SubText,
                                ZIndex = 33,
                            })
                            textX = 42
                        end

                        local txt = Create("TextLabel", {
                            Parent = row,
                            Size = UDim2.new(1, -textX - 4, 1, 0),
                            Position = UDim2.new(0, textX, 0, 0),
                            BackgroundTransparency = 1,
                            Text = optText,
                            TextColor3 = CurrentTheme.Text,
                            TextSize = 9,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            ZIndex = 33,
                        })

                        local clickBtn = Create("TextButton", {
                            Parent = row,
                            Size = UDim2.new(1, 0, 1, 0),
                            BackgroundTransparency = 1,
                            Text = "",
                            ZIndex = 35,
                        })

                        clickBtn.MouseButton1Click:Connect(function()
                            local selIdx = nil
                            for i, s in ipairs(selected) do
                                local sText, _ = NormalizeOption(s)
                                if sText == optText then selIdx = i; break end
                            end
                            if selIdx then
                                table.remove(selected, selIdx)
                                checkMark.Visible = false
                            else
                                table.insert(selected, opt)
                                checkMark.Visible = true
                            end
                            UpdateButtonText()
                            callback(selected)
                        end)

                        row.MouseEnter:Connect(function()
                            row.BackgroundColor3 = CurrentTheme.ElementHover
                        end)
                        row.MouseLeave:Connect(function()
                            row.BackgroundColor3 = CurrentTheme.Element
                        end)

                        table.insert(optionItems, row)
                        count = count + 1
                        end
                    end

                    local listHeight = math.min(count * 24 + 4, 120)
                    OptionsScroll.Size = UDim2.new(1, -10, 0, listHeight)
                    OptionsScroll.CanvasSize = UDim2.new(0, 0, 0, count * 24 + 4)
                end

                BuildOptions()

                SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
                    BuildOptions(SearchBox.Text)
                end)

                local function UpdateMenuPosition()
                    if not DropdownBtn or not DropdownBtn.Parent then return end
                    local btnPos = DropdownBtn.AbsolutePosition
                    local btnSize = DropdownBtn.AbsoluteSize
                    MenuFrame.Position = UDim2.new(0, btnPos.X, 0, btnPos.Y + btnSize.Y + 3)
                    MenuFrame.Size = UDim2.new(0, btnSize.X, 0, MenuFrame.Size.Y.Offset)
                end

                DropdownBtn.MouseButton1Click:Connect(function()
                    if ddData.IsOpen then
                        ddData.IsOpen = false
                        MenuFrame.Visible = false
                        MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                        Arrow.Rotation = 0
                        if ddData.HeartbeatConn then
                            pcall(function() ddData.HeartbeatConn:Disconnect() end)
                            ddData.HeartbeatConn = nil
                        end
                    else
                        CloseAllDropdowns()
                        ddData.IsOpen = true
                        UpdateMenuPosition()
                        MenuFrame.Visible = true
                        local menuHeight = math.min(#options * 24 + 32, 180)
                        MenuFrame.Size = UDim2.new(0, DropdownBtn.AbsoluteSize.X, 0, menuHeight)
                        Arrow.Rotation = 180
                        SearchBox.Text = ""
                        BuildOptions()
                        -- Start heartbeat to track button position while scrolling
                        ddData.HeartbeatConn = RunService.Heartbeat:Connect(function()
                            if ddData.IsOpen and DropdownBtn and DropdownBtn.Parent then
                                UpdateMenuPosition()
                            else
                                if ddData.HeartbeatConn then
                                    pcall(function() ddData.HeartbeatConn:Disconnect() end)
                                    ddData.HeartbeatConn = nil
                                end
                            end
                        end)
                    end
                end)

                -- Close dropdown when scrolling the content area
                TabContent:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                    if ddData.IsOpen then
                        ddData.IsOpen = false
                        MenuFrame.Visible = false
                        MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                        Arrow.Rotation = 0
                        if ddData.HeartbeatConn then
                            pcall(function() ddData.HeartbeatConn:Disconnect() end)
                            ddData.HeartbeatConn = nil
                        end
                    end
                end)

                local clickConn = UserInputService.InputBegan:Connect(function(input, gpe)
                    if not gpe and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                        if ddData.IsOpen then
                            local mousePos = UserInputService:GetMouseLocation()
                            local menuPos = MenuFrame.AbsolutePosition
                            local menuSize = MenuFrame.AbsoluteSize
                            if mousePos.X < menuPos.X or mousePos.X > menuPos.X + menuSize.X or
                               mousePos.Y < menuPos.Y or mousePos.Y > menuPos.Y + menuSize.Y then
                                local btnPos = DropdownBtn.AbsolutePosition
                                local btnSize = DropdownBtn.AbsoluteSize
                                if mousePos.X < btnPos.X or mousePos.X > btnPos.X + btnSize.X or
                                   mousePos.Y < btnPos.Y or mousePos.Y > btnPos.Y + btnSize.Y then
                                    ddData.IsOpen = false
                                    MenuFrame.Visible = false
                                    MenuFrame.Size = UDim2.new(0, MenuFrame.Size.X.Offset, 0, 0)
                                    Arrow.Rotation = 0
                                    if ddData.HeartbeatConn then
                                        pcall(function() ddData.HeartbeatConn:Disconnect() end)
                                        ddData.HeartbeatConn = nil
                                    end
                                end
                            end
                        end
                    end
                end)
                table.insert(DropdownConnections, clickConn)

                ListenTheme(function(theme)
                    DropdownFrame.BackgroundColor3 = theme.Background
                    DropdownBtn.BackgroundColor3 = theme.Element
                    UpdateButtonText()
                    Arrow.ImageColor3 = theme.SubText
                    MenuFrame.BackgroundColor3 = theme.Background
                    SearchBox.BackgroundColor3 = theme.Element
                    SearchBox.TextColor3 = theme.Text
                    SearchBox.PlaceholderColor3 = theme.SubText
                    OptionsScroll.ScrollBarImageColor3 = theme.Accent
                    for _, row in ipairs(optionItems) do
                        if row and row.Parent then
                            row.BackgroundColor3 = theme.Element
                        end
                    end
                end)

                local MultiDropdownAPI = {}
                function MultiDropdownAPI:Refresh(newOptions, newDefault)
                    options = newOptions or {}
                    if type(newDefault) == "table" then
                        selected = {}
                        for _, v in ipairs(newDefault) do table.insert(selected, v) end
                        UpdateButtonText()
                    end
                    BuildOptions()
                end
                function MultiDropdownAPI:Set(values)
                    selected = {}
                    if type(values) == "table" then
                        for _, v in ipairs(values) do table.insert(selected, v) end
                    end
                    UpdateButtonText()
                    callback(selected)
                end
                function MultiDropdownAPI:Get()
                    return selected
                end
                return MultiDropdownAPI
            end

            function SectionAPI:CreateInput(inputData)
                inputData = inputData or {}
                local inputName = inputData.Name or "Input"
                local inputIcon = inputData.Icon or "Type"
                local placeholder = inputData.Placeholder or "Enter..."
                local default = inputData.Default or ""
                local callback = inputData.Callback or function() end
                local desc = inputData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local InputFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = InputFrame})

                Create("ImageLabel", {
                    Parent = InputFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(inputIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = InputFrame,
                    Size = UDim2.new(0, 70, 0, 12),
                    Position = UDim2.new(0, 20, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = inputName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = InputFrame,
                        Size = UDim2.new(1, -120, 0, 10),
                        Position = UDim2.new(0, 20, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 9,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local InputBox = Create("TextBox", {
                    Parent = InputFrame,
                    Size = UDim2.new(0, 85, 0, 22),
                    Position = UDim2.new(1, -92, 0, hasDesc and 8 or 3),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = default,
                    PlaceholderText = placeholder,
                    TextColor3 = CurrentTheme.Text,
                    PlaceholderColor3 = CurrentTheme.SubText,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = InputBox})

                InputBox.FocusLost:Connect(function(enterPressed)
                    callback(InputBox.Text, enterPressed)
                end)

                ListenTheme(function(theme)
                    InputFrame.BackgroundColor3 = theme.Background
                    InputBox.BackgroundColor3 = theme.Element
                    InputBox.TextColor3 = theme.Text
                    InputBox.PlaceholderColor3 = theme.SubText
                end)

                local API = {
                    Set = function(text) InputBox.Text = text end,
                    Get = function() return InputBox.Text end
                }
                return API
            end

            function SectionAPI:CreateKeybind(bindData)
                bindData = bindData or {}
                local bindName = bindData.Name or "Keybind"
                local bindIcon = bindData.Icon or "Key"
                local default = bindData.Default or Enum.KeyCode.LeftShift
                local callback = bindData.Callback or function() end
                local desc = bindData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local BindFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = BindFrame})

                Create("ImageLabel", {
                    Parent = BindFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(bindIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = BindFrame,
                    Size = UDim2.new(0, 100, 0, 12),
                    Position = UDim2.new(0, 20, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = bindName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = BindFrame,
                        Size = UDim2.new(1, -70, 0, 10),
                        Position = UDim2.new(0, 20, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 9,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local BindBtn = Create("TextButton", {
                    Parent = BindFrame,
                    Size = UDim2.new(0, 42, 0, 22),
                    Position = UDim2.new(1, -48, 0, hasDesc and 8 or 3),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = default.Name,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.GothamBold,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = BindBtn})

                local listening = false
                BindBtn.MouseButton1Click:Connect(function()
                    listening = true
                    BindBtn.Text = "..."
                    local conn
                    conn = UserInputService.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            default = input.KeyCode
                            BindBtn.Text = input.KeyCode.Name
                            listening = false
                            conn:Disconnect()
                            callback(input.KeyCode)
                        end
                    end)
                end)

                UserInputService.InputBegan:Connect(function(input)
                    if input.KeyCode == default and not listening then
                        callback(default)
                    end
                end)

                ListenTheme(function(theme)
                    BindFrame.BackgroundColor3 = theme.Background
                    BindBtn.BackgroundColor3 = theme.Element
                    BindBtn.TextColor3 = theme.Text
                end)

                return {Set = function(key) default = key; BindBtn.Text = key.Name end, Get = function() return default end}
            end

            function SectionAPI:CreateLabel(labelData)
                labelData = labelData or {}
                local labelText = labelData.Text or "Label"
                local labelIcon = labelData.Icon or "Type"

                local LabelFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 24),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = LabelFrame})

                Create("ImageLabel", {
                    Parent = LabelFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0.5, -8),
                    BackgroundTransparency = 1,
                    Image = GetIcon(labelIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                local Label = Create("TextLabel", {
                    Parent = LabelFrame,
                    Size = UDim2.new(0, 200, 0, 18),
                    Position = UDim2.new(0, 20, 0, 0),
                    BackgroundTransparency = 1,
                    Text = labelText,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    RichText = true,
                    ZIndex = 19
                })

                ListenTheme(function(theme)
                    LabelFrame.BackgroundColor3 = theme.Background
                    Label.TextColor3 = theme.Text
                end)

                return {Set = function(text) Label.Text = text end, Get = function() return Label.Text end}
            end

            function SectionAPI:CreateParagraph(paraData)
                paraData = paraData or {}
                local title = paraData.Title or "Paragraph"
                local content = paraData.Content or paraData.Desc or "Description text goes here..."
                local icon = paraData.Icon or "Type"

                local ParaFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = ParaFrame})

                Create("ImageLabel", {
                    Parent = ParaFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0, 8),
                    BackgroundTransparency = 1,
                    Image = GetIcon(icon),
                    ImageColor3 = CurrentTheme.Accent,
                    ZIndex = 19
                })

                local TitleLabel = Create("TextLabel", {
                    Parent = ParaFrame,
                    Size = UDim2.new(1, -26, 0, 14),
                    Position = UDim2.new(0, 20, 0, 4),
                    BackgroundTransparency = 1,
                    Text = title,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    ClipsDescendants = true,
                    ZIndex = 19
                })

                local ContentLabel = Create("TextLabel", {
                    Parent = ParaFrame,
                    Size = UDim2.new(1, -14, 0, 0),
                    Position = UDim2.new(0, 7, 0, 22),
                    BackgroundTransparency = 1,
                    Text = content,
                    TextColor3 = CurrentTheme.SubText,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    RichText = true,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    ZIndex = 19
                })

                local function RefreshSize()
                    task.wait()
                    if not ParaFrame or not ParaFrame.Parent then return end
                    local width = math.max(ParaFrame.AbsoluteSize.X - 18, 50)
                    if width > 0 then
                        local bounds = TextService:GetTextSize(ContentLabel.Text, ContentLabel.TextSize, ContentLabel.Font, Vector2.new(width, math.huge))
                        local newHeight = 28 + bounds.Y + 10
                        ParaFrame.Size = UDim2.new(1, 0, 0, newHeight)
                    end
                    if self._UpdateSize then
                        self._UpdateSize()
                    end
                end

                task.defer(RefreshSize)
                ContentLabel:GetPropertyChangedSignal("Text"):Connect(RefreshSize)
                ParaFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                    if ParaFrame.AbsoluteSize.X > 0 then
                        RefreshSize()
                    end
                end)

                -- Ensure size is correct after layout
                task.spawn(function()
                    for i = 1, 5 do
                        task.wait(0.1)
                        if not ParaFrame or not ParaFrame.Parent then break end
                        RefreshSize()
                    end
                end)

                ListenTheme(function(theme)
                    ParaFrame.BackgroundColor3 = theme.Background
                    TitleLabel.TextColor3 = theme.Text
                    ContentLabel.TextColor3 = theme.SubText
                end)

                local API = {
                    SetTitle = function(t) TitleLabel.Text = t end,
                    SetContent = function(c) ContentLabel.Text = c end,
                    SetDesc = function(c) ContentLabel.Text = c end,
                    GetContent = function() return ContentLabel.Text end,
                }
                return API
            end

            function SectionAPI:CreateColorPicker(pickerData)
                pickerData = pickerData or {}
                local pickerName = pickerData.Name or "Color"
                local pickerIcon = pickerData.Icon or "Palette"
                local default = pickerData.Default or Color3.fromRGB(255, 255, 255)
                local callback = pickerData.Callback or function() end
                local desc = pickerData.Desc

                local hasDesc = desc and desc ~= ""
                local frameHeight = hasDesc and 42 or 28

                local PickerFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, frameHeight),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = PickerFrame})

                Create("ImageLabel", {
                    Parent = PickerFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0, hasDesc and 5 or 5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(pickerIcon),
                    ImageColor3 = CurrentTheme.SubText,
                    ZIndex = 19
                })

                Create("TextLabel", {
                    Parent = PickerFrame,
                    Size = UDim2.new(0, 100, 0, 12),
                    Position = UDim2.new(0, 20, 0, hasDesc and 1 or 3),
                    BackgroundTransparency = 1,
                    Text = pickerName,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                if hasDesc then
                    Create("TextLabel", {
                        Parent = PickerFrame,
                        Size = UDim2.new(1, -70, 0, 10),
                        Position = UDim2.new(0, 20, 0, 13),
                        BackgroundTransparency = 1,
                        Text = desc,
                        TextColor3 = CurrentTheme.SubText,
                        TextSize = 9,
                        Font = Enum.Font.Gotham,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        ZIndex = 19
                    })
                end

                local ColorPreview = Create("TextButton", {
                    Parent = PickerFrame,
                    Size = UDim2.new(0, 30, 0, 22),
                    Position = UDim2.new(1, -37, 0, hasDesc and 8 or 3),
                    BackgroundColor3 = default,
                    Text = "",
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = ColorPreview})
                Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = ColorPreview})

                local ColorMenu = Create("Frame", {
                    Parent = ColorPreview,
                    Size = UDim2.new(0, 95, 0, 0),
                    Position = UDim2.new(0, -50, 0, 18),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    ClipsDescendants = true,
                    Visible = false,
                    ZIndex = 30
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 5), Parent = ColorMenu})
                Create("UIStroke", {Color = CurrentTheme.Border, Thickness = 1, Parent = ColorMenu})

                local RInput = Create("TextBox", {
                    Parent = ColorMenu,
                    Size = UDim2.new(0, 32, 0, 28),
                    Position = UDim2.new(0, 5, 0, 5),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = tostring(math.round(default.R * 255)),
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = RInput})

                local GInput = Create("TextBox", {
                    Parent = ColorMenu,
                    Size = UDim2.new(0, 32, 0, 28),
                    Position = UDim2.new(0, 40, 0, 5),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = tostring(math.round(default.G * 255)),
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = GInput})

                local BInput = Create("TextBox", {
                    Parent = ColorMenu,
                    Size = UDim2.new(0, 32, 0, 28),
                    Position = UDim2.new(0, 75, 0, 5),
                    BackgroundColor3 = CurrentTheme.Element,
                    Text = tostring(math.round(default.B * 255)),
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = BInput})

                local ApplyBtn = Create("TextButton", {
                    Parent = ColorMenu,
                    Size = UDim2.new(1, -10, 0, 28),
                    Position = UDim2.new(0, 5, 0, 28),
                    BackgroundColor3 = CurrentTheme.Accent,
                    Text = "Apply",
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.GothamBold,
                    ZIndex = 31
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 3), Parent = ApplyBtn})

                local colorOpen = false
                ColorPreview.MouseButton1Click:Connect(function()
                    colorOpen = not colorOpen
                    if colorOpen then
                        ColorMenu.Visible = true
                        ColorMenu.Size = UDim2.new(0, 95, 0, 42)
                    else
                        ColorMenu.Visible = false
                        ColorMenu.Size = UDim2.new(0, 95, 0, 0)
                    end
                end)

                ApplyBtn.MouseButton1Click:Connect(function()
                    local r = math.clamp(tonumber(RInput.Text) or 255, 0, 255)
                    local g = math.clamp(tonumber(GInput.Text) or 255, 0, 255)
                    local b = math.clamp(tonumber(BInput.Text) or 255, 0, 255)
                    local newColor = Color3.fromRGB(r, g, b)
                    ColorPreview.BackgroundColor3 = newColor
                    callback(newColor)
                    colorOpen = false
                    ColorMenu.Visible = false
                    ColorMenu.Size = UDim2.new(0, 95, 0, 0)
                end)

                ListenTheme(function(theme)
                    PickerFrame.BackgroundColor3 = theme.Background
                    ColorMenu.BackgroundColor3 = theme.Background
                    RInput.BackgroundColor3 = theme.Element
                    GInput.BackgroundColor3 = theme.Element
                    BInput.BackgroundColor3 = theme.Element
                    ApplyBtn.BackgroundColor3 = theme.Accent
                end)

                return {Set = function(c) ColorPreview.BackgroundColor3 = c; callback(c) end, Get = function() return ColorPreview.BackgroundColor3 end}
            end

            function SectionAPI:CreateDivider()
                local Divider = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, -8, 0, 1),
                    Position = UDim2.new(0, 4, 0, 0),
                    BackgroundColor3 = CurrentTheme.Border,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ZIndex = 18
                })

                ListenTheme(function(theme)
                    Divider.BackgroundColor3 = theme.Border
                end)

                return self
            end

            function SectionAPI:CreateStatus(statusData)
                statusData = statusData or {}
                local statusText = statusData.Text or "Status"
                local statusIcon = statusData.Icon or "Check"
                local statusColor = statusData.Color or CurrentTheme.Success

                local StatusFrame = Create("Frame", {
                    Parent = SectionItems,
                    Size = UDim2.new(1, 0, 0, 24),
                    BackgroundColor3 = CurrentTheme.Background,
                    BorderSizePixel = 0,
                    LayoutOrder = #SectionItems:GetChildren(),
                    ClipsDescendants = true,
                    ZIndex = 18
                })
                Create("UICorner", {CornerRadius = UDim.new(0, 4), Parent = StatusFrame})

                local Dot = Create("Frame", {
                    Parent = StatusFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 7, 0.5, -3),
                    BackgroundColor3 = statusColor,
                    BorderSizePixel = 0,
                    ZIndex = 19
                })
                Create("UICorner", {CornerRadius = UDim.new(1, 0), Parent = Dot})

                Create("ImageLabel", {
                    Parent = StatusFrame,
                    Size = UDim2.new(0, 10, 0, 10),
                    Position = UDim2.new(0, 16, 0.5, -5),
                    BackgroundTransparency = 1,
                    Image = GetIcon(statusIcon),
                    ImageColor3 = statusColor,
                    ZIndex = 19
                })

                local StatusLabel = Create("TextLabel", {
                    Parent = StatusFrame,
                    Size = UDim2.new(0, 200, 0, 18),
                    Position = UDim2.new(0, 28, 0, 0),
                    BackgroundTransparency = 1,
                    Text = statusText,
                    TextColor3 = CurrentTheme.Text,
                    TextSize = 9,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    ZIndex = 19
                })

                ListenTheme(function(theme)
                    StatusFrame.BackgroundColor3 = theme.Background
                    StatusLabel.TextColor3 = theme.Text
                end)

                return {Set = function(t) StatusLabel.Text = t end, Get = function() return StatusLabel.Text end}
            end

            return SectionAPI
        end

        -- TabAPI convenience methods (WindUI-style compatibility)
        function TabAPI:Section(data)
            local sec = self:CreateSection(data)
            self._CurrentSection = sec
            return sec
        end

        function TabAPI:Paragraph(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateParagraph(data)
        end

        function TabAPI:Button(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateButton(data)
        end

        function TabAPI:Toggle(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateToggle(data)
        end

        function TabAPI:Slider(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateSlider(data)
        end

        function TabAPI:Dropdown(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateDropdown(data)
        end

        function TabAPI:MultiDropdown(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateMultiDropdown(data)
        end

        function TabAPI:Input(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateInput(data)
        end

        function TabAPI:Keybind(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateKeybind(data)
        end

        function TabAPI:Label(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateLabel(data)
        end

        function TabAPI:ColorPicker(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateColorPicker(data)
        end

        function TabAPI:Divider()
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateDivider()
        end

        function TabAPI:Status(data)
            if not self._CurrentSection then self:Section({Name = "Default", Opened = true}) end
            return self._CurrentSection:CreateStatus(data)
        end

        return TabAPI
    end

    -- Search functionality
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local text = SearchBox.Text:lower()
        for _, tab in ipairs(TabButtons) do
            if text == "" or tab.Name:find(text, 1, true) then
                tab.Btn.Visible = true
            else
                tab.Btn.Visible = false
            end
        end
    end)

    return WindowAPI
end

return Quantum
