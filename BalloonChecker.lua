-- Get a reference to the Workspace
local workspace = game:GetService("Workspace")
-- Create a ScreenGui to hold the GUI elements
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.DisplayOrder = 999 -- Set a high DisplayOrder value to ensure it's on top
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
    local thingsFolder = workspace:FindFirstChild("__THINGS")
    
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
            if numModels == 0 then
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

-- Call the updateCount function initially
updateCount()

-- Set up a loop to update the count periodically
while true do
    -- Wait for a short duration before updating again
    wait(0.1) -- You can adjust the duration as needed
    
    -- Update the count
    updateCount()
end
