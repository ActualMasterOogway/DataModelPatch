local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_CorePackages_0 = game:GetService("CorePackages");
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_GridMetrics_0 = v9.App.Grid.GridMetrics;
local l_DefaultMetricsGridView_0 = v9.App.Grid.DefaultMetricsGridView;
local v12 = require(script.Parent.Parent.Parent.Parent.Constants);
local v13 = require(script.Parent.AvatarItemCard);
local l_ItemTile_0 = v9.Tile.ItemTile;
local v15 = require(script.Parent.Parent.Parent.Parent.FFlagAppendBodyPartToTitle);
local v16 = Vector2.new(20, 20);
local _ = function(v17) --[[ Line: 35 ]] --[[ Name: createObjectsFolder ]]
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "R15ArtistIntent";
    for _, v20 in v17 do
        v20.Parent = l_Folder_0;
    end;
    return {
        [1] = l_Folder_0
    };
end;
local function _(v22, v23) --[[ Line: 45 ]] --[[ Name: getPart ]]
    return (v22:FindFirstChild(v23));
end;
local function v52(v25, v26) --[[ Line: 49 ]] --[[ Name: getItems ]]
    -- upvalues: v15 (copy)
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    for _, v31 in ipairs(v25:GetChildren()) do
        if v31:IsA("Accessory") then
            if v31.AccessoryType == Enum.AccessoryType.Eyebrow then
                v28 = v31;
            elseif v31.AccessoryType == Enum.AccessoryType.Eyelash then
                v27 = v31;
            elseif v31.AccessoryType == Enum.AccessoryType.Hair then
                v29 = v31;
            end;
        end;
    end;
    local v32 = {};
    local v33 = {
        asset = v25:FindFirstChild("Head"), 
        titleText = if v15 then nil else v26 .. "'s Head", 
        partName = v15 and "Head" or nil
    };
    local v34 = {};
    local v35 = {
        v25:FindFirstChild("UpperTorso"), 
        (v25:FindFirstChild("LowerTorso"))
    };
    local l_Folder_1 = Instance.new("Folder");
    l_Folder_1.Name = "R15ArtistIntent";
    for _, v38 in v35 do
        v38.Parent = l_Folder_1;
    end;
    v34.asset = {
        [1] = l_Folder_1
    };
    v34.titleText = if v15 then nil else v26 .. "'s Torso";
    v34.partName = v15 and "Torso" or nil;
    local v39 = {};
    l_Folder_1 = {
        v25:FindFirstChild("LeftUpperArm"), 
        v25:FindFirstChild("LeftLowerArm"), 
        (v25:FindFirstChild("LeftHand"))
    };
    local l_Folder_2 = Instance.new("Folder");
    l_Folder_2.Name = "R15ArtistIntent";
    for _, v42 in l_Folder_1 do
        v42.Parent = l_Folder_2;
    end;
    v39.asset = {
        [1] = l_Folder_2
    };
    v39.titleText = if v15 then nil else v26 .. "'s Left Arm";
    v39.partName = v15 and "Left Arm" or nil;
    v35 = {};
    l_Folder_2 = {
        v25:FindFirstChild("LeftUpperLeg"), 
        v25:FindFirstChild("LeftLowerLeg"), 
        (v25:FindFirstChild("LeftFoot"))
    };
    local l_Folder_3 = Instance.new("Folder");
    l_Folder_3.Name = "R15ArtistIntent";
    for _, v45 in l_Folder_2 do
        v45.Parent = l_Folder_3;
    end;
    v35.asset = {
        [1] = l_Folder_3
    };
    v35.titleText = if v15 then nil else v26 .. "'s Left Leg";
    v35.partName = v15 and "Left Leg" or nil;
    l_Folder_1 = {};
    l_Folder_3 = {
        v25:FindFirstChild("RightUpperArm"), 
        v25:FindFirstChild("RightLowerArm"), 
        (v25:FindFirstChild("RightHand"))
    };
    local l_Folder_4 = Instance.new("Folder");
    l_Folder_4.Name = "R15ArtistIntent";
    for _, v48 in l_Folder_3 do
        v48.Parent = l_Folder_4;
    end;
    l_Folder_1.asset = {
        [1] = l_Folder_4
    };
    l_Folder_1.titleText = if v15 then nil else v26 .. "'s Right Arm";
    l_Folder_1.partName = v15 and "Right Arm" or nil;
    l_Folder_2 = {};
    l_Folder_4 = {
        v25:FindFirstChild("RightUpperLeg"), 
        v25:FindFirstChild("RightLowerLeg"), 
        (v25:FindFirstChild("RightFoot"))
    };
    local l_Folder_5 = Instance.new("Folder");
    l_Folder_5.Name = "R15ArtistIntent";
    for _, v51 in l_Folder_4 do
        v51.Parent = l_Folder_5;
    end;
    l_Folder_2.asset = {
        [1] = l_Folder_5
    };
    l_Folder_2.titleText = if v15 then nil else v26 .. "'s Right Leg";
    l_Folder_2.partName = v15 and "Right Leg" or nil;
    v6(v32, 1, v33, v34, v39, v35, l_Folder_1, l_Folder_2);
    if v28 then
        table.insert(v32, {
            asset = v28, 
            titleText = if v15 then nil else v26 .. "'s Eyebrows", 
            partName = v15 and "Eyebrows" or nil
        });
    end;
    if v27 then
        table.insert(v32, {
            asset = v27, 
            titleText = if v15 then nil else v26 .. "'s Eyelashes", 
            partName = v15 and "Eyelashes" or nil
        });
    end;
    if v29 then
        table.insert(v32, {
            asset = v29, 
            titleText = if v15 then nil else v26 .. "'s Hair", 
            partName = v15 and "Hair" or nil
        });
    end;
    return v32;
end;
return function(v53) --[[ Line: 143 ]] --[[ Name: AvatarPartGrid ]]
    -- upvalues: v8 (copy), v52 (copy), v15 (copy), v12 (copy), v13 (copy), l_ItemTile_0 (copy), l_DefaultMetricsGridView_0 (copy), l_GridMetrics_0 (copy), v16 (copy)
    local v54, v55 = v8.useState({});
    v8.useEffect(function() --[[ Line: 145 ]]
        -- upvalues: v53 (copy), v55 (copy), v52 (ref)
        if v53.humanoidModel then
            local v56 = v53.humanoidModel:Clone();
            v55((v52(v56, v53.name)));
            return;
        else
            local v57 = {};
            for v58 = 1, 6 do
                v57[v58] = {};
            end;
            v55(v57);
            return;
        end;
    end, {
        v53.humanoidModel
    });
    v8.useEffect(function() --[[ Line: 161 ]]
        -- upvalues: v54 (copy), v15 (ref), v53 (copy), v55 (copy)
        if v54[1] and v54[1].asset then
            local v59 = {};
            for v60, v61 in v54 do
                v59[v60] = {
                    asset = v61.asset, 
                    titleText = if v15 then nil else v53.name, 
                    partName = if v15 then v61.partName else nil
                };
            end;
            v55(v59);
        end;
    end, {
        v53.name
    });
    local v62 = if v53.screenSize.Y > v53.screenSize.X then v12.ItemCardWidthPortrait else v12.ItemCardWidthLandscape;
    local v64 = v8.useCallback(function(v63) --[[ Line: 180 ]]
        -- upvalues: v8 (ref), v13 (ref), v15 (ref), v53 (copy), v62 (copy), l_ItemTile_0 (ref)
        if v63.asset then
            return v8.createElement(v13, {
                asset = v63.asset, 
                titleText = if v15 then nil else v63.titleText, 
                bodyName = if v15 then v53.name else nil, 
                partName = if v15 then v63.partName else nil, 
                viewportSize = v62
            });
        else
            return v8.createElement(l_ItemTile_0);
        end;
    end, {
        v62, 
        if v15 then v53.name else nil
    });
    return v8.createElement("Frame", {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v53.LayoutOrder, 
        BackgroundTransparency = 1
    }, {
        Grid = v8.createElement(l_DefaultMetricsGridView_0, {
            getItemHeight = function(v65) --[[ Line: 203 ]] --[[ Name: getItemHeight ]]
                return v65 * 1.3333333333333333;
            end, 
            getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter({
                minimumItemsPerRow = 2, 
                minimumItemWidth = v62
            }), 
            renderItem = v64, 
            itemPadding = v16, 
            items = v54
        })
    });
end;