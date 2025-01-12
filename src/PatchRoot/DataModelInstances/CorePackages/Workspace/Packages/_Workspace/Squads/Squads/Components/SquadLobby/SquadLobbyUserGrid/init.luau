local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_Cryo_0 = v1.Cryo;
local l_Foundation_0 = v1.Foundation;
local l_Roact_0 = v1.Roact;
local l_dependencyArray_0 = v1.Hooks.dependencyArray;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_useLocalUserId_0 = v1.Hooks.useLocalUserId;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v12 = require(script.Parent.SquadLobbyUserCard);
local v13 = require(script.Parent.SquadLobbyUpsellCard);
return function(v14) --[[ Line: 39 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalUserId_0 (copy), v3 (copy), l_dependencyArray_0 (copy), l_useSelector_0 (copy), v12 (copy), l_Cryo_0 (copy), v13 (copy), l_Roact_0 (copy)
    local v15 = l_useTokens_0();
    local v16 = tonumber(l_useLocalUserId_0()) or 0;
    local l_Medium_0 = v15.Gap.Medium;
    local l_XLarge_0 = v15.Padding.XLarge;
    local v28, v29, v30 = v3.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v14 (copy), l_XLarge_0 (copy), l_Medium_0 (copy)
        if v14.containerSize.Y == 0 or v14.containerSize.X == 0 then
            return Vector2.new(0, 0), 0, 0;
        else
            local v19 = v14.containerSize.X - l_XLarge_0 * 2;
            local v20 = v19 / v14.containerSize.Y;
            local v21 = math.max(#v14.users, 2);
            local v22 = v21 <= 3 and v20 > 1.75 and v21 * 120 + (v21 - 1) * l_Medium_0 <= v19;
            local v23 = nil;
            local v24 = nil;
            if v22 then
                v23 = 1;
                v24 = v21;
            elseif v21 <= 3 then
                v23 = v21;
                v24 = 1;
            else
                v23 = math.ceil(v21 / 2);
                v24 = 2;
            end;
            local v25 = math.min(v23, (math.clamp(math.floor((v14.containerSize.Y + l_Medium_0) / (120 + l_Medium_0)), 1, 3)));
            local v26 = (v19 + l_Medium_0) / v24 - l_Medium_0;
            local v27 = (v14.containerSize.Y + l_Medium_0) / v25 - l_Medium_0;
            return Vector2.new(v26, v27), v23, v24;
        end;
    end, l_dependencyArray_0(l_Medium_0, v14.containerSize, #v14.users, l_XLarge_0));
    local v32 = v3.useCallback(function(v31) --[[ Line: 88 ]]
        return v31.Squad.UserBlocking.isBlockedByMe;
    end, {});
    local v33 = l_useSelector_0(v32);
    local v47 = v3.useMemo(function() --[[ Line: 95 ]]
        -- upvalues: v28 (copy), v3 (ref), v12 (ref), v33 (copy), v14 (copy), l_Cryo_0 (ref), v16 (copy), v13 (ref), v29 (copy), v30 (copy), l_Medium_0 (copy)
        if v28.X == 0 or v28.Y == 0 then
            return {};
        else
            local v34 = {};
            local function v38(v35, v36, v37) --[[ Line: 101 ]]
                -- upvalues: v3 (ref), v12 (ref), v28 (ref), v33 (ref), v14 (ref)
                return v3.createElement(v12, {
                    size = UDim2.fromOffset(v28.X, v28.Y), 
                    isBlocked = v33[tostring(v36.userId)], 
                    isConnecting = v37, 
                    layoutOrder = v35, 
                    onActivated = v14.onUserCardActivated, 
                    user = v36, 
                    isInExperience = v14.isInExperience
                });
            end;
            if not (l_Cryo_0.List.findWhere(v14.users, function(v39) --[[ Line: 113 ]]
                -- upvalues: v16 (ref)
                return v39.userId == v16;
            end) ~= nil) and v16 then
                table.insert(v34, v38(0, {
                    userId = v16
                }, true));
            end;
            for v40, v41 in v14.users do
                table.insert(v34, v38(v40, v41, false));
            end;
            if #v34 == 1 then
                table.insert(v34, (v3.createElement(v13, {
                    size = UDim2.fromOffset(v28.X, v28.Y), 
                    layoutOrder = #v14.users + 1, 
                    navigateToHomePage = v14.navigateToHomePage, 
                    navigateToSquadInviteFriends = v14.navigateToSquadInviteFriends
                })));
            end;
            local v42 = {};
            for v43 = 1, v29 do
                local v44 = {};
                for v45 = 1, v30 do
                    local v46 = (v43 - 1) * v30 + v45;
                    if v34[v46] then
                        v44["Card" .. v46] = v34[v46];
                    end;
                end;
                v44.UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, l_Medium_0)
                });
                v42["Row" .. v43] = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v28.Y), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v43
                }, v44);
            end;
            return v42;
        end;
    end, l_dependencyArray_0(v28, l_Medium_0, v33, v16, v30, v29, v14.navigateToHomePage, v14.navigateToSquadInviteFriends, v14.onUserCardActivated, v14.users));
    v47.UIListLayout = v3.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, l_Medium_0)
    });
    v47.UIPadding = v3.createElement("UIPadding", {
        PaddingBottom = v14.paddingBottom, 
        PaddingLeft = UDim.new(0, l_XLarge_0), 
        PaddingRight = UDim.new(0, l_XLarge_0)
    });
    return l_Roact_0.createFragment(v47);
end;