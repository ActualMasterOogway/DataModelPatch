local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local l_DeviceOrientationMode_0 = require(l_Parent_0.RobloxAppEnums).DeviceOrientationMode;
local l_wasLastInputGamepad_0 = require(l_Parent_0.RoactUtils).wasLastInputGamepad;
local v6 = require(l_script_FirstAncestor_0.Utils.debounce);
local v7 = require(l_script_FirstAncestor_0.Utils.normalizeKeyword);
local v8 = require(l_script_FirstAncestor_0.Utils.RecentSearchTermsAppStorage);
local v9 = require(l_script_FirstAncestor_0.Enums.Counter);
local v10 = require(l_script_FirstAncestor_0.Enums.Stat);
local v11 = require(l_script_FirstAncestor_0.Enums.SuggestedItemTypeEnum);
local _ = require(l_script_FirstAncestor_0.Components.SuggestedItemList);
local _ = require(l_script_FirstAncestor_0.Components.SuggestedItem);
local _ = require(script.Parent.SearchLandingPage);
local _ = require(l_script_FirstAncestor_0.Store.Types);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v17 = require(l_script_FirstAncestor_0.Flags.GetFIntAXSearchAutocompleteDebounceMs);
local v18 = require(l_script_FirstAncestor_0.Flags.GetFIntAXMaxAutocompleteSearchTextLen);
local v19 = v17() / 1000;
local function v25(v20) --[[ Line: 27 ]] --[[ Name: getRecentSearchTerms ]]
    -- upvalues: v8 (copy), v11 (copy)
    local v21 = v8.findTermsForQuery(v20);
    local v22 = {};
    for _, v24 in v21 do
        table.insert(v22, {
            text = v24, 
            type = v11.Recent
        });
    end;
    return v22;
end;
local function v32(v26, v27) --[[ Line: 42 ]] --[[ Name: getAutocompleteTermsForQueryFromState ]]
    -- upvalues: v7 (copy)
    local v28 = v27[v7(v26)];
    local v29 = {};
    if v28 and v28.entries then
        for _, v31 in v28.entries do
            table.insert(v29, v31.searchQuery);
        end;
    end;
    return v29;
end;
local function v43(v33, v34) --[[ Line: 57 ]] --[[ Name: getAutocompleteTerms ]]
    -- upvalues: v8 (copy), v32 (copy), v11 (copy)
    local v35 = v8.findTermsForQuery(v33);
    local v36 = {};
    for _, v38 in v35 do
        v36[v38:lower()] = true;
    end;
    local v39 = v32(v33, v34);
    local v40 = {};
    for _, v42 in v39 do
        if not v36[v42:lower()] then
            table.insert(v40, {
                text = v42, 
                type = v11.Autocomplete
            });
        end;
    end;
    return v40;
end;
local v46 = v6(function(v44, v45) --[[ Line: 87 ]]
    if v45 then
        v45(v44);
    end;
end, v19);
return function(v47) --[[ Line: 120 ]] --[[ Name: useSearchLandingPageProps ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), v8 (copy), l_DeviceOrientationMode_0 (copy), v9 (copy), l_wasLastInputGamepad_0 (copy), v7 (copy), v18 (copy), v46 (copy), v3 (copy), v10 (copy), v11 (copy), v25 (copy), v43 (copy)
    local v48 = l_useDesignTokens_0();
    local v49, v50 = v2.useState(v8.getTerms());
    local v51, v52 = v2.useState("");
    local v53 = v2.useRef(os.clock());
    local v57 = v2.useCallback(function(v54) --[[ Line: 132 ]]
        -- upvalues: v47 (copy)
        local v55 = v54:lower();
        local v56 = v47.autocompleteState and v47.autocompleteState[v55];
        if v56 and v56.expirationTime then
            return tick() < v56.expirationTime;
        else
            return false;
        end;
    end, {
        v47.autocompleteState
    });
    local v61 = v2.useCallback(function(v58) --[[ Line: 142 ]]
        -- upvalues: v47 (copy), l_DeviceOrientationMode_0 (ref)
        local v59 = v47.createSearchUuid();
        local v60 = {
            searchKeyword = v58, 
            isKeywordSuggestionEnabled = true
        };
        v47.setSearchType(v59);
        v47.setSearchParameters(v59, v60);
        if v47.deviceOrientation == l_DeviceOrientationMode_0.Portrait then
            v47.setFullView();
        end;
        v47.navigateToSearch(v59, v60);
    end, {
        v47.createSearchUuid, 
        v47.setSearchType, 
        v47.setSearchParameters, 
        v47.setFullView, 
        v47.deviceOrientation, 
        v47.navigateToSearch
    });
    local v65 = v2.useCallback(function(v62, v63) --[[ Line: 168 ]]
        -- upvalues: v47 (copy), v9 (ref), v50 (copy), v8 (ref), l_wasLastInputGamepad_0 (ref)
        if v47.sendCounter then
            v47.sendCounter(v9.SearchRecentTermRemoved);
            if v63 then
                local v64 = v9.SearchRecentTermRemovedPosPrefix .. v63;
                v47.sendCounter(v64);
            end;
        end;
        v50(v8.removeTerm(v62));
        if l_wasLastInputGamepad_0() then
            v47.focusController.moveFocusTo(v47.searchBarRef);
        end;
    end, {
        v47.focusController, 
        v47.searchBarRef, 
        v47.sendCounter
    });
    local v68 = v2.useCallback(function(v66) --[[ Line: 195 ]]
        -- upvalues: v52 (copy), v47 (copy), v7 (ref), v18 (ref), v57 (copy), v46 (ref)
        v52(v66);
        if v47.searchTelemetry then
            v47.searchTelemetry.updateQuery(v66);
        end;
        local v67 = v7(v66, true);
        if not v67 or v67 == "" or #v67 > v18() or v57(v67) then
            return;
        else
            v46(v67, v47.fetchAutocompleteSuggestions);
            return;
        end;
    end, {
        v47.autocompleteState, 
        v47.fetchAutocompleteSuggestions, 
        v57, 
        v47.searchTelemetry
    });
    local v71 = v2.useCallback(function(v69) --[[ Line: 225 ]]
        -- upvalues: v3 (ref), v47 (copy), v9 (ref), v53 (copy), v10 (ref), v8 (ref), v61 (copy)
        if not v69 or v3.trim(v69) == "" then
            if v47.sendCounter then
                v47.sendCounter(v9.SearchSubmitNoQuery);
            end;
            return;
        else
            if v47.sendCounter then
                v47.sendCounter(v9.SearchSubmit);
                local v70 = (os.clock() - v53.current) * 1000;
                if v47.sendStats then
                    v47.sendStats(v10.SearchTimeToSearchMs, v70);
                end;
            end;
            v8.addTerm(v69);
            v61(v69);
            return;
        end;
    end, {
        v61, 
        v47.sendCounter
    });
    local v72 = v2.useCallback(function() --[[ Line: 247 ]]
        -- upvalues: v47 (copy), v9 (ref)
        if v47.sendCounter then
            v47.sendCounter(v9.SearchCancel);
        end;
        if v47.navigation then
            v47.navigation.goBack();
        end;
    end, {
        v47.navigation, 
        v47.sendCounter
    });
    local v74 = v2.useCallback(function(v73) --[[ Line: 258 ]]
        -- upvalues: v52 (copy), v47 (copy), v9 (ref)
        v52("");
        if v47.searchTelemetry then
            v47.searchTelemetry.sendClearEvent(v73);
        end;
        if v47.sendCounter then
            v47.sendCounter(v9.SearchClear);
        end;
    end, {
        v47.sendCounter, 
        v47.searchTelemetry
    });
    local v80 = v2.useCallback(function(v75, v76, v77) --[[ Line: 274 ]]
        -- upvalues: v47 (copy), v11 (ref), v9 (ref), v51 (copy), v71 (copy)
        if v47.sendCounter then
            local v78 = if v76 == v11.Recent then v9.SearchRecentTermSelected else v9.SearchAutocompleteTermSelected;
            v47.sendCounter(v78);
            if v76 == v11.Recent and v51 == "" or v51 == nil then
                v47.sendCounter(v9.SearchRecentTermSelectedNoQuery);
            end;
            local v79 = v9.SearchSuggestedTermSelectedPosPrefix .. v77;
            v47.sendCounter(v79);
        end;
        if v47.searchTelemetry and v76 == v11.Autocomplete then
            v47.searchTelemetry.sendAutocompleteTermClickedEvent(v51, v75);
        end;
        v71(v75);
    end, {
        v71, 
        v47.sendCounter, 
        v51, 
        v47.searchTelemetry
    });
    local v90 = v2.useMemo(function() --[[ Line: 304 ]]
        -- upvalues: v25 (ref), v51 (copy), v47 (copy), v43 (ref), v80 (copy), v11 (ref), v65 (copy)
        local v81 = v25(v51);
        local v82 = if v47.autocompleteState then v43(v51, v47.autocompleteState) else {};
        local v83 = {};
        for _, v85 in v81 do
            table.insert(v83, v85);
        end;
        for _, v87 in v82 do
            table.insert(v83, v87);
        end;
        for v88, v89 in v83 do
            v89.onActivate = function() --[[ Line: 322 ]]
                -- upvalues: v80 (ref), v89 (copy), v88 (copy)
                v80(v89.text, v89.type, v88);
            end;
            if v89.type == v11.Recent then
                v89.onRemove = function() --[[ Line: 327 ]]
                    -- upvalues: v65 (ref), v89 (copy), v88 (copy)
                    v65(v89.text, v88);
                end;
            end;
        end;
        return v83;
    end, {
        v51, 
        v49, 
        v47.autocompleteState, 
        v80, 
        v65
    });
    local v91 = false;
    if #v90 == 0 then
        v91 = v51 == "";
    end;
    return {
        padding = {
            top = v47.statusBarHeight or 0, 
            left = v48.Global.Space_150, 
            right = v48.Global.Space_150
        }, 
        items = v90, 
        onCancelSearch = v72, 
        onChangeSearchQuery = v68, 
        onSubmitSearch = v71, 
        onClearSearch = v74, 
        shouldShowEmptyState = v91, 
        searchBarRef = v47.searchBarRef, 
        firstSuggestedItemRef = v47.firstSuggestedItemRef
    };
end;