local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_Icon_0 = v3.Icon;
local l_Radius_0 = v3.Enums.Radius;
local l_Skeleton_0 = v3.Skeleton;
local l_View_0 = v3.View;
local v8 = require(l_Parent_0.Hooks.useSafeZoneOffsets);
return function(v9) --[[ Line: 26 ]]
    -- upvalues: v8 (copy), v2 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Icon_0 (copy)
    local v10 = v8();
    return v2.createElement(l_View_0, {
        BackgroundTransparency = 1, 
        LayoutOrder = v9.layoutOrder, 
        Size = UDim2.new(1, 0, 0, v9.screenSizeYWithInsets)
    }, {
        ContentFeedImage = v2.createElement(l_Skeleton_0, {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1
        }), 
        FeedPlayerActions = v2.createElement(l_View_0, {
            tag = "auto-y anchor-bottom-center position-bottom-center bg-action-subtle size-full-0 col align-x-left align-y-bottom", 
            ZIndex = 2
        }, {
            InfoFrame = v2.createElement(l_View_0, {
                tag = "align-x-left align-y-bottom padding-xlarge row position-bottom-center size-full-0 items-end bg-action-subtle anchor-bottom-center auto-y gap-medium items-center", 
                LayoutOrder = 1
            }, {
                CreatorThumbnail = v2.createElement(l_Skeleton_0, {
                    radius = l_Radius_0.Circle, 
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(30, 30)
                }), 
                CreatorName = v2.createElement(l_Skeleton_0, {
                    LayoutOrder = 2, 
                    Size = UDim2.fromOffset(160, 16)
                })
            }), 
            ExperienceInfo = v2.createElement(l_View_0, {
                tag = "bg-surface-100 auto-y size-full-0 row align-x-left align-y-center gap-small", 
                LayoutOrder = 2
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 20), 
                    PaddingRight = UDim.new(0, 20), 
                    PaddingTop = UDim.new(0, 20), 
                    PaddingBottom = UDim.new(0, 20 + v10.bottom)
                }), 
                ExperienceThumbnail = v2.createElement(l_Skeleton_0, {
                    radius = l_Radius_0.Medium, 
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(40, 40)
                }), 
                ExperienceMetadata = v2.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "auto-y bg-action-subtle grow col align-x-left align-y-center gap-xsmall"
                }, {
                    ExperienceNameShimmerPanel = v2.createElement(l_Skeleton_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(160, 16)
                    }), 
                    ExperienceRatingShimmerPanel = v2.createElement(l_Skeleton_0, {
                        LayoutOrder = 2, 
                        Size = UDim2.fromOffset(160, 16)
                    })
                }), 
                JoinCTAContainer = v2.createElement(l_View_0, {
                    LayoutOrder = 3, 
                    tag = "bg-action-emphasis size-2000-1000 radius-medium", 
                    isDisabled = true
                }, {
                    PlayIcon = v2.createElement(l_Icon_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        name = "icons/common/play", 
                        Position = UDim2.fromScale(0.5, 0.5)
                    })
                })
            })
        })
    });
end;