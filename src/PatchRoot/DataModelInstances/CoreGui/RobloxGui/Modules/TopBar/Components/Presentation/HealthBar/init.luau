local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Constants);
local l_RobloxGui_1 = l_CoreGui_0:WaitForChild("RobloxGui");
local v9 = require(l_RobloxGui_1.Modules.TenFootInterface);
local v10 = require(l_Parent_0.Flags.GetFFlagEnableChromeBackwardsSignalAPI)();
local v11 = require(l_Parent_0.Actions.SetKeepOutArea);
local v12 = require(l_Parent_0.Actions.RemoveKeepOutArea);
local l_GetFFlagFixChromeReferences_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixChromeReferences;
local l_Chrome_0 = l_Parent_0.Parent.Chrome;
local v15 = require(l_Chrome_0.Enabled);
local v16 = if l_GetFFlagFixChromeReferences_0() then if v15() then require(l_Chrome_0.Service) else nil else if v15 then require(l_Chrome_0.Service) else nil;
local v17 = v15();
local v18 = UDim2.new(0, 80, 0, 6);
if v17 then
    v18 = UDim2.new(0, 125, 0, 20);
end;
local v19 = UDim2.new(0, 50, 0, 16);
local v20 = UDim2.new(0, 80, 0, 20);
local v21 = UDim2.new(0, 220, 0, 16);
local v22 = v3.PureComponent:extend("HealthBar");
v22.validateProps = v5.strictInterface({
    layoutOrder = v5.optional(v5.integer), 
    screenSize = v5.Vector2, 
    healthEnabled = v5.boolean, 
    health = v5.number, 
    maxHealth = v5.number, 
    setKeepOutArea = v5.callback, 
    removeKeepOutArea = v5.callback
});
local function _(v23) --[[ Line: 59 ]] --[[ Name: color3ToVector3 ]]
    return (Vector3.new(v23.r, v23.g, v23.b));
end;
local v25 = {};
local l_HealthRedColor_0 = v7.HealthRedColor;
v25[Vector3.new(l_HealthRedColor_0.r, l_HealthRedColor_0.g, l_HealthRedColor_0.b)] = 0.1;
l_HealthRedColor_0 = v7.HealthYellowColor;
v25[Vector3.new(l_HealthRedColor_0.r, l_HealthRedColor_0.g, l_HealthRedColor_0.b)] = 0.5;
l_HealthRedColor_0 = v7.HealthGreenColor;
v25[Vector3.new(l_HealthRedColor_0.r, l_HealthRedColor_0.g, l_HealthRedColor_0.b)] = 0.8;
local l_HealthRedColor_1 = v7.HealthRedColor;
l_HealthRedColor_0 = v7.HealthGreenColor;
local function v36(v28) --[[ Line: 73 ]] --[[ Name: getHealthBarColor ]]
    -- upvalues: l_HealthRedColor_1 (copy), l_HealthRedColor_0 (copy), v25 (copy)
    if v28 <= 0.1 then
        return l_HealthRedColor_1;
    elseif v28 >= 0.8 then
        return l_HealthRedColor_0;
    else
        local v29 = Vector3.new(0, 0, 0, 0);
        local v30 = 0;
        for v31, v32 in pairs(v25) do
            local v33 = v28 - v32;
            if v33 == 0 then
                return Color3.new(v31.x, v31.y, v31.z);
            else
                local v34 = 1 / (v33 * v33);
                v29 = v29 + v34 * v31;
                v30 = v30 + v34;
            end;
        end;
        local v35 = v29 / v30;
        return Color3.new(v35.x, v35.y, v35.z);
    end;
end;
v22.init = function(v37) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v16 (copy)
    v37.rootRef = v3.createRef();
    if v16 then
        v37:setState({
            chromeMenuOpen = v16:status():get() == v16.MenuStatus.Open
        });
    end;
end;
v22.didMount = function(v38) --[[ Line: 107 ]] --[[ Name: didMount ]]
    -- upvalues: v17 (copy), v16 (copy)
    if not v17 and v16 then
        v38.chromeMenuStatusConn = v16:status():connect(function() --[[ Line: 110 ]]
            -- upvalues: v38 (copy), v16 (ref)
            v38:setState({
                chromeMenuOpen = v16:status():get() == v16.MenuStatus.Open
            });
        end);
    end;
end;
v22.onUnmount = function(v39) --[[ Line: 119 ]] --[[ Name: onUnmount ]]
    -- upvalues: v17 (copy)
    if not v17 and v39.chromeMenuStatusConn then
        v39.chromeMenuStatusConn:Disconnect();
        v39.chromeMenuStatusConn = nil;
    end;
end;
v22.render = function(v40) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v19 (copy), v20 (copy), v18 (ref), v9 (copy), v21 (copy), v7 (copy), v10 (copy), v36 (copy), v3 (copy), v15 (copy)
    local v41 = v40.props.healthEnabled and v40.props.health < v40.props.maxHealth;
    if not v17 then
        v41 = v41 and not v40.state.chromeMenuOpen;
    end;
    local v42 = 1;
    if v40.props.isDead then
        v42 = 0;
    elseif v40.props.maxHealth > 0 then
        v42 = v40.props.health / v40.props.maxHealth;
    end;
    local v43 = nil;
    if v17 then
        v43 = if v40.props.screenSize.X <= 320 then v19 else if v40.props.screenSize.X <= 393 then v20 else v18;
        if v9:IsEnabled() then
            v43 = v21;
        end;
    else
        v43 = v18;
        if v9:IsEnabled() then
            v43 = v21;
        end;
    end;
    local v44 = 4;
    if v9:IsEnabled() then
        v44 = 0;
    end;
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    if v17 then
        v45 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png";
        v46 = "rbxasset://textures/ui/TopBar/HealthBarTV.png";
        v47 = Rect.new(8, 8, 9, 9);
    else
        v45 = "rbxasset://textures/ui/TopBar/HealthBarBase.png";
        v46 = "rbxasset://textures/ui/TopBar/HealthBar.png";
        v47 = Rect.new(3, 3, 4, 4);
        if v9:IsEnabled() then
            v45 = "rbxasset://textures/ui/TopBar/HealthBarBaseTV.png";
            v46 = "rbxasset://textures/ui/TopBar/HealthBarTV.png";
            v47 = Rect.new(8, 8, 9, 9);
        end;
    end;
    local function v49(v48) --[[ Line: 187 ]]
        -- upvalues: v17 (ref), v41 (ref), v40 (copy), v7 (ref)
        if not v17 then
            if v41 and v48 then
                v40.props.setKeepOutArea(v7.HealthBarKeepOutAreaId, v48.AbsolutePosition, v48.AbsoluteSize);
                return;
            else
                v40.props.removeKeepOutArea(v7.HealthBarKeepOutAreaId);
            end;
        end;
    end;
    if v10 and v40.rootRef.current then
        local l_current_0 = v40.rootRef.current;
        if not v17 then
            if v41 and l_current_0 then
                v40.props.setKeepOutArea(v7.HealthBarKeepOutAreaId, l_current_0.AbsolutePosition, l_current_0.AbsoluteSize);
            else
                v40.props.removeKeepOutArea(v7.HealthBarKeepOutAreaId);
            end;
        end;
    end;
    local v51 = v36(v42);
    return v3.createElement("Frame", {
        AnchorPoint = if v17 then Vector2.new(1, 0) else nil, 
        Position = if v17 then UDim2.new(1, 0, 0, 0) else nil, 
        Visible = v41, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(v43.X, UDim.new(1, 0)), 
        LayoutOrder = v40.props.layoutOrder, 
        [v3.Change.AbsoluteSize] = if v10 then v49 else nil, 
        [v3.Change.AbsolutePosition] = if v10 then v49 else nil, 
        [v3.Ref] = v40.rootRef
    }, {
        Padding = not v15 and v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v44)
        }) or nil, 
        HealthBar = v3.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v45, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v47, 
            Size = v43, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5)
        }, {
            Fill = v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = v46, 
                ImageColor3 = v51, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v47, 
                Size = UDim2.fromScale(v42, 1)
            })
        })
    });
end;
return v4.UNSTABLE_connect2(function(v52) --[[ Line: 240 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v52.displayOptions.screenSize, 
        health = v52.health.currentHealth, 
        maxHealth = v52.health.maxHealth, 
        healthEnabled = v52.coreGuiEnabled[Enum.CoreGuiType.Health]
    };
end, function(v53) --[[ Line: 249 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v12 (copy)
    return {
        setKeepOutArea = function(v54, v55, v56) --[[ Line: 251 ]] --[[ Name: setKeepOutArea ]]
            -- upvalues: v53 (copy), v11 (ref)
            return v53(v11(v54, v55, v56));
        end, 
        removeKeepOutArea = function(v57) --[[ Line: 254 ]] --[[ Name: removeKeepOutArea ]]
            -- upvalues: v53 (copy), v12 (ref)
            return v53(v12(v57));
        end
    };
end)(v22);