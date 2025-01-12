local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.RegExp);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v3 = require(script.Parent.addMessage);
local v4 = require(script.Parent.matchAllRegex);
local v5 = {
    "roblox\\.com", 
    "sitetest\\d\\.robloxlabs\\.com", 
    "gametest\\d\\.robloxlabs\\.com", 
    "roblox\\.cn", 
    "roblox\\.qq\\.com", 
    "roblox-cn\\.com"
};
local v6 = "(?:";
for _, v8 in v5 do
    v6 = v6 .. v8 .. "|";
end;
local v9 = v1("\\S*" .. (v6:sub(1, -2) .. ")") .. "(?:\\/[A-Za-z]{2}(?:-[A-Za-z0-9]{2,3})?)?" .. "\\/games\\/(\\d+)\\/?" .. "\\S*");
return function(v10) --[[ Line: 30 ]]
    -- upvalues: v4 (copy), v9 (copy), v3 (copy), l_Text_0 (copy)
    local v11 = {};
    local l_v10_0 = v10;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 34 ]]
        -- upvalues: v4 (ref), l_v10_0 (ref), v9 (ref)
        return v4(l_v10_0:lower(), v9);
    end);
    if not l_status_0 or not l_result_0 or #l_result_0 == 0 then
        return v3(v11, l_v10_0);
    else
        for _, v16 in l_result_0 do
            local v17 = v16.capturedGroups[1];
            if v17 then
                local l_v3_0 = v3;
                local l_v11_0 = v11;
                local l_Trim_0 = l_Text_0.Trim;
                local v21 = 1;
                local v22 = v16.index - 1;
                v11 = l_v3_0(l_v11_0, l_Trim_0(l_v10_0:sub(v21, v22)));
                v11 = v3(v11, v17, true);
                l_Trim_0 = v16.index + #v16.matchedText;
                l_v10_0 = l_v10_0:sub(l_Trim_0);
            end;
        end;
        return v3(v11, l_Text_0.Trim(l_v10_0));
    end;
end;