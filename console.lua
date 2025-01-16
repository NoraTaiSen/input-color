local Modules = {
    Colors = {
        ["Green"] = "0,255,0", 
        ["Cyan"] = "33, 161, 163",
        ["White"] = "255,255,255",
        ["Pink"] = "255, 102, 153",
        ["Red"] = "255,0,0", 
        ["Blue"] = "0,0,255", 
        ["Yellow"] = "255,255,0", 
        ["Orange"] = "255,165,0", 
        ["Purple"] = "128,0,128", 
        ["Brown"] = "139,69,19", 
        ["Gray"] = "169,169,169", 
        ["Black"] = "0,0,0", 
        ["Lime"] = "0,255,0", 
        ["Gold"] = "255,215,0", 
        ["Silver"] = "192,192,192", 
        ["Indigo"] = "75,0,130", 
        ["Teal"] = "0,128,128", 
        ["Violet"] = "238,130,238"
    },
    
    Services = {
        RunService = game:GetService("RunService"),
        CoreGui = game:GetService("CoreGui")
    }
}

-- Function to change colors in the DevConsole
Modules.ChangeColor = function() 
    Lib.Services.RunService.Heartbeat:Connect(function()
        if Lib.Services.CoreGui:FindFirstChild("DevConsoleMaster") then 
            for _, v in pairs(Lib.Services.CoreGui:FindFirstChild("DevConsoleMaster"):GetDescendants()) do 
                if v:IsA("TextLabel") then 
                    v.RichText = true 
                end 
            end 
        end
    end)
end

-- Function to create a loading bar with specified watermark and color
Modules.LoadingBar = function(watermark, color, delay, loadingsymbol)
    delay = delay or 0.1 
    local Text = watermark .. tostring(math.random(500, 20000))
    print(Text)

    local loadingLabel = nil
    local progress = ""

    repeat task.wait()
        for _, label in pairs(Lib.Services.CoreGui:FindFirstChild("DevConsoleMaster"):GetDescendants()) do 
            if label:IsA("TextLabel") and string.find(label.Text:lower(), Text:lower()) then 
                loadingLabel = label 
                break
            end 
        end 
    until loadingLabel

    local start = os.time()

    for i = 1, 50 do
        progress = progress .. loadingsymbol
        loadingLabel.Text = string.format("<font color='rgb(%s)' size='15'>[%s] [%d%% loaded] %s</font>", Lib.Colors["White"], watermark, i * 2, progress)
        task.wait(delay)
    end

    loadingLabel.Text = string.format("<font color='rgb(%s)' size='15'>[%s] Successfully loaded in %ds</font>", Lib.Colors[color], watermark, os.time() - start)
end

-- Function to print colored text to the console
Modules.print = function(color, text, size)
    if not Lib.Colors[color] then 
        warn("Color was not found!")
        return 
    end

    local Text = '<font color="rgb(' .. Lib.Colors[color] .. ')"'
    if size then
        Text = Text .. ' size="' .. tostring(size) .. '"'
    end
    Text = Text .. '>' .. tostring(text) .. '</font>'
    print(Text)
end

return Modules
