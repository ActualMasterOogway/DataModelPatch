local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.constants);
return function(v3) --[[ Line: 16 ]] --[[ Name: getGalleryItems ]]
    -- upvalues: v2 (copy)
    local v4 = {};
    if v3 then
        for _, v6 in v3 do
            if v6.assetType == "Image" and v6.imageId then
                table.insert(v4, {
                    imageId = ("rbxassetid://%s"):format(v6.imageId), 
                    isVideo = false
                });
            end;
        end;
    end;
    if #v4 > 0 then
        return v4;
    else
        return {
            {
                imageId = v2.DEFAULT_EVENT_THUMBNAIL, 
                isVideo = false
            }
        };
    end;
end;