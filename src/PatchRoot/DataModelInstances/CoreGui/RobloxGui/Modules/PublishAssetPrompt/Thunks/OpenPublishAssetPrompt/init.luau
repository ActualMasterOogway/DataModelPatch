local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.OpenPublishAssetPrompt);
local v2 = require(l_Parent_0.PromptType);
return function(v3, v4, v5, v6) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v7) --[[ Line: 13 ]]
        -- upvalues: v3 (ref), v1 (ref), v2 (ref), v4 (copy), v5 (copy), v6 (copy)
        if v3:IsA("Accessory") then
            local l_Model_0 = Instance.new("Model");
            l_Model_0.Parent = v3.Parent;
            v3.Parent = l_Model_0;
            local l_v3_FirstChildWhichIsA_0 = v3:FindFirstChildWhichIsA("BasePart", true);
            if l_v3_FirstChildWhichIsA_0 == nil then
                print("Error: accessory to be published does not contain a BasePart");
            else
                l_Model_0.PrimaryPart = l_v3_FirstChildWhichIsA_0;
                v3 = l_Model_0;
            end;
        end;
        v7:dispatch(v1(v2.PublishAssetSingleStep, v3, v4, v5, v6));
    end;
end;