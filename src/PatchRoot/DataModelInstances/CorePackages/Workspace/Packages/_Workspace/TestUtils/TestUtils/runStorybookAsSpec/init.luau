return function(v0, v1, v2) --[[ Line: 2 ]]
    local l_storyRoot_0 = v0.storyRoot;
    local v4 = v0.middleware or function(...) --[[ Line: 4 ]]
        return ...;
    end;
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    v1("SHOULD run all stories with no issue", function() --[[ Line: 10 ]]
        -- upvalues: l_storyRoot_0 (copy), v2 (copy), v4 (copy), l_ScreenGui_0 (copy)
        for _, v7 in ipairs(l_storyRoot_0:GetDescendants()) do
            if v7:IsA("ModuleScript") and v7.Name:find(".story$") then
                v2("SHOULD mount: " .. v7:GetFullName(), function() --[[ Line: 14 ]]
                    -- upvalues: v7 (copy), v4 (ref), l_ScreenGui_0 (ref)
                    local v8 = require(v7);
                    v4(v8, l_ScreenGui_0)();
                end);
            end;
        end;
    end);
end;