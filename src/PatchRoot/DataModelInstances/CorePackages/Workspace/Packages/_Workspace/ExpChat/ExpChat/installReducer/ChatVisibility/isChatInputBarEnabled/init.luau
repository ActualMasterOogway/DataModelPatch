local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ExpChatShared);
local v3 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v6 = require(l_Flags_0.getTextChatServicePropertyTextBox);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v8 = require(l_Actions_0.ChatInputBarConfigurationEnabled);
local v9 = require(l_Actions_0.ChatTopBarButtonActivated);
local v10 = require(l_Actions_0.SetCoreGuiEnabledChanged);
local l_ClientAppLoaded_0 = v2.Actions.ClientAppLoaded;
local v12 = require(l_Actions_0.DevTextBoxEnabledChanged);
local v13 = {
    _propertyEnabled = true, 
    _coreGuiEnabled = true, 
    _topBarVisibility = true, 
    _devTextBoxEnabled = false, 
    value = true
};
return v3.createReducer(v13, {
    [v8.name] = function(v14, v15) --[[ Line: 34 ]]
        -- upvalues: v6 (copy), l_Dictionary_0 (copy)
        local v16 = nil;
        v16 = if v6() then v14._topBarVisibility and v14._coreGuiEnabled and not v14._devTextBoxEnabled and v15.enabled else v14._topBarVisibility and v14._coreGuiEnabled and v15.enabled;
        return l_Dictionary_0.join(v14, {
            _propertyEnabled = v15.enabled, 
            value = v16
        });
    end, 
    [v9.name] = function(v17, v18) --[[ Line: 51 ]]
        -- upvalues: v6 (copy), l_Dictionary_0 (copy)
        local v19 = nil;
        v19 = if v6() then v17._propertyEnabled and v17._coreGuiEnabled and not v17._devTextBoxEnabled and v18.isVisible else v17._propertyEnabled and v17._coreGuiEnabled and v18.isVisible;
        return l_Dictionary_0.join(v17, {
            _topBarVisibility = v18.isVisible, 
            value = v19
        });
    end, 
    [v10.name] = function(v20, v21) --[[ Line: 67 ]]
        -- upvalues: v6 (copy), l_Dictionary_0 (copy)
        local v22 = nil;
        v22 = if v6() then v20._propertyEnabled and v20._topBarVisibility and not v20._devTextBoxEnabled and v21.enabled else v20._propertyEnabled and v20._topBarVisibility and v21.enabled;
        return l_Dictionary_0.join(v20, {
            _coreGuiEnabled = v21.enabled, 
            value = v22
        });
    end, 
    [v12.name] = function(v23, v24) --[[ Line: 83 ]]
        -- upvalues: v6 (copy), l_Dictionary_0 (copy)
        if v6() then
            return l_Dictionary_0.join(v23, {
                _devTextBoxEnabled = v24.enabled, 
                value = v23._propertyEnabled and v23._topBarVisibility and v23._coreGuiEnabled and not v24.enabled
            });
        else
            return v23;
        end;
    end, 
    [l_ClientAppLoaded_0.name] = function(v25, v26) --[[ Line: 97 ]]
        -- upvalues: v6 (copy), l_Dictionary_0 (copy)
        local v27 = nil;
        v27 = if v6() then v25._propertyEnabled and v25._topBarVisibility and not v25._devTextBoxEnabled and v26.isChatCoreGuiEnabled else v25._propertyEnabled and v25._topBarVisibility and v26.isChatCoreGuiEnabled;
        return l_Dictionary_0.join(v25, {
            _coreGuiEnabled = v26.isChatCoreGuiEnabled, 
            value = v27
        });
    end
});