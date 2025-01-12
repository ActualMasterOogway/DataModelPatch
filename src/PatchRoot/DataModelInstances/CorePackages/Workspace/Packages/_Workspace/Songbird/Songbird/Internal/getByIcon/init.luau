local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_Images_0 = require(l_script_FirstAncestor_0.Parent.UIBlox).App.ImageSet.Images;
return function(v2, v3) --[[ Line: 13 ]] --[[ Name: getByIcon ]]
    -- upvalues: l_Images_0 (copy)
    local v4 = false;
    if v3 ~= nil then
        v4 = v3:match("^%w+://.*$") == nil;
    end;
    local v5 = if v4 then l_Images_0[v3] else nil;
    local l_v3_0 = v3;
    local v7 = nil;
    local v8 = nil;
    if v5 then
        l_v3_0 = v5.Image;
        v7 = v5.ImageRectOffset;
        v8 = v5.ImageRectSize;
    end;
    local v9 = {};
    for _, v11 in v2:GetDescendants() do
        if (v11:IsA("ImageLabel") or v11:IsA("ImageButton")) and v11.Image == l_v3_0 then
            if v5 then
                if v11.ImageRectOffset == v7 and v11.ImageRectSize == v8 then
                    table.insert(v9, v11);
                end;
            else
                table.insert(v9, v11);
            end;
        end;
    end;
    if #v9 == 0 then
        error((("no instance found for icon %*"):format(v3)));
        return;
    elseif #v9 > 1 then
        error((("found %%i instances for icon %*, expected at most 1"):format(v3)));
        return;
    else
        return v9[1];
    end;
end;