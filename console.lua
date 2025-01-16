local Lib = {
    Colors = {
        ["Green"] = "0,255,0", -- color in rgb
        ["Cyan"] = "33, 161, 163"
    }
}

-- Function to change colors in the DevConsole
Lib.ChangeColor = function() 
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

-- Function to print colored text to the console
Lib.print = function(color, text, size)
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

-- Call the ChangeColor function to initialize the color change
Lib.ChangeColor()

-- Return the Lib table so it can be used by other scripts
return Lib
