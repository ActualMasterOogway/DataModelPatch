local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_DropdownMenu_0 = v3.App.Menu.DropdownMenu;
local v6 = game:DefineFastFlag("GenericAbuseDropdownDescription", false);
return function(v7) --[[ Line: 32 ]] --[[ Name: ReasonDropdown ]]
    -- upvalues: v2 (copy), v1 (copy), v6 (copy), l_useLocalization_0 (copy), l_DropdownMenu_0 (copy)
    local v10 = v2.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v1 (ref), v7 (copy)
        local v9 = v1.Dictionary.map(v7.options, function(v8) --[[ Line: 34 ]]
            return v8.localizationKey, v8.value;
        end);
        return v1.Dictionary.union(v9, {
            ChooseOne = "Feature.ReportAbuse.Label.ChooseOne"
        });
    end, {
        v7.options
    });
    local v12 = v2.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v6 (ref), v1 (ref), v7 (copy)
        if v6 then
            return (v1.Dictionary.map(v7.options, function(v11) --[[ Line: 45 ]]
                return v11.descriptionLocalizationKey, v11.value;
            end));
        else
            return {};
        end;
    end, {
        v7.options
    });
    local v13 = l_useLocalization_0(v10);
    local v14 = nil;
    if v6 then
        v14 = l_useLocalization_0(v12);
    end;
    local v16 = v2.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: v1 (ref), v7 (copy), v13 (copy)
        return v1.List.map(v7.options, function(v15) --[[ Line: 60 ]]
            -- upvalues: v13 (ref)
            return {
                text = v13[v15.value] or "", 
                key = v15.value
            };
        end);
    end, {
        v7.options, 
        v13
    });
    local v18 = v2.useCallback(function(v17) --[[ Line: 68 ]]
        -- upvalues: v7 (copy), v6 (ref), v14 (ref)
        v7.setDropdownError(false);
        v7.onSelectedAbuseType(v17);
        if v6 and v7.setDescription then
            v7.setDescription(v14[v17] or "");
        end;
    end, {
        v7.setDropdownError, 
        v7.onSelectedAbuseType
    });
    return v2.createElement(l_DropdownMenu_0, {
        placeholder = v13.ChooseOne, 
        onChange = v18, 
        screenSize = v7.screenSize, 
        height = UDim.new(0, v7.menuItemHeight), 
        fixedListHeight = math.min(v7.menuItemHeight * #v7.options, v7.maxHeight), 
        errorState = v7.isDropdownError, 
        showDropShadow = true, 
        dropdownMenuListPositionFixed = true, 
        cellDatas = v16, 
        defaultKey = v7.reportCategoryDefaultKey, 
        isDisabled = v7.isDisabled
    });
end;