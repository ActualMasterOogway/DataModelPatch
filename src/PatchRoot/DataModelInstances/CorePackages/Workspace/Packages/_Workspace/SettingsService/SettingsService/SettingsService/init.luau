local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local _ = require(l_Parent_0.Types);
local v4 = require(l_Parent_0.AvailabilitySignal);
local v5 = require(l_Parent_0.FieldType);
local v6 = require(l_Parent_0.ValueChangedSignal);
local v7 = require(l_Parent_0.VisibilitySignal);
local l_Localization_0 = require(l_Parent_1.InExperienceLocales).Localization;
local v9 = {};
v9.__index = v9;
v9.new = function() --[[ Line: 78 ]] --[[ Name: new ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy), v9 (copy)
    local v10 = {
        _pages = {}
    };
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    v10._localization = l_Localization_0.new(l_RobloxLocaleId_0);
    return (setmetatable(v10, v9));
end;
v9.registerPage = function(v12, v13) --[[ Line: 86 ]] --[[ Name: registerPage ]]
    -- upvalues: v4 (copy), v7 (copy)
    if v12._pages[v13.id] then
        return v12._pages[v13.id];
    else
        if v13.alreadyLocalized == nil then
            v13.alreadyLocalized = true;
        end;
        v13.availability = v13.availability or v4.new(true);
        v13.visibility = v13.visibility or v7.new(true);
        v13.availability:connect(function(v14) --[[ Line: 96 ]]
            -- upvalues: v13 (copy)
            if not v14 then
                v13.visibility:set(v14);
            end;
        end, true);
        if not v13.alreadyLocalized then
            v13.label = v12:_updateLocalization(v13.label);
        end;
        for v15, v16 in ipairs(v13.settingsFields) do
            v13.settingsFields[v15] = v12:_registerSettingField(v16);
        end;
        v12._pages[v13.id] = v13;
        return v12._pages[v13.id];
    end;
end;
v9.getPageById = function(v17, v18) --[[ Line: 111 ]] --[[ Name: getPageById ]]
    return v17._pages[v18];
end;
v9._updateLocalization = function(v19, v20) --[[ Line: 116 ]] --[[ Name: _updateLocalization ]]
    if v20 == nil then
        return nil;
    else
        local l__localization_0 = v19._localization;
        if type(v20) == "string" then
            return l__localization_0:Format(v20);
        else
            return l__localization_0:Format(v20.key, v20.args);
        end;
    end;
end;
v9._registerToggle = function(_, v23) --[[ Line: 128 ]] --[[ Name: _registerToggle ]]
    return v23;
end;
v9._registerOptions = function(v24, v25, v26) --[[ Line: 135 ]] --[[ Name: _registerOptions ]]
    -- upvalues: v4 (copy)
    for _, v28 in ipairs(v26) do
        if not v25 then
            v28.text = v24:_updateLocalization(v28.text);
        end;
        v28.availability = v28.availability or v4.new(true);
    end;
    return v26;
end;
v9._registerSlider = function(v29, v30) --[[ Line: 149 ]] --[[ Name: _registerSlider ]]
    if not v30.alreadyLocalized then
        v30.sliderLeftLabel = v29:_updateLocalization(v30.sliderLeftLabel);
        v30.sliderRightLabel = v29:_updateLocalization(v30.sliderRightLabel);
    end;
    return v30;
end;
v9._registerTextButton = function(v31, v32) --[[ Line: 160 ]] --[[ Name: _registerTextButton ]]
    if not v32.alreadyLocalized then
        v32.text = v31:_updateLocalization(v32.text);
    end;
    return v32;
end;
v9._registerDropdown = function(v33, v34) --[[ Line: 170 ]] --[[ Name: _registerDropdown ]]
    -- upvalues: v6 (copy)
    if not v34.alreadyLocalized then
        v34.placeholder = v33:_updateLocalization(v34.placeholder);
    end;
    v34.onMenuOpenChange = v34.onMenuOpenChange or v6.new(nil);
    v34.options = v33:_registerOptions(v34.alreadyLocalized, v34.options);
    return v34;
end;
v9._registerSelector = function(v35, v36) --[[ Line: 182 ]] --[[ Name: _registerSelector ]]
    if not v36.alreadyLocalized then
        v36.placeholder = v35:_updateLocalization(v36.placeholder);
    end;
    v36.options = v35:_registerOptions(v36.alreadyLocalized, v36.options);
    return v36;
end;
v9._registerSettingField = function(v37, v38) --[[ Line: 193 ]] --[[ Name: _registerSettingField ]]
    -- upvalues: v4 (copy), v7 (copy), v5 (copy)
    if v38.alreadyLocalized == nil then
        v38.alreadyLocalized = true;
    end;
    v38.availability = v38.availability or v4.new(true);
    v38.visibility = v38.visibility or v7.new(true);
    v38.availability:connect(function(v39) --[[ Line: 203 ]]
        -- upvalues: v38 (copy)
        if not v39 then
            v38.visibility:set(v39);
        end;
    end, true);
    if not v38.alreadyLocalized then
        v38.label = v37:_updateLocalization(v38.label);
        v38.description = v37:_updateLocalization(v38.description);
    end;
    local l_v38_0 = v38;
    if l_v38_0.field_type == v5.Selector then
        return (v37:_registerSelector(l_v38_0));
    elseif l_v38_0.field_type == v5.Slider then
        return (v37:_registerSlider(l_v38_0));
    elseif l_v38_0.field_type == v5.Dropdown then
        return (v37:_registerDropdown(l_v38_0));
    elseif l_v38_0.field_type == v5.TextButton then
        return (v37:_registerTextButton(l_v38_0));
    elseif l_v38_0.field_type == v5.Toggle then
        return (v37:_registerToggle(l_v38_0));
    else
        error(tostring(l_v38_0.field_type) .. " is not a valid field_type");
        return l_v38_0;
    end;
end;
return v9;