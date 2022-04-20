--- OLD SCRIPT
--- 0.1V

---// Services \\---
local LocalPlayer = game:GetService("Players").LocalPlayer
local Players     = game:GetService("Workspace").Players

function BypassDeadAntiCheat()
    -- Find LocalPlayer
    for i,v in pairs(Players:GetChildren()) do
        -- LocalPlayer check
        if v.Name == LocalPlayer.Name then
            -- Loop through players children
            for i,e in pairs(v:GetChildren()) do
                -- Check for script
                if e:IsA("Script") then
                    -- Loop through scripts children
                    for i,n in pairs(e:GetChildren()) do
                        -- If it contains a localscript its the anticheat shit
                        if n.Name == "LocalScript" then
                            e:Destroy()
                            print("[AntiCheat] Removed!")
                        end
                    end
                end
            end
        end
    end
end

BypassDeadAntiCheat()