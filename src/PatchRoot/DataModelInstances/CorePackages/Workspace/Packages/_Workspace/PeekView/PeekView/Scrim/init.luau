local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v3 = require(l_Parent_0.ReactOtter);
local l_GetFFlagPeekViewContentAndSystemBarFrameJitterFixIXP_0 = require(l_Parent_0.SharedFlags).GetFFlagPeekViewContentAndSystemBarFrameJitterFixIXP;
local l_GetFFlagFixPeekViewJitter_0 = require(l_Parent_0.SharedFlags).GetFFlagFixPeekViewJitter;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
return (v1.forwardRef(function(v7, v8) --[[ Line: 20 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_GetFFlagPeekViewContentAndSystemBarFrameJitterFixIXP_0 (copy), l_useUserExperiment_0 (copy), l_GetFFlagFixPeekViewJitter_0 (copy), v1 (copy), v3 (copy)
    local v9 = l_useDesignTokens_0();
    local v10 = nil;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    if l_GetFFlagPeekViewContentAndSystemBarFrameJitterFixIXP_0() then
        v10 = l_useUserExperiment_0({
            "PlatformExcellence.QualityImprovement.App"
        }, function(v15) --[[ Line: 27 ]]
            return (v15["PlatformExcellence.QualityImprovement.App"] or {}).peekViewJitterFixEnabled;
        end);
    end;
    if l_GetFFlagFixPeekViewJitter_0() or l_GetFFlagPeekViewContentAndSystemBarFrameJitterFixIXP_0() then
        local v16, v17 = v1.useState(true);
        v11 = v16;
        v12 = v17;
        v16, v17 = v3.useAnimatedBinding(1);
        v13 = v16;
        v14 = v17;
        v1.useEffect(function() --[[ Line: 37 ]]
            -- upvalues: v14 (ref), v3 (ref), v11 (ref)
            v14(v3.spring(v11 and 0.35 or 1));
        end, {
            v11
        });
    end;
    return v1.createElement("TextButton", {
        ref = v8, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = if not not l_GetFFlagFixPeekViewJitter_0() or v10 then v13 else v9.Semantic.Color.Common.Overlay.Transparency, 
        BackgroundColor3 = v9.Semantic.Color.Common.Overlay.Color3, 
        ClipsDescendants = false, 
        Text = "", 
        AutoButtonColor = false, 
        [v1.Event.Activated] = function() --[[ Line: 52 ]]
            -- upvalues: v7 (copy), l_GetFFlagFixPeekViewJitter_0 (ref), v10 (ref), v12 (ref), v11 (ref)
            if v7.onActivated then
                v7.onActivated();
            end;
            if l_GetFFlagFixPeekViewJitter_0() or v10 then
                v12(not v11);
            end;
        end, 
        [v1.Change.AbsoluteSize] = v7.onSizeChanged
    }, v7.children);
end));