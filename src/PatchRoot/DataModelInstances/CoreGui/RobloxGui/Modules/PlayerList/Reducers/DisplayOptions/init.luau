local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Rodux);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v6 = require(l_Actions_0.SetPlayerListVisibility);
local v7 = require(l_Actions_0.SetPlayerListEnabled);
local v8 = require(l_Actions_0.SetTempHideKey);
local v9 = require(l_Actions_0.SetPerformanceStatsVisible);
local v10 = require(l_Actions_0.SetSmallTouchDevice);
local v11 = require(l_Actions_0.SetTenFootInterface);
local v12 = require(l_Actions_0.SetInspectMenuEnabled);
local v13 = require(l_Actions_0.SetIsUsingGamepad);
local v14 = require(l_Actions_0.SetHasPermissionToVoiceChat);
local v15 = require(l_Actions_0.SetMinimized);
local v16 = require(l_Actions_0.SetSubjectToChinaPolicies);
local v17 = {
    isMinimized = false, 
    setVisible = true, 
    isVisible = true, 
    isSmallTouchDevice = false, 
    performanceStatsVisible = false, 
    vrEnabled = l_VRService_0.VREnabled, 
    inspectMenuEnabled = l_GuiService_0:GetInspectMenuEnabled(), 
    playerlistCoreGuiEnabled = true, 
    isTenFootInterface = false, 
    isUsingGamepad = false, 
    hasPermissionToVoiceChat = false, 
    tempHideKeys = {}, 
    subjectToChinaPolicies = true
};
local function _(v18) --[[ Line: 38 ]] --[[ Name: updateIsVisible ]]
    -- upvalues: v4 (copy)
    v18.isVisible = v18.setVisible;
    if not v18.isTenFootInterface then
        v18.isVisible = v18.isVisible;
    end;
    v18.isVisible = v18.isVisible and v4.isEmpty(v18.tempHideKeys);
    return v18;
end;
return (v3.createReducer(v17, {
    [v6.name] = function(v20, v21) --[[ Line: 51 ]]
        -- upvalues: v4 (copy)
        local v22 = v4.Dictionary.join(v20, {
            setVisible = v21.isVisible
        });
        v22.isVisible = v22.setVisible;
        if not v22.isTenFootInterface then
            v22.isVisible = v22.isVisible;
        end;
        v22.isVisible = v22.isVisible and v4.isEmpty(v22.tempHideKeys);
        return v22;
    end, 
    [v7.name] = function(v23, v24) --[[ Line: 57 ]]
        -- upvalues: v4 (copy)
        local v25 = v4.Dictionary.join(v23, {
            playerlistCoreGuiEnabled = v24.isEnabled
        });
        v25.isVisible = v25.setVisible;
        if not v25.isTenFootInterface then
            v25.isVisible = v25.isVisible;
        end;
        v25.isVisible = v25.isVisible and v4.isEmpty(v25.tempHideKeys);
        return v25;
    end, 
    [v8.name] = function(v26, v27) --[[ Line: 63 ]]
        -- upvalues: v4 (copy)
        local l_tempHideValue_0 = v27.tempHideValue;
        if l_tempHideValue_0 == nil then
            l_tempHideValue_0 = v4.None;
        end;
        local v29 = v4.Dictionary.join(v26, {
            tempHideKeys = v4.Dictionary.join(v26.tempHideKeys, {
                [v27.tempHideKey] = l_tempHideValue_0
            })
        });
        v29.isVisible = v29.setVisible;
        if not v29.isTenFootInterface then
            v29.isVisible = v29.isVisible;
        end;
        v29.isVisible = v29.isVisible and v4.isEmpty(v29.tempHideKeys);
        return v29;
    end, 
    [v9.name] = function(v30, v31) --[[ Line: 75 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v30, {
            performanceStatsVisible = v31.isVisible
        });
    end, 
    [v10.name] = function(v32, v33) --[[ Line: 81 ]]
        -- upvalues: v4 (copy)
        local v34 = v4.Dictionary.join(v32, {
            isSmallTouchDevice = v33.isSmallTouchDevice
        });
        v34.isVisible = v34.setVisible;
        if not v34.isTenFootInterface then
            v34.isVisible = v34.isVisible;
        end;
        v34.isVisible = v34.isVisible and v4.isEmpty(v34.tempHideKeys);
        return v34;
    end, 
    [v11.name] = function(v35, v36) --[[ Line: 87 ]]
        -- upvalues: v4 (copy)
        local l_setVisible_0 = v35.setVisible;
        if v36.isTenFootInterface then
            l_setVisible_0 = false;
        end;
        local v38 = v4.Dictionary.join(v35, {
            isTenFootInterface = v36.isTenFootInterface, 
            setVisible = l_setVisible_0
        });
        v38.isVisible = v38.setVisible;
        if not v38.isTenFootInterface then
            v38.isVisible = v38.isVisible;
        end;
        v38.isVisible = v38.isVisible and v4.isEmpty(v38.tempHideKeys);
        return v38;
    end, 
    [v12.name] = function(v39, v40) --[[ Line: 98 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v39, {
            inspectMenuEnabled = v40.enabled
        });
    end, 
    [v13.name] = function(v41, v42) --[[ Line: 104 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v41, {
            isUsingGamepad = v42.isUsingGamepad
        });
    end, 
    [v14.name] = function(v43, v44) --[[ Line: 110 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v43, {
            hasPermissionToVoiceChat = v44.hasPermissionToVoiceChat
        });
    end, 
    [v15.name] = function(v45, v46) --[[ Line: 116 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v45, {
            isMinimized = v46.isMinimized
        });
    end, 
    [v16.name] = function(v47, v48) --[[ Line: 122 ]]
        -- upvalues: v4 (copy)
        return v4.Dictionary.join(v47, {
            subjectToChinaPolicies = v48.subjectToChinaPolicies
        });
    end
}));