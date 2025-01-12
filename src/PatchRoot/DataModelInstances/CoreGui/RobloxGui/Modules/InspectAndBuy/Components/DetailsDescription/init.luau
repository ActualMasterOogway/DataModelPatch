local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Colors);
local v7 = require(l_Parent_0.UtilityFunctions);
local v8 = require(l_Parent_0.Flags.FFlagAssetDetailsUseAutomaticCanvasSize);
local v9 = v2.PureComponent:extend("DetailsDescription");
v9.setText = function(v10) --[[ Line: 22 ]] --[[ Name: setText ]]
    -- upvalues: v7 (copy)
    local v11 = v10.props.assetInfo or {};
    local v12 = v11.parentBundleId ~= nil;
    local v13 = v10.props.bundleInfo or {};
    if v12 then
        local v14 = v7.getBundleId(v11);
        if v13[v14] then
            v10.description = v13[v14].description or "";
            return;
        end;
    elseif v11 then
        v10.description = v11.description or "";
    end;
end;
v9.init = function(v15) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v15.description = "";
    v15.descriptionRef = v2.createRef();
end;
v9.render = function(v16) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_AppFonts_0 (copy), v6 (copy)
    v16:setText();
    local v17 = v16:calculateSize();
    return v2.createElement("TextLabel", {
        BackgroundTransparency = 1, 
        LayoutOrder = 4, 
        Size = UDim2.new(1, -20, 0, v17), 
        Text = v16.description or "", 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextSize = 16, 
        TextWrapped = true, 
        Font = l_AppFonts_0.default:getDefault(), 
        TextColor3 = v6.White, 
        [v2.Ref] = v16.descriptionRef
    });
end;
v9.calculateSize = function(v18) --[[ Line: 62 ]] --[[ Name: calculateSize ]]
    -- upvalues: l_TextService_0 (copy), l_AppFonts_0 (copy), v8 (copy)
    if v18.descriptionRef.current and v18.props.assetInfo then
        local l_Y_0 = l_TextService_0:GetTextSize(v18.description, 16, l_AppFonts_0.default:getDefault(), Vector2.new(v18.descriptionRef.current.AbsoluteSize.X, 5000)).Y;
        if not v8 then
            v18.descriptionRef.current.Parent.CanvasSize = UDim2.new(1, 0, 0, 451 + l_Y_0);
        end;
        return l_Y_0;
    else
        return;
    end;
end;
return v3.UNSTABLE_connect2(function(v20, _) --[[ Line: 77 ]]
    local l_assetId_0 = v20.detailsInformation.assetId;
    return {
        view = v20.view, 
        assetInfo = v20.assets[l_assetId_0], 
        detailsInformation = v20.detailsInformation, 
        bundleInfo = v20.bundles
    };
end)(v9);