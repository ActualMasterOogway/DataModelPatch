local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugMusicSampleSounds);
local l_useEffect_0 = v2.useEffect;
local v5 = 50 * Vector3.new(1, 0, 1, 0);
local v6 = {
    {
        title = "Beach Morning LoFi", 
        assetId = "rbxassetid://83784623771159", 
        position = Vector3.new(1, 0.5, 0, 0) * v5
    }, 
    {
        title = "Mirage Portal", 
        assetId = "rbxassetid://75793628822368", 
        position = Vector3.new(-1, 0.5, 0, 0) * v5
    }, 
    {
        title = "Altogether Elsewhere", 
        assetId = "rbxassetid://73856926671353", 
        position = Vector3.new(0, 0.5, 1, 0) * v5
    }, 
    {
        title = "Shiawase", 
        assetId = "rbxassetid://5409360995", 
        position = Vector3.new(0, 0.5, -1, 0) * v5
    }, 
    {
        title = "Life in an Elevator", 
        assetId = "rbxassetid://1841647093", 
        position = Vector3.new(1, 0.5, 0, 0) * v5 * 2, 
        shouldSurfaceToUser = false
    }, 
    {
        title = "Explosion", 
        assetId = "rbxassetid://157878578", 
        position = Vector3.new(0, 0.5, 1, 0) * v5 * 2, 
        shouldSurfaceToUser = false
    }
};
local function v11(v7, v8) --[[ Line: 54 ]] --[[ Name: spawnSoundEmitter ]]
    -- upvalues: v5 (copy)
    local l_Part_0 = Instance.new("Part");
    l_Part_0.Position = v8;
    l_Part_0.Anchored = true;
    local l_Sound_0 = Instance.new("Sound");
    l_Sound_0.Name = ("Sound_%*"):format(v7);
    l_Sound_0.SoundId = v7;
    l_Sound_0.Looped = true;
    l_Sound_0.RollOffMinDistance = 10;
    l_Sound_0.RollOffMaxDistance = v5.X * 0.8;
    l_Sound_0.Parent = l_Part_0;
    l_Part_0.Parent = workspace;
    l_Sound_0:Play();
    return l_Part_0;
end;
return function() --[[ Line: 73 ]] --[[ Name: DebugAudioEmitters ]]
    -- upvalues: v3 (copy), l_useEffect_0 (copy), v6 (copy), v11 (copy), l_ReplicatedStorage_0 (copy)
    if v3() then
        l_useEffect_0(function() --[[ Line: 75 ]]
            -- upvalues: v6 (ref), v11 (ref), l_ReplicatedStorage_0 (ref)
            local v12 = {};
            for _, v14 in v6 do
                local v15 = v11(v14.assetId, v14.position);
                local l_BillboardGui_0 = Instance.new("BillboardGui");
                l_BillboardGui_0.ExtentsOffsetWorldSpace = Vector3.new(0, 10, 0, 0);
                l_BillboardGui_0.Size = UDim2.fromScale(10, 2);
                l_BillboardGui_0.Adornee = v15;
                local l_TextLabel_0 = Instance.new("TextLabel");
                l_TextLabel_0.Text = v14.title;
                l_TextLabel_0.Size = UDim2.fromScale(1, 1);
                l_TextLabel_0.Font = Enum.Font.BuilderSansBold;
                l_TextLabel_0.TextScaled = true;
                l_TextLabel_0.TextColor3 = if v14.shouldSurfaceToUser == false then Color3.fromHex("#c4474f") else Color3.fromHex("#fff");
                l_TextLabel_0.BackgroundTransparency = 1;
                l_TextLabel_0.Parent = l_BillboardGui_0;
                local l_UIStroke_0 = Instance.new("UIStroke");
                l_UIStroke_0.Color = Color3.fromHex("#202020");
                l_UIStroke_0.Thickness = 2;
                l_UIStroke_0.Parent = l_TextLabel_0;
                l_BillboardGui_0.Parent = v15;
                table.insert(v12, v15);
            end;
            local l_Sound_1 = Instance.new("Sound");
            l_Sound_1.SoundId = "rbxassetid://9048375035";
            l_Sound_1.Volume = 0.05;
            l_Sound_1.Looped = true;
            l_Sound_1.Parent = l_ReplicatedStorage_0;
            l_Sound_1:Play();
            return function() --[[ Line: 114 ]]
                -- upvalues: l_Sound_1 (copy), v12 (copy)
                l_Sound_1:Destroy();
                for _, v21 in v12 do
                    v21:Destroy();
                end;
            end;
        end, {});
    end;
    return nil;
end;