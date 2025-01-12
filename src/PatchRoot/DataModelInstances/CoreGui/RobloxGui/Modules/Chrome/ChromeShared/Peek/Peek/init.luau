local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChromeShared");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.ReactOtter);
local v4 = require(l_CorePackages_0.Packages.ReactUtils);
local v5 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.Foundation);
local v8 = require(l_script_FirstAncestor_0.Service);
local v9 = require(l_script_FirstAncestor_0.Peek.IntegrationRow);
local v10 = require(l_script_FirstAncestor_0.Hooks.useChromePeekId);
local v11 = require(l_script_FirstAncestor_0.Hooks.useChromePeekItems);
local _ = require(l_script_FirstAncestor_0.Service.Types);
local v13 = require(l_script_FirstAncestor_0.Service.ViewportUtil);
local v14 = require(l_script_FirstAncestor_0.Parent.Integrations.MusicUtility.shouldUseSmallPeek);
local l_useMusicPeek_0 = v5.useMusicPeek;
local l_usePrevious_0 = v4.usePrevious;
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
local l_useCallback_0 = v2.useCallback;
local v20 = require(l_script_FirstAncestor_0.Parent.Flags.GetFFlagEnableSongbirdPeek);
local l_GetFFlagChromeCentralizedConfiguration_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagChromeCentralizedConfiguration;
local l_GetFFlagDecoupleChromePeekFromCoreScripts_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagDecoupleChromePeekFromCoreScripts;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_ControlState_0 = v7.Enums.ControlState;
local l_StateLayerAffordance_0 = v7.Enums.StateLayerAffordance;
if not l_GetFFlagChromeCentralizedConfiguration_0() then
    configurePeek = function() --[[ Line: 40 ]] --[[ Name: configurePeek ]]
        -- upvalues: v20 (copy), v8 (copy)
        if v20() then
            v8:configurePeek("music_peek", {
                integrations = {
                    "music_icon", 
                    "peek_track_details", 
                    "peek_close"
                }
            });
            v8:configurePeek("music_peek_portrait", {
                integrations = {
                    "music_icon", 
                    "peek_track_details", 
                    "peek_close"
                }
            });
        end;
    end;
    configurePeek();
end;
local v26 = {
    damping = 20, 
    mass = 1, 
    stiffness = 100
};
local function _(v27, v28, v29) --[[ Line: 68 ]] --[[ Name: lerp ]]
    return v27 + (v28 - v27) * v29;
end;
if l_GetFFlagDecoupleChromePeekFromCoreScripts_0() then
    v14 = function() --[[ Line: 74 ]] --[[ Name: shouldUseSmallPeek ]]
        -- upvalues: v13 (copy)
        local v31 = v13.isSmallTouchScreen();
        return v13.mobileDevice:get() and v31;
    end;
end;
return function(v32) --[[ Line: 87 ]] --[[ Name: Peek ]]
    -- upvalues: l_useStyle_0 (copy), l_useRef_0 (copy), v11 (copy), v10 (copy), l_usePrevious_0 (copy), l_useCallback_0 (copy), v3 (copy), l_ControlState_0 (copy), v8 (copy), l_useEffect_0 (copy), v26 (copy), l_useMusicPeek_0 (copy), v14 (ref), v2 (copy), v7 (copy), l_StateLayerAffordance_0 (copy), v9 (copy)
    local v33 = l_useStyle_0();
    local v34 = l_useRef_0(nil);
    local v35 = v11();
    local v36 = v10();
    local v37 = l_usePrevious_0(v36);
    local v39 = l_useCallback_0(function(v38) --[[ Line: 94 ]]
        -- upvalues: v34 (copy)
        if v38 == 0 then
            v34.current = nil;
        end;
    end, {});
    local v40, v41 = v3.useAnimatedBinding(0, v39);
    local v43 = l_useCallback_0(function(v42) --[[ Line: 102 ]]
        -- upvalues: l_ControlState_0 (ref), v8 (ref)
        if v42 == l_ControlState_0.Pressed or v42 == l_ControlState_0.Hover then
            v8:lockCurrentPeek();
            return;
        else
            v8:unlockCurrentPeek();
            return;
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 110 ]]
        -- upvalues: v36 (copy), v37 (copy), v35 (copy), v34 (copy), v41 (copy), v3 (ref), v26 (ref)
        if v36 ~= v37 then
            if v35 and #v35 > 0 and not v34.current then
                v34.current = v35;
                v41(v3.spring(1, v26));
                return;
            else
                v41(v3.spring(0, v26));
            end;
        end;
    end, {
        v36, 
        v37, 
        v35
    });
    l_useMusicPeek_0(v8, v14());
    if v34.current then
        return v2.createElement(v7.View, {
            Size = UDim2.fromScale(1, 1), 
            LayoutOrder = v32.layoutOrder, 
            stateLayer = {
                affordance = l_StateLayerAffordance_0.None
            }, 
            onStateChanged = v43
        }, {
            PeekContainer = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                Position = v40:map(function(v44) --[[ Line: 134 ]]
                    return UDim2.fromScale(0, -2 + 2 * v44);
                end), 
                BackgroundTransparency = 1, 
                SelectionGroup = true, 
                SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorRight = Enum.SelectionBehavior.Stop
            }, {
                Layout = v2.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                PeekPill = v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.X, 
                    Size = UDim2.fromScale(0, 1), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v33.Theme.BackgroundUIContrast.Color, 
                    BackgroundTransparency = v33.Theme.BackgroundUIContrast.Transparency * v33.Settings.PreferredTransparency
                }, {
                    UICorner = v2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, v33.Tokens.Global.Size_100)
                    }), 
                    IntegrationRow = v2.createElement(v9, {
                        integrations = v34.current
                    })
                })
            })
        });
    else
        return nil;
    end;
end;