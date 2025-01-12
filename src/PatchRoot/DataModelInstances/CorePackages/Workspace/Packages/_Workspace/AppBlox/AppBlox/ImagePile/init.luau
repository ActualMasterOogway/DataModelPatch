local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.SharedFlags);
local l_Core_0 = v4.Core;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_Core_0.Style.useStyle;
local v9 = l_Logger_0:new(script.Name);
return function(v10) --[[ Line: 23 ]] --[[ Name: ImagePile ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), v1 (copy), v9 (copy), v5 (copy), l_ImageSetLabel_0 (copy)
    local l_Tokens_0 = l_useStyle_0().Tokens;
    local v12 = v3.useMemo(function() --[[ Line: 27 ]]
        -- upvalues: l_Tokens_0 (copy)
        return {
            imageBorderColor = l_Tokens_0.Global.Color.White.Color3, 
            imageBorderThickness = l_Tokens_0.Global.Stroke_200
        };
    end, {
        l_Tokens_0
    });
    local v13 = v1.Dictionary.union(v12, v10);
    local v14 = v3.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: l_Tokens_0 (copy)
        return {
            [1] = {
                Attribute1 = {
                    AnchorPoint = Vector2.new(0, 0), 
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.fromOffset(l_Tokens_0.Global.Size_500, l_Tokens_0.Global.Size_500), 
                    ZIndex = 1
                }
            }, 
            [2] = {
                Attribute1 = {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.fromScale(0, 1), 
                    Size = UDim2.fromOffset(l_Tokens_0.Global.Size_350, l_Tokens_0.Global.Size_350), 
                    ZIndex = 2
                }, 
                Attribute2 = {
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.fromScale(1, 0), 
                    Size = UDim2.fromOffset(l_Tokens_0.Global.Size_350, l_Tokens_0.Global.Size_350), 
                    ZIndex = 1
                }
            }
        };
    end, {
        l_Tokens_0
    });
    local v17 = v3.useCallback(function(v15, v16) --[[ Line: 63 ]]
        -- upvalues: v14 (copy)
        return v14[math.min(v15, 2)]["Attribute" .. v16];
    end, {
        v14
    });
    local v22 = v3.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v13 (copy), v9 (ref), v17 (copy), v5 (ref), v3 (ref), l_ImageSetLabel_0 (ref)
        local v18 = {};
        for v19, v20 in v13.images do
            if v19 > 2 then
                v9:warning("More than 2 images provided but only the first 2 will be shown.");
                return v18;
            else
                local v21 = v17(#v13.images, v19);
                v20.AnchorPoint = v21.AnchorPoint;
                v20.Position = v21.Position;
                v20.Size = v21.Size;
                v20.ZIndex = v21.ZIndex;
                if v5.GetFFlagUIBloxFoundationProvider() then
                    v18[tostring(v19)] = v3.createElement(l_ImageSetLabel_0, v20, {
                        UICorner = v3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }), 
                        UIStroke = v3.createElement("UIStroke", {
                            Color = v13.imageBorderColor, 
                            Thickness = v13.imageBorderThickness, 
                            Transparency = 0
                        })
                    });
                else
                    v20.key = v19;
                    table.insert(v18, (v3.createElement(l_ImageSetLabel_0, v20, {
                        UICorner = v3.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }), 
                        UIStroke = v3.createElement("UIStroke", {
                            Color = v13.imageBorderColor, 
                            Thickness = v13.imageBorderThickness, 
                            Transparency = 0
                        })
                    })));
                end;
            end;
        end;
        return v18;
    end, {
        v13.images
    });
    if #v13.images == 0 or not v5.GetFFlagUIBloxFoundationProvider() and #v22 == 0 then
        v9:warning("Cannot have empty list of images");
        return nil;
    else
        return v3.createElement("Frame", {
            [v3.Tag] = "data-testid=ImagePile", 
            BackgroundTransparency = 1, 
            Name = "ImagePile", 
            Size = UDim2.fromOffset(l_Tokens_0.Global.Size_500, l_Tokens_0.Global.Size_500)
        }, v22);
    end;
end;