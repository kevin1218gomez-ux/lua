local Players = game:GetService("Players")

-- 1. PUT THE APPEARANCE ID HERE (The person whose look you want to copy)
local LOOK_LIKE_THIS_ID = 4881406563 

-- 2. PUT THE TARGET ID HERE (The person in your game who will change)
-- Use 0 if you want EVERYONE who joins to change instead.
local TARGET_PLAYER_ID = 10638799665 

local function applyNewLook(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Fetch the outfit of the Appearance ID
    local success, description = pcall(function()
        return Players:GetHumanoidDescriptionFromUserId(LOOK_LIKE_THIS_ID)
    end)

    if success and description then
        humanoid:ApplyDescription(description)
    else
        warn("Failed to load appearance for ID: " .. LOOK_LIKE_THIS_ID)
    end
end

-- This part checks who to change when they join
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        
        if TARGET_PLAYER_ID == 0 then
            -- Change everyone if TARGET_PLAYER_ID is 0
            applyNewLook(player)
        elseif player.UserId == TARGET_PLAYER_ID then
            -- Only change the specific target
            applyNewLook(player)
        end
        
    end)
end)
