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

Modules.ChangeColor = function() 
    game:GetService("RunService").Heartbeat:Connect(function()
        if game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster") then 
            for _, v in pairs(game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster"):GetDescendants()) do 
                if v:IsA("TextLabel") then 
                    v.RichText = true 
                end 
            end 
        end
    end)
end

Modules.LoadingBar = function(watermark, color, delay, loadingsymbol)
    delay = delay or 0.1 
    local Text = watermark .. tostring(math.random(500, 20000))
    print(Text)

    local loadingLabel = nil
    local progress = ""

    repeat task.wait()
        for _, label in pairs(Modules.Services.CoreGui:FindFirstChild("DevConsoleMaster"):GetDescendants()) do 
            if label:IsA("TextLabel") and string.find(label.Text:lower(), Text:lower()) then 
                loadingLabel = label 
                break
            end 
        end 
    until loadingLabel

    local start = os.time()

    for i = 1, 50 do
        progress = progress .. loadingsymbol
        loadingLabel.Text = string.format("<font color='rgb(%s)' size='15'>[%s] [%d%% loaded] %s</font>", Modules.Colors["White"], watermark, i * 2, progress)
        task.wait(delay)
    end

    loadingLabel.Text = string.format("<font color='rgb(%s)' size='15'>[%s] Successfully loaded in %ds</font>", Modules.Colors[color], watermark, os.time() - start)
end

Modules.print = function(color, text, size)
    if not Modules.Colors[color] then 
        warn("Color was not found!")
        return 
    end

    local Text = '<font color="rgb(' .. Modules.Colors[color] .. ')"'
    if size then
        Text = Text .. ' size="' .. tostring(size) .. '"'
    end
    Text = Text .. '>' .. tostring(text) .. '</font>'
    print(Text)
end

Modules.ChangeColor()
---Modules.print("Green", "Lol")
---Modules.print("Green", "Lol with size 20", 20)
---Modules.LoadingBar("✅", "Cyan", 0.005, "#", "|")
