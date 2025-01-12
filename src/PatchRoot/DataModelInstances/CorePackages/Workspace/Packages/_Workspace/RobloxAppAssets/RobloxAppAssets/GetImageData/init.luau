local l_GuiService_0 = game:GetService("GuiService");
local v1 = require(script.Parent.GetImageSetData);
local v2 = require(script.Parent.GetImageSetPathPattern);
local l_Images_0 = require(script.Parent.Parent.FoundationImages).Images;
local v4 = game:DefineFastFlag("UseFoundationImageSetScale", false);
local _ = require(script.Parent.types);
return function(v6, v7) --[[ Line: 13 ]] --[[ Name: GetImageData ]]
    -- upvalues: v4 (copy), v1 (copy), l_Images_0 (copy), l_GuiService_0 (copy), v2 (copy)
    local v8 = (if v4 then v1(v7 or l_Images_0.ImagesResolutionScale) else v1(v7 or l_GuiService_0:GetResolutionScale()))[v6];
    if v8 == nil then
        return nil;
    else
        return {
            Image = v2(v8.ImageSet), 
            ImageRectSize = v8.ImageRectSize, 
            ImageRectOffset = v8.ImageRectOffset
        };
    end;
end;