local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Images_0 = v6.App.ImageSet.Images;
local l_IconSize_0 = v6.App.Constant.IconSize;
local v11 = require(l_Parent_0.Components.Notification);
local v12 = require(l_Parent_0.Components.Favorites);
local v13 = require(l_Parent_0.UtilityFunctions);
local v14 = require(l_Parent_0.Colors);
local v15 = require(l_Parent_0.Constants);
local v16 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v17 = require(l_Parent_0.getSelectionImageObjectRegular);
local v18 = require(l_Parent_0.Components.InspectAndBuyContext);
local v19 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v20 = l_Images_0["icons/status/premium"];
local v21 = v3.PureComponent:extend("DetailsText");
v21.init = function(v22) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy)
    v22.name = "";
    v22.creator = "";
    v22.selectedImage = v17();
end;
v21.setText = function(v23) --[[ Line: 46 ]] --[[ Name: setText ]]
    -- upvalues: v13 (copy)
    local v24 = v23.props.assetInfo or {};
    local v25 = v24.parentBundleId ~= nil;
    local v26 = v23.props.bundleInfo or {};
    if v25 then
        local v27 = v13.getBundleId(v24);
        if v26[v27] then
            v23.name = v26[v27].name or "";
            v23.creator = v26[v27].creatorName or "";
            return;
        end;
    elseif v24 then
        v23.name = v24.name or "";
        v23.creator = v24.creatorName or "";
    end;
end;
v21.render = function(v28) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: l_IconSize_0 (copy), v15 (copy), v13 (copy), v3 (copy), v18 (copy), v11 (copy), v5 (copy), v20 (copy), l_AppFonts_0 (copy), v14 (copy), v19 (copy), v7 (copy), v16 (copy), v12 (copy)
    v28:setText();
    local l_view_0 = v28.props.view;
    local l_locale_0 = v28.props.locale;
    local l_showFavoritesCount_0 = v28.props.showFavoritesCount;
    local v32 = v28.props.assetInfo or {};
    local v33 = v32.parentBundleId ~= nil;
    local v34 = v28.props.assetBundles[v32.assetId];
    local v35 = v33 and #v34 > 1;
    local v36 = v32.premiumPricing ~= nil;
    local v37 = v32.creatorHasVerifiedBadge or false;
    local v38 = v36 and l_IconSize_0.Regular + 5 or 0;
    local v39 = false;
    if v15.LayeredAssetTypes[v32.assetTypeId] ~= nil then
        v39 = v28.props.localPlayerModel and v28.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6;
    end;
    local v40 = v13.isLimited1Point0(v32);
    local v41 = nil;
    if v35 then
        v41 = v15.NotificationKeys.MultipleBundleNoticeKey;
    elseif v33 then
        v41 = v15.NotificationKeys.SingleBundleNoticeKey;
    elseif v40 then
        v41 = v15.NotificationKeys.LimitedItemNoticeKey;
    elseif v39 then
        v41 = v15.NotificationKeys.LayeredClothingOnR6Key;
    end;
    return v3.createElement(v18.Consumer, {
        render = function(v42) --[[ Line: 96 ]] --[[ Name: render ]]
            -- upvalues: l_view_0 (copy), v3 (ref), v41 (ref), v11 (ref), v36 (copy), v5 (ref), v20 (ref), l_IconSize_0 (ref), v38 (copy), v28 (copy), l_AppFonts_0 (ref), v14 (ref), v19 (ref), v7 (ref), v37 (copy), v16 (ref), l_locale_0 (copy), l_showFavoritesCount_0 (copy), v12 (ref)
            local v43 = v42[l_view_0];
            return v3.createElement("Frame", {
                Position = v43.DetailsFramePosition, 
                Size = UDim2.new(1, 0, 0, 131), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Notification = v41 and v3.createElement(v11, {
                    noticeKey = v41
                }), 
                AssetName = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -10, 0, 50), 
                    LayoutOrder = 1
                }, {
                    PremiumIcon = v36 and v3.createElement("ImageLabel", v5.Dictionary.join(v20, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_IconSize_0.Regular, 0, l_IconSize_0.Regular), 
                        ImageColor3 = Color3.new(1, 1, 1)
                    })) or nil, 
                    PlayerName = v3.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, v38, 0, 0), 
                        Size = UDim2.new(1, v38, 0, 50), 
                        LayoutOrder = 1, 
                        Text = v28.name or "", 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        TextScaled = true, 
                        TextSize = 20, 
                        Font = l_AppFonts_0.default:getBold(), 
                        TextColor3 = v14.White
                    }, {
                        UITextSizeConstraint = v3.createElement("UITextSizeConstraint", {
                            MaxTextSize = 32
                        })
                    })
                }) or v3.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -10, 0, 50), 
                    LayoutOrder = 1, 
                    Text = v28.name or "", 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextScaled = true, 
                    TextSize = 20, 
                    Font = l_AppFonts_0.default:getBold(), 
                    TextColor3 = v14.White
                }, {
                    UITextSizeConstraint = v3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 32
                    })
                }), 
                CreatorLabelContainer = if v19 then nil else v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 20)
                }, {
                    CreatorLabelWrapper = v3.createElement(v7.EmojiWrapper, {
                        emoji = if v37 then v7.emoji.verified else ""
                    }, {
                        CreatorLabel = v3.createElement("TextLabel", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1, 
                            Text = v16:FormatByKeyForLocale("InGame.InspectMenu.Label.By", l_locale_0, {
                                CREATOR = v28.creator
                            }), 
                            Font = l_AppFonts_0.default:getDefault(), 
                            TextScaled = false, 
                            TextSize = 12, 
                            TextColor3 = v14.White, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center
                        })
                    })
                }), 
                FavoriteContainer = l_showFavoritesCount_0 and v3.createElement(v12)
            });
        end
    });
end;
return v4.connect(function(v44, _) --[[ Line: 194 ]]
    local l_assetId_0 = v44.detailsInformation.assetId;
    return {
        view = v44.view, 
        locale = v44.locale, 
        assetInfo = v44.assets[l_assetId_0], 
        bundleInfo = v44.bundles, 
        assetBundles = v44.assetBundles, 
        showFavoritesCount = not v44.isSubjectToChinaPolicies
    };
end)(v21);