local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = v4.Hooks.dependencyArray;
local l_GetFFlagFixKeepOutAreasCompatibility_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixKeepOutAreasCompatibility;
local function v24(v8, v9, v10) --[[ Line: 32 ]]
    local v11 = {};
    local l_X_0 = v8.X;
    local l_Y_0 = v8.Y;
    local l_X_1 = v9.X;
    local v15 = v9.Y - l_Y_0;
    local l_l_X_0_0 = l_X_0;
    local v17 = 0;
    for _, v19 in ipairs(v10) do
        local v20 = l_l_X_0_0 + v17;
        local v21 = v19.position.X - v20;
        table.insert(v11, {
            Position = {
                X = v20, 
                Y = l_Y_0
            }, 
            Size = {
                X = v21, 
                Y = v15
            }
        });
        l_l_X_0_0 = v19.position.X;
        v17 = v19.size.X;
    end;
    local v22 = l_l_X_0_0 + v17;
    local v23 = l_X_1 - v22;
    table.insert(v11, {
        Position = {
            X = v22, 
            Y = l_Y_0
        }, 
        Size = {
            X = v23, 
            Y = v15
        }
    });
    return v11;
end;
local function v41(v25, v26) --[[ Line: 84 ]]
    -- upvalues: l_GuiService_0 (copy), v24 (copy)
    local v27 = {};
    local v28 = {};
    for _, v30 in pairs(v26) do
        table.insert(v28, {
            id = v30.id, 
            size = v30.size, 
            position = v30.position
        });
    end;
    table.sort(v28, function(v31, v32) --[[ Line: 99 ]]
        local v33 = false;
        if v31.position.X < v32.position.X then
            v33 = v31.position.X + v31.size.X < v32.size.X + v32.position.X;
        end;
        return v33;
    end);
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    local v36 = Vector2.new(0, 0);
    local v37 = Vector2.new(v25.X, l_l_GuiService_0_GuiInset_0.Y);
    v27 = v24(v36, v37, v28);
    local v38 = nil;
    for _, v40 in ipairs(v27) do
        if not v38 or v40.Size.X > v38.Width then
            v38 = Rect.new(v40.Position.X, v40.Position.Y, v40.Position.X + v40.Size.X, v40.Position.Y + v40.Size.Y);
        end;
    end;
    return v38;
end;
local function _(v42, v43) --[[ Line: 122 ]]
    -- upvalues: v41 (copy), l_GuiService_0 (copy)
    local v44 = v41(v42, v43);
    if v44 then
        l_GuiService_0:SetTopbarInset(v44);
    end;
end;
KeepOutAreasHandler = function(_) --[[ Line: 129 ]] --[[ Name: KeepOutAreasHandler ]]
    -- upvalues: l_useSelector_0 (copy), v3 (copy), l_GetFFlagFixKeepOutAreasCompatibility_0 (copy), l_RunService_0 (copy), v41 (copy), l_GuiService_0 (copy), l_dependencyArray_0 (copy)
    local v48 = l_useSelector_0(function(v47) --[[ Line: 130 ]]
        return v47.displayOptions.screenSize;
    end);
    local v50 = l_useSelector_0(function(v49) --[[ Line: 134 ]]
        return v49.displayOptions.keepOutAreas;
    end);
    v3.useEffect(function() --[[ Line: 138 ]]
        -- upvalues: l_GetFFlagFixKeepOutAreasCompatibility_0 (ref), l_RunService_0 (ref), v48 (copy), v50 (copy), v41 (ref), l_GuiService_0 (ref)
        if l_GetFFlagFixKeepOutAreasCompatibility_0() or game:GetEngineFeature("InGameChromeSignalAPI") and l_RunService_0:IsStudio() then
            local v51 = v41(v48, v50);
            if v51 then
                l_GuiService_0:SetTopbarInset(v51);
            end;
        end;
    end, l_dependencyArray_0(v48, v50));
end;
return KeepOutAreasHandler;