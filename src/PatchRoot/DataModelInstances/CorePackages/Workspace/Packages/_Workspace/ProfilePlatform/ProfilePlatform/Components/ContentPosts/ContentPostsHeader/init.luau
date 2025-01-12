local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v4.Core.Control.Interactable;
local l_TooltipOrientation_0 = v4.App.Dialog.Enum.TooltipOrientation;
local l_withTooltip_0 = v4.App.Dialog.TooltipV2.withTooltip;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Common.TextKeys);
return function(v13) --[[ Line: 29 ]] --[[ Name: ContentPostsHeader ]]
    -- upvalues: l_useLocalization_0 (copy), v12 (copy), l_useDesignTokens_0 (copy), v3 (copy), l_withTooltip_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_Interactable_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v14 = l_useLocalization_0({
        posts = v12.PostTitle, 
        postsTooltip = v12.PostsTooltip
    });
    local v15 = l_useDesignTokens_0();
    local l_isTooltipActive_0 = v13.isTooltipActive;
    local l_Header_0 = v15.Semantic.Typography.Header;
    local l_Emphasis_0 = v15.Semantic.Color.Text.Emphasis;
    local v20 = v3.useCallback(function(_) --[[ Line: 40 ]]
        -- upvalues: v13 (copy), l_isTooltipActive_0 (copy)
        v13.setIsTooltipActive(not l_isTooltipActive_0);
    end, {
        l_isTooltipActive_0
    });
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v15.Global.Size_100), 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Title = v3.createElement("TextButton", {
            BackgroundTransparency = 1, 
            Text = v14.posts, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(0, 0, 0, 0), 
            Font = l_Header_0.Font, 
            TextSize = l_Header_0.FontSize, 
            TextTransparency = l_Emphasis_0.Transparency, 
            TextColor3 = l_Emphasis_0.Color3, 
            TextWrapped = false, 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 1, 
            [v3.Event.Activated] = v13.onActivate, 
            Selectable = true, 
            Active = true, 
            AutoButtonColor = false
        }), 
        InfoIconWithTooltip = l_withTooltip_0({
            bodyText = v14.postsTooltip
        }, {
            preferredOrientation = l_TooltipOrientation_0.Bottom, 
            guiTarget = l_CoreGui_0, 
            DisplayOrder = 100, 
            active = l_isTooltipActive_0
        }, function(v21) --[[ Line: 82 ]]
            -- upvalues: v13 (copy), v3 (ref), l_Interactable_0 (ref), v20 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v15 (copy)
            local function v23(v22) --[[ Line: 83 ]]
                -- upvalues: v13 (ref), v21 (copy)
                v13.setIsTooltipActive(false);
                v21(v22);
            end;
            return v3.createElement(l_Interactable_0, {
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.fromOffset(16, 16), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                [v3.Change.AbsolutePosition] = v23, 
                [v3.Change.AbsoluteSize] = v23, 
                [v3.Event.Activated] = v20, 
                onStateChanged = function() --[[ Line: 97 ]] --[[ Name: onStateChanged ]]

                end
            }, {
                InfoIcon = v3.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["icons/actions/info_small"], 
                    ImageColor3 = v15.Semantic.Color.Text.Emphasis.Color3, 
                    Size = UDim2.fromScale(1, 1)
                })
            });
        end)
    });
end;