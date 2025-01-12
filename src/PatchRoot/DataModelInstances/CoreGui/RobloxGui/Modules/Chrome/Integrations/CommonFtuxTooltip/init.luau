local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_script_FirstAncestor_0.Service);
local v8 = require(l_script_FirstAncestor_0.ChromeShared.Service.LocalStore);
local v9 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_clearTimeout_0 = v9.clearTimeout;
local l_setTimeout_0 = v9.setTimeout;
local v12 = require(l_script_FirstAncestor_0.Parent.TopBar.Components.Presentation.menuIconHoveredSignal);
local v13 = require(l_script_FirstAncestor_0.Integrations.FtuxTooltipAnchor);
local function v38(v14) --[[ Line: 31 ]]
    -- upvalues: v5 (copy), l_setTimeout_0 (copy), v8 (copy), l_useLocalization_0 (copy), l_UserInputService_0 (copy), v7 (copy), l_GuiService_0 (copy), v12 (copy), l_clearTimeout_0 (copy), v13 (copy)
    local v15 = v5.useRef(nil);
    local v16, v17 = v5.useState(false);
    local v18, v19 = v5.useState(false);
    local v20 = v5.useRef(l_setTimeout_0(function() --[[ Line: 35 ]]

    end, v14.showDelay));
    local v21 = v5.useRef(l_setTimeout_0(function() --[[ Line: 36 ]]

    end, v14.dismissDelay));
    local v23 = v5.useMemo(function() --[[ Line: 38 ]]
        -- upvalues: v14 (copy), v8 (ref)
        local v22 = false;
        if v14.localStorageKey then
            v22 = v8.getValue(v14.localStorageKey) or false;
        end;
        return v22;
    end, {
        v14.localStorageKey
    });
    local v24 = v14.isIconVisible and not v23 and not v18;
    local v25 = v16 and v24;
    local v26 = l_useLocalization_0({
        headerText = v14.headerKey, 
        bodyText = v14.bodyKey
    });
    local v28 = v5.useCallback(function(v27) --[[ Line: 53 ]]
        -- upvalues: v14 (copy), v25 (copy), v19 (copy)
        if v14.onDismissed then
            v14.onDismissed(v25, v27);
        end;
        v19(true);
    end, {
        v19, 
        v25
    });
    v5.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v14 (copy), v16 (copy), v18 (copy), l_UserInputService_0 (ref), v15 (copy), v24 (copy), v28 (copy)
        local v29 = nil;
        if v14.dismissOnOutsideInput and v16 and not v18 then
            v29 = l_UserInputService_0.InputBegan:Connect(function(v30) --[[ Line: 65 ]]
                -- upvalues: v15 (ref), v24 (ref), v28 (ref)
                if (v30.UserInputType == Enum.UserInputType.Touch or v30.UserInputType == Enum.UserInputType.MouseButton1) and v15.current ~= nil then
                    local l_Position_0 = v30.Position;
                    local l_AbsolutePosition_0 = v15.current.AbsolutePosition;
                    local l_AbsoluteSize_0 = v15.current.AbsoluteSize;
                    if v24 and (l_Position_0.X < l_AbsolutePosition_0.X or l_Position_0.X > l_AbsolutePosition_0.X + l_AbsoluteSize_0.X or l_Position_0.Y < l_AbsolutePosition_0.Y or l_Position_0.Y > l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y) then
                        v28("outsideInput");
                    end;
                end;
            end);
        end;
        return function() --[[ Line: 92 ]]
            -- upvalues: v29 (ref)
            if v29 then
                v29:Disconnect();
                v29 = nil;
            end;
        end;
    end, {
        v18, 
        v16, 
        v24
    });
    v5.useEffect(function() --[[ Line: 100 ]]
        -- upvalues: v7 (ref), v24 (copy), v28 (copy), l_GuiService_0 (ref), v12 (ref)
        local v35 = {
            v7:onIntegrationActivated():connect(function() --[[ Line: 104 ]]
                -- upvalues: v24 (ref), v28 (ref)
                if v24 then
                    v28("unibarActivated");
                end;
            end), 
            v7:onIntegrationHovered():connect(function() --[[ Line: 109 ]]
                -- upvalues: v24 (ref), v28 (ref)
                if v24 then
                    v28("unibarHovered");
                end;
            end), 
            l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 114 ]]
                -- upvalues: v24 (ref), v28 (ref)
                if v24 then
                    v28("menuOpened");
                end;
            end), 
            v12:connect(function(v34) --[[ Line: 119 ]]
                -- upvalues: v24 (ref), v28 (ref)
                if v24 and v34 then
                    v28("menuIconHovered");
                end;
            end)
        };
        return function() --[[ Line: 126 ]]
            -- upvalues: v35 (copy)
            for _, v37 in v35 do
                if v37.disconnect then
                    v37:disconnect();
                elseif v37.Disconnect then
                    v37:Disconnect();
                end;
            end;
        end;
    end, {
        v7, 
        l_GuiService_0, 
        v12, 
        v24, 
        v28
    });
    v5.useEffect(function() --[[ Line: 138 ]]
        -- upvalues: l_clearTimeout_0 (ref), v20 (copy), v24 (copy), l_setTimeout_0 (ref), v17 (copy), v14 (copy)
        l_clearTimeout_0(v20.current);
        if v24 then
            v20.current = l_setTimeout_0(function() --[[ Line: 141 ]]
                -- upvalues: v24 (ref), v17 (ref)
                if v24 then
                    v17(true);
                end;
            end, v14.showDelay);
        end;
    end, {
        v24, 
        v20
    });
    v5.useEffect(function() --[[ Line: 150 ]]
        -- upvalues: l_clearTimeout_0 (ref), v21 (copy), v16 (copy), l_setTimeout_0 (ref), v28 (copy), v14 (copy)
        l_clearTimeout_0(v21.current);
        if v16 then
            v21.current = l_setTimeout_0(function() --[[ Line: 153 ]]
                -- upvalues: v28 (ref)
                v28("timeout");
            end, v14.dismissDelay);
        end;
    end, {
        v16, 
        v21
    });
    v5.useEffect(function() --[[ Line: 159 ]]
        -- upvalues: v25 (copy), v14 (copy), v8 (ref)
        if v25 and v14.localStorageKey then
            v8.storeForLocalPlayer(v14.localStorageKey, true);
        end;
    end, {
        v25, 
        v14.localStorageKey
    });
    return v5.createElement(v13, {
        ref = v15, 
        bodyText = v26.bodyText, 
        headerText = v26.headerText, 
        shouldShowTooltip = v25
    });
end;
local v41 = {
    showDelay = 3000, 
    dismissDelay = 5000, 
    onDismissed = function(_, _) --[[ Line: 190 ]] --[[ Name: onDismissed ]]

    end
};
return function(v42) --[[ Line: 193 ]]
    -- upvalues: v6 (copy), v41 (copy), v5 (copy), v38 (copy)
    local v43 = v6.Dictionary.union(v41, v42);
    return v5.createElement(v38, v43);
end;