local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_script_FirstAncestor_0.Parent.UIBlox);
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: getByImageSet ]]
    -- upvalues: l_HttpService_0 (copy)
    for _, v6 in v3:GetDescendants() do
        if (v6:IsA("ImageLabel") or v6:IsA("ImageButton")) and v6.Image == v4.Image and v6.ImageRectOffset == v4.ImageRectOffset and v6.ImageRectSize == v4.ImageRectSize then
            return v6;
        end;
    end;
    error((("no ImageSetLabel or ImageSetButton found for the imageSet %*"):format((l_HttpService_0:JSONEncode(v4)))));
end;