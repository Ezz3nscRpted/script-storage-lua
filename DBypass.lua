--[[
██████╗░██╗░░░██╗██████╗░░█████╗░░██████╗░██████╗
██╔══██╗╚██╗░██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝
██████╦╝░╚████╔╝░██████╔╝███████║╚█████╗░╚█████╗░
██╔══██╗░░╚██╔╝░░██╔═══╝░██╔══██║░╚═══██╗░╚═══██╗
██████╦╝░░░██║░░░██║░░░░░██║░░██║██████╔╝██████╔╝
╚═════╝░░░░╚═╝░░░╚═╝░░░░░╚═╝░░╚═╝╚═════╝░╚═════╝░
~ 0.2v
--]]

--// PlayerInfo
local Players          = game:GetService("Players")
local WorkspacePlayers = game:GetService("Workspace").Players
local LocalPlayer      = Players.LocalPlayer

local Character     = LocalPlayer.Character

--// Find the AntiCheat
function FindAC(characterObject)
    for i,obj in pairs(characterObject:GetChildren()) do
        if obj:IsA("Script") and not obj:IsA("LocalScript") then
            if #obj:GetChildren() > 0 then
                return obj
            end
        end
    end
end

function DeleteAC(characterObject)
    local AC = FindAC(characterObject)
    if AC then
        AC:Destroy()
    else
        AC = FindAC(characterObject)
    end
    print("[Console] 'AC' Deleted.")
end

--// Delete first load.
DeleteAC(Character)

--// First time loading in.
WorkspacePlayers.ChildAdded:Connect(function(object)
    if object.Name == LocalPlayer.Name then
        local FullLoad = object:WaitForChild("FULLY_LOADED_CHAR")
        DeleteAC(object)
    end
end)

--// LocalPlayer Character respawned or spawned.
LocalPlayer.CharacterAdded:Connect(function(character)
    -- print("LocalPlayer loaded!")
    local Hum = character:FindFirstChild("Humanoid")
    wait(2)
    DeleteAC(character)
end)

