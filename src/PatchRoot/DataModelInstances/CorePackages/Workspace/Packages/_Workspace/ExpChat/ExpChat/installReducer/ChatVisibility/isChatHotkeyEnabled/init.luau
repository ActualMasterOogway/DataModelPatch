local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.ChatInputBarConfigurationEnabled);
local v7 = require(l_Actions_0.SetCoreGuiEnabledChanged);
local l_ClientAppLoaded_0 = v2.Actions.ClientAppLoaded;
local v9 = require(l_Actions_0.DevTextBoxEnabledChanged);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v11 = require(l_Flags_0.getTextChatServicePropertyTextBox);
local v12 = {
    _propertyEnabled = true, 
    _coreGuiEnabled = true, 
    _devTextBoxEnabled = false, 
    value = true
};
return v3.createReducer(v12, {
    [v6.name] = function(v13, v14) --[[ Line: 31 ]]
        -- upvalues: v11 (copy), l_Dictionary_0 (copy)
        local v15 = nil;
        v15 = if v11() then v13._coreGuiEnabled and not v13._devTextBoxEnabled and v14.enabled else v13._coreGuiEnabled and v14.enabled;
        return l_Dictionary_0.join(v13, {
            _propertyEnabled = v14.enabled, 
            value = v15
        });
    end, 
    [v7.name] = function(v16, v17) --[[ Line: 44 ]]
        -- upvalues: v11 (copy), l_Dictionary_0 (copy)
        local v18 = nil;
        v18 = if v11() then v16._propertyEnabled and not v16._devTextBoxEnabled and v17.enabled else v16._propertyEnabled and v17.enabled;
        return l_Dictionary_0.join(v16, {
            _coreGuiEnabled = v17.enabled, 
            value = v18
        });
    end, 
    [v9.name] = function(v19, v20) --[[ Line: 57 ]]
        -- upvalues: v11 (copy), l_Dictionary_0 (copy)
        if v11() then
            return l_Dictionary_0.join(v19, {
                _devTextBoxEnabled = v20.enabled, 
                value = v19._propertyEnabled and v19._coreGuiEnabled and not v20.enabled
            });
        else
            return v19;
        end;
    end, 
    [l_ClientAppLoaded_0.name] = function(v21, v22) --[[ Line: 68 ]]
        -- upvalues: v11 (copy), l_Dictionary_0 (copy)
        local v23 = nil;
        v23 = if v11() then v21._propertyEnabled and not v21._devTextBoxEnabled and v22.isChatCoreGuiEnabled else v21._propertyEnabled and v22.isChatCoreGuiEnabled;
        return l_Dictionary_0.join(v21, {
            _coreGuiEnabled = v22.isChatCoreGuiEnabled, 
            value = v23
        });
    end
});