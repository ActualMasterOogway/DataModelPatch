local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Parent_0.Actions.OpenPublishAssetPrompt);
local v5 = require(l_Parent_0.Actions.OpenPublishAvatarPrompt);
local v6 = require(l_Parent_0.Actions.CloseOpenPrompt);
local v7 = require(l_Parent_0.Actions.OpenResultModal);
local v8 = require(l_Parent_0.Actions.CloseResultModal);
local v9 = require(l_Parent_0.Actions.OpenValidationErrorModal);
local v10 = require(l_Parent_0.Actions.SetHumanoidModel);
local v11 = require(l_Parent_0.Actions.SetPriceInRobux);
local v12 = require(l_Parent_0.Actions.SetPromptVisibility);
local v13 = {
    promptInfo = {}, 
    queue = {}
};
return (v2.createReducer(v13, {
    [v4.name] = function(v14, v15) --[[ Line: 32 ]]
        -- upvalues: v3 (copy)
        if v14.promptInfo.promptType == nil then
            return v3.Dictionary.join(v14, {
                promptInfo = v15.promptInfo
            });
        else
            return v3.Dictionary.join(v14, {
                queue = v3.List.join(v14.queue, {
                    v15.promptInfo
                })
            });
        end;
    end, 
    [v5.name] = function(v16, v17) --[[ Line: 44 ]]
        -- upvalues: v3 (copy)
        if v16.promptInfo.promptType == nil then
            return v3.Dictionary.join(v16, {
                promptInfo = v17.promptInfo
            });
        else
            return v3.Dictionary.join(v16, {
                queue = v3.List.join(v16.queue, {
                    v17.promptInfo
                })
            });
        end;
    end, 
    [v10.name] = function(v18, v19) --[[ Line: 56 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v18, {
            promptInfo = v3.Dictionary.join(v18.promptInfo, {
                humanoidModel = v19.humanoidModel
            })
        });
    end, 
    [v11.name] = function(v20, v21) --[[ Line: 64 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v20, {
            promptInfo = v3.Dictionary.join(v20.promptInfo, {
                priceInRobux = v21.priceInRobux
            })
        });
    end, 
    [v6.name] = function(v22, _) --[[ Line: 72 ]]
        -- upvalues: v3 (copy)
        if v3.isEmpty(v22.queue) then
            return {
                promptInfo = {}, 
                queue = v22.queue
            };
        else
            return v3.Dictionary.join(v22, {
                promptInfo = v22.queue[1], 
                queue = v3.List.removeIndex(v22.queue, 1)
            });
        end;
    end, 
    [v7.name] = function(v24, v25) --[[ Line: 85 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v24, {
            resultModalType = v25.resultType
        });
    end, 
    [v8.name] = function(v26, _) --[[ Line: 92 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v26, {
            resultModalType = v3.None
        });
    end, 
    [v9.name] = function(v28, v29) --[[ Line: 98 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v28, {
            promptInfo = v3.Dictionary.join(v28.promptInfo, {
                errorMessage = v29.errorMessage
            })
        });
    end, 
    [v12.name] = function(v30, v31) --[[ Line: 107 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v30, {
            promptInfo = v3.Dictionary.join(v30.promptInfo, {
                promptVisible = v31.promptVisible
            })
        });
    end
}));