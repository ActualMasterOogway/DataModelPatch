local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_Parent_0.Components.AssetCard);
local v8 = require(l_Parent_0.Components.InspectAndBuyContext);
local l_ShimmerPanel_0 = v6.App.Loading.ShimmerPanel;
local v10 = require(l_Parent_0.Actions.SetAssetFromBundleInfo);
local v11 = v3.PureComponent:extend("AssetList");
v11.calculateCanvasSize = function(v12, v13, v14, v15) --[[ Line: 21 ]] --[[ Name: calculateCanvasSize ]]
    local l_current_0 = v12.gridFrameRef.current;
    local l_view_0 = v12.props.view;
    local v18 = nil;
    v18 = v12.props.views[l_view_0];
    if l_current_0 then
        local v19 = v18.TopSizeY + 15;
        local v20 = math.ceil(v14 / v13) * (v15 + 10) + v19;
        l_current_0.Parent.CanvasSize = UDim2.new(1, 0, 0, v20);
    end;
end;
v11.init = function(v21) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    local l_view_1 = v21.props.view;
    local v23 = nil;
    v23 = v21.props.views[l_view_1];
    v21.gridFrameRef = v3.createRef();
    v21.state = {
        assetCardSizeX = v23.AssetCardMaxSizeX, 
        assetCardSizeY = v23.AssetCardMaxSizeY
    };
end;
v11.render = function(v24) --[[ Line: 47 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v7 (copy), l_ShimmerPanel_0 (copy)
    local l_view_2 = v24.props.view;
    local v26 = nil;
    v26 = v24.props.views[l_view_2];
    local l_assets_0 = v24.props.assets;
    local l_MaxAssetCardsPerRow_0 = v26.MaxAssetCardsPerRow;
    local l_assetCardSizeX_0 = v24.state.assetCardSizeX;
    local l_assetCardSizeY_0 = v24.state.assetCardSizeY;
    local v31 = {};
    local v32 = 0;
    v31.UIGridLayout = v3.createElement("UIGridLayout", {
        CellPadding = UDim2.new(0, 10, 0, 10), 
        CellSize = UDim2.new(0, l_assetCardSizeX_0, 0, l_assetCardSizeY_0), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        FillDirectionMaxCells = l_MaxAssetCardsPerRow_0
    });
    for _, v34 in pairs(l_assets_0) do
        v32 = v32 + 1;
        v31[v34.assetId] = v3.createElement(v7, {
            assetInfo = v34, 
            assetCardSizeX = l_assetCardSizeX_0
        });
    end;
    if v32 == 0 then
        for v35 = 1, 30 do
            v31[v35] = v3.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(1, 0, 0, l_assetCardSizeX_0)
            });
        end;
    end;
    v24:calculateCanvasSize(l_MaxAssetCardsPerRow_0, v32, l_assetCardSizeY_0);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, -(2 * v26.BorderPaddingSize), 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 3, 
        [v3.Ref] = v24.gridFrameRef, 
        [v3.Change.AbsoluteSize] = function(_) --[[ Line: 93 ]]
            -- upvalues: v24 (copy)
            spawn(function() --[[ Line: 94 ]]
                -- upvalues: v24 (ref)
                v24:resize();
            end);
        end
    }, v31);
end;
v11.didMount = function(v37) --[[ Line: 101 ]] --[[ Name: didMount ]]
    v37:resize();
    v37.mounted = true;
end;
v11.updateAssetsFromBundles = function(v38) --[[ Line: 115 ]] --[[ Name: updateAssetsFromBundles ]]
    -- upvalues: v4 (copy)
    local l_bundles_0 = v38.props.bundles;
    local l_assetBundles_0 = v38.props.assetBundles;
    local l_assets_1 = v38.props.assets;
    local v42 = v4.Dictionary.keys(l_assets_1);
    if not l_bundles_0 or v4.isEmpty(l_bundles_0) then
        return;
    else
        local v43 = 1;
        for _, v45 in pairs(l_bundles_0) do
            local l_assetIds_0 = v45.assetIds;
            for v47 = 1, #l_assetIds_0 do
                local v48 = tostring(l_assetIds_0[v47]);
                if table.find(v42, v48) then
                    local v49 = l_assetBundles_0[v48] or {};
                    if #v49 == 1 or v43 == 1 and #v49 > 1 and l_assets_1[v48] and l_assets_1[v48].parentBundleId == nil then
                        v38.props.dispatchSetAssetFromBundleInfo(v48, v45);
                    end;
                end;
            end;
            v43 = v43 + 1;
        end;
        return;
    end;
end;
v11.didUpdate = function(v50, v51) --[[ Line: 155 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GuiService_0 (copy)
    if v50.props.view ~= v51.view then
        v50:resize();
    end;
    if v50.mounted and v50.props.gamepadEnabled and not v50.props.detailsInformation.viewingDetails and v50.props.visible then
        l_GuiService_0.SelectedCoreObject = v50.gridFrameRef.current:FindFirstChildWhichIsA("GuiObject");
    end;
    if v50.props.assetBundles ~= v51.assetBundles or v50.props.bundles ~= v51.bundles then
        v50:updateAssetsFromBundles();
    end;
end;
v11.willUnmount = function(v52) --[[ Line: 174 ]] --[[ Name: willUnmount ]]
    v52.mounted = false;
end;
v11.resize = function(v53) --[[ Line: 178 ]] --[[ Name: resize ]]
    local l_current_1 = v53.gridFrameRef.current;
    local l_view_3 = v53.props.view;
    local v56 = nil;
    v56 = v53.props.views[l_view_3];
    if l_current_1 then
        local l_MaxAssetCardsPerRow_1 = v56.MaxAssetCardsPerRow;
        local v58 = math.floor((l_current_1.AbsoluteSize.X - 10 * (l_MaxAssetCardsPerRow_1 - 1)) / l_MaxAssetCardsPerRow_1);
        local v59 = math.min(v58, v56.AssetCardMaxSizeX);
        local v60 = math.min(v58 / 0.68, v56.AssetCardMaxSizeY);
        if v53.state.assetCardSizeX ~= v59 or v53.state.assetCardSizeY ~= v60 then
            v53:setState({
                assetCardSizeX = v59, 
                assetCardSizeY = v60
            });
        end;
    end;
end;
return v5.connect(function(v61, _) --[[ Line: 209 ]]
    return {
        view = v61.view, 
        visible = v61.visible, 
        assets = v61.assets, 
        bundles = v61.bundles, 
        assetBundles = v61.assetBundles, 
        detailsInformation = v61.detailsInformation, 
        gamepadEnabled = v61.gamepadEnabled
    };
end, function(v63) --[[ Line: 219 ]]
    -- upvalues: v10 (copy)
    return {
        dispatchSetAssetFromBundleInfo = function(v64, v65) --[[ Line: 221 ]] --[[ Name: dispatchSetAssetFromBundleInfo ]]
            -- upvalues: v63 (copy), v10 (ref)
            v63(v10(v64, v65));
        end
    };
end)(function(v66) --[[ Line: 200 ]] --[[ Name: AssetListWrapper ]]
    -- upvalues: v3 (copy), v8 (copy), v4 (copy), v11 (copy)
    return v3.createElement(v8.Consumer, {
        render = function(v67) --[[ Line: 202 ]] --[[ Name: render ]]
            -- upvalues: v4 (ref), v66 (copy), v3 (ref), v11 (ref)
            local v68 = v4.Dictionary.join(v66, {
                views = v67
            });
            return v3.createElement(v11, v68);
        end
    });
end);