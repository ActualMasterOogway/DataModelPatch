local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local v1 = require(l_CommonUtils_0:WaitForChild("FlagUtil")).getUserFlag("UserRaycastPerformanceImprovements");
local v2 = RaycastParams.new();
v2.FilterType = Enum.RaycastFilterType.Exclude;
local v3 = {
    spacing = 8, 
    image = "rbxasset://textures/Cursors/Gamepad/Pointer.png", 
    imageSize = Vector2.new(2, 2)
};
local v4 = {};
local v5 = {};
local l_Model_0 = Instance.new("Model");
l_Model_0.Name = "PathDisplayPoints";
local l_Part_0 = Instance.new("Part");
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.Transparency = 1;
l_Part_0.Name = "PathDisplayAdornee";
l_Part_0.CFrame = CFrame.new(0, 0, 0);
l_Part_0.Parent = l_Model_0;
local v8 = {};
local v9 = 30;
for v10 = 1, v9 do
    local l_ImageHandleAdornment_0 = Instance.new("ImageHandleAdornment");
    l_ImageHandleAdornment_0.Archivable = false;
    l_ImageHandleAdornment_0.Adornee = l_Part_0;
    l_ImageHandleAdornment_0.Image = v3.image;
    l_ImageHandleAdornment_0.Size = v3.imageSize;
    v8[v10] = l_ImageHandleAdornment_0;
end;
local function _() --[[ Line: 41 ]] --[[ Name: retrieveFromPool ]]
    -- upvalues: v8 (copy), v9 (ref)
    local v12 = v8[1];
    if not v12 then
        return nil;
    else
        local l_v8_0 = v8;
        local l_v8_1 = v8;
        local l_v9_0 = v9;
        local v16 = v8[v9];
        local v17 = nil;
        l_v8_0[1] = v16;
        l_v8_1[l_v9_0] = v17;
        v9 = v9 - 1;
        return v12;
    end;
end;
local function _(v19) --[[ Line: 52 ]] --[[ Name: returnToPool ]]
    -- upvalues: v9 (ref), v8 (copy)
    v9 = v9 + 1;
    v8[v9] = v19;
end;
local function v33(v21, _) --[[ Line: 57 ]] --[[ Name: renderPoint ]]
    -- upvalues: v9 (ref), v8 (copy), v1 (copy), v2 (copy), l_Model_0 (copy)
    if v9 == 0 then
        return nil;
    else
        local v23 = v8[1];
        local v24;
        if not v23 then
            v24 = nil;
        else
            local l_v8_2 = v8;
            local l_v8_3 = v8;
            local l_v9_1 = v9;
            local v28 = v8[v9];
            local v29 = nil;
            l_v8_2[1] = v28;
            l_v8_3[l_v9_1] = v29;
            v9 = v9 - 1;
            v24 = v23;
        end;
        if v1 then
            v2.FilterDescendantsInstances = {
                game.Players.LocalPlayer.Character, 
                workspace.CurrentCamera
            };
            v23 = workspace:Raycast(v21 + Vector3.new(0, 2, 0, 0), Vector3.new(0, -8, 0, 0), v2);
            if not v23 then
                return nil;
            else
                v24.CFrame = CFrame.lookAlong(v23.Position, v23.Normal);
                v24.Parent = l_Model_0;
                return v24;
            end;
        else
            v23 = Ray.new(v21 + Vector3.new(0, 2, 0, 0), (Vector3.new(0, -8, 0, 0)));
            local l_workspace_PartOnRayWithIgnoreList_0, v31, v32 = workspace:FindPartOnRayWithIgnoreList(v23, {
                game.Players.LocalPlayer.Character, 
                workspace.CurrentCamera
            });
            if not l_workspace_PartOnRayWithIgnoreList_0 then
                return nil;
            else
                v24.CFrame = CFrame.new(v31, v31 + v32);
                v24.Parent = l_Model_0;
                return v24;
            end;
        end;
    end;
end;
v3.setCurrentPoints = function(v34) --[[ Line: 89 ]] --[[ Name: setCurrentPoints ]]
    -- upvalues: v4 (ref)
    if typeof(v34) == "table" then
        v4 = v34;
        return;
    else
        v4 = {};
        return;
    end;
end;
v3.clearRenderedPath = function() --[[ Line: 97 ]] --[[ Name: clearRenderedPath ]]
    -- upvalues: v5 (ref), v9 (ref), v8 (copy), l_Model_0 (copy)
    for _, v36 in ipairs(v5) do
        v36.Parent = nil;
        v9 = v9 + 1;
        v8[v9] = v36;
    end;
    v5 = {};
    l_Model_0.Parent = nil;
end;
v3.renderPath = function() --[[ Line: 106 ]] --[[ Name: renderPath ]]
    -- upvalues: v3 (copy), v4 (ref), v5 (ref), v33 (copy), l_Model_0 (copy)
    v3.clearRenderedPath();
    if not v4 or #v4 == 0 then
        return;
    else
        local v37 = #v4;
        local v38 = v4[v37];
        local v39 = 0;
        v5[1] = v33(v38, true);
        if not v5[1] then
            return;
        else
            while true do
                local v40 = v4[v37];
                local v41 = v4[v37 - 1];
                if v37 >= 2 then
                    local v42 = v41 - v40;
                    local l_magnitude_0 = v42.magnitude;
                    if l_magnitude_0 < v39 then
                        v39 = v39 - l_magnitude_0;
                        v37 = v37 - 1;
                    else
                        local v44 = v40 + v42.unit * v39;
                        local v45 = v33(v44, false);
                        if v45 then
                            v5[#v5 + 1] = v45;
                        end;
                        v39 = v39 + v3.spacing;
                    end;
                else
                    break;
                end;
            end;
            l_Model_0.Parent = workspace.CurrentCamera;
            return;
        end;
    end;
end;
return v3;