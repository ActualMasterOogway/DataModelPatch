local l_AssetService_0 = game:GetService("AssetService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("QRCodeDisplay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Dash);
local v5 = require(script.Parent.drawImage);
local v6 = require(script.Parent.generatePixels);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagQrCodeDrawToEditableImage);
local v8 = {
    backgroundColor3 = Color3.fromRGB(255, 255, 255), 
    backgroundTransparency = 0, 
    pixelColor3 = Color3.fromRGB(0, 0, 0), 
    pixelTransparency = 0, 
    sideLength = 200
};
local function _(v9, v10) --[[ Line: 41 ]] --[[ Name: getQrCodeImageSize ]]
    if not v10 then
        return v9;
    else
        assert(type(v10) == "number", "rotation must be a number");
        if v10 % 90 == 0 then
            return v9;
        else
            local v11 = math.rad(v10);
            return (math.round(v9 / (math.sin(v11) + math.cos(v11))));
        end;
    end;
end;
return function(v13) --[[ Line: 56 ]]
    -- upvalues: v4 (copy), v8 (copy), v7 (copy), v3 (copy), l_AssetService_0 (copy), v5 (copy), v6 (copy)
    local v14 = v4.join(v8, v13);
    local v15 = nil;
    if v7 then
        local v16, v17 = v3.useState(nil);
        local v18 = v3.createRef();
        local l_sideLength_0 = v14.sideLength;
        local l_qrCodeRotation_0 = v14.qrCodeRotation;
        local v21;
        if not l_qrCodeRotation_0 then
            v21 = l_sideLength_0;
        else
            assert(type(l_qrCodeRotation_0) == "number", "rotation must be a number");
            if l_qrCodeRotation_0 % 90 == 0 then
                v21 = l_sideLength_0;
            else
                local v22 = math.rad(l_qrCodeRotation_0);
                v21 = math.round(l_sideLength_0 / (math.sin(v22) + math.cos(v22)));
            end;
        end;
        l_sideLength_0 = Content;
        v3.useEffect(function() --[[ Line: 69 ]]
            -- upvalues: v18 (copy), v21 (copy), l_AssetService_0 (ref), v17 (copy), l_sideLength_0 (copy), v5 (ref), v14 (copy)
            if not v18.current or v18.current.Size.X ~= v21 then
                v18.current = l_AssetService_0:CreateEditableImage({
                    Size = Vector2.new(v21, v21)
                });
                v17(l_sideLength_0.fromObject(v18.current));
            end;
            v5(v18.current, v21, v14.qrCodeMatrix, v14.pixelColor3, v14.pixelTransparency);
        end, {
            v21, 
            v14.qrCodeMatrix, 
            v14.pixelColor3, 
            v14.pixelTransparency
        });
        v15 = {
            ImageLabel = v3.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                ImageContent = v16, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Rotation = v14.qrCodeRotation, 
                Size = UDim2.fromOffset(v21, v21)
            })
        };
    else
        v15 = v6(v14);
    end;
    return v3.createElement("Frame", {
        BackgroundColor3 = v14.backgroundColor3, 
        BackgroundTransparency = v14.backgroundTransparency, 
        BorderSizePixel = 0, 
        Size = UDim2.fromOffset(v14.sideLength, v14.sideLength)
    }, v15);
end;