local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local v3 = require(l_script_FirstAncestor_0.EnumScreens);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_llama_0 = v2.llama;
local l_tutils_0 = v2.tutils;
local l_LocalizationService_0 = v2.LocalizationService;
local v8 = require(script.Parent.ButtonClickEvents);
local v9 = require(script.Parent.ImpressionEvents);
local v10 = require(script.Parent.NavigatedFromPagesEnum);
local v11 = require(l_script_FirstAncestor_0.Enums.ShowMoreSectionTypeEnum);
local v12 = require(script.Parent.Logger);
local v13 = {};
v13.__index = v13;
v13.DiagCounters = {
    UserLoadedPage = game:DefineFastString("FriendsLandingUserLoadedPageCounter", "FriendsLandingUserLoadedPage"), 
    ShowMoreButtonPressedFriends = game:DefineFastString("ShowMoreButtonPressedFriends", "ShowMoreButtonPressedFriends"), 
    ShowMoreButtonPressedFriendRequests = game:DefineFastString("ShowMoreButtonPressedFriendRequests", "ShowMoreButtonPressedFriendRequests")
};
v13.Navigation = {
    [v3.AddFriends] = game:DefineFastString("FriendsLandingNavigationAddFriendsCounter", "FriendsLandingNavigationAddFriends"), 
    [v3.ViewUserProfile] = game:DefineFastString("FriendsLandingNavigationViewUserProfileCounter", "FriendsLandingNavigationViewUserProfile"), 
    [v3.GameDetailsPeekView] = game:DefineFastString("FriendsLandingNavigationGameDetailsPeekViewCounter", "FriendsLandingNavigationGameDetailsPeekView"), 
    [v3.SearchFriends] = game:DefineFastString("FriendsLandingSearchFriendsCounter", "FriendsLandingSearchFriends")
};
v13.Navigation[l_AppPage_0.Home] = game:DefineFastString("AddFriendsHomeEntryCounter", "AddFriendsHomeEntry");
v13.Navigation.ViewUserProfileAddFriends = game:DefineFastString("FriendsLandingViewUserProfileAddFriendsCounter", "FriendsLandingViewUserProfileAddFriends");
v13.Navigation.ConnectWithFriends = game:DefineFastString("AddFriendsConnectWithFriendsCounter", "AddFriendsConnectWithFriends");
v13.DiagStats = {
    LoadingPageTime = game:DefineFastString("FriendsLandingLoadingPageTimeStats", "FriendsLandingLoadingPageTime"), 
    MountingPageTime = game:DefineFastString("FriendsLandingMountingPageTimeStats", "FriendsLandingMountingPageTime")
};
v13.BASE_CONTEXT = "friendsLanding";
v13.new = function(v14, v15, v16) --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy)
    assert(v15, "FriendsLanding must be passed the ID of the local user");
    local v17 = {
        _diagImpl = v14.Diag, 
        _eventStreamImpl = v14.EventStream, 
        localUserId = v15, 
        _getLoadingTimeInfo = v16, 
        _reportedPagePerformanceOnce = {}
    };
    setmetatable(v17, v13);
    return v17;
end;
v13.navigate = function(v18, v19) --[[ Line: 88 ]] --[[ Name: navigate ]]
    -- upvalues: v12 (copy), v13 (copy)
    v12:info("navigate to {}", v19);
    local v20 = v13.Navigation[v19];
    if v20 then
        v18._diagImpl:reportCounter(v20, 1);
        return;
    else
        v12:error("Error from navigate: Invalid destination '{}'", v19);
        return;
    end;
end;
v13.buttonClick = function(v21, v22, v23) --[[ Line: 98 ]] --[[ Name: buttonClick ]]
    -- upvalues: v8 (copy), v12 (copy), l_llama_0 (copy), v11 (copy), v13 (copy)
    assert(v8.isEnumValue(v22), "invalid button name used");
    v12:info("eventName: buttonClick btn: {}{}", v22, v21:_toStringAdditionalArgs(v23));
    local l_BASE_CONTEXT_0 = v21.BASE_CONTEXT;
    if v23 and v23.contextOverride then
        l_BASE_CONTEXT_0 = v23.contextOverride;
    end;
    v23 = l_llama_0.Dictionary.join(v23 or {}, {
        btn = v22:rawValue(), 
        uid = v21.localUserId, 
        contextOverride = l_llama_0.None
    });
    v21._eventStreamImpl:setRBXEventStream(l_BASE_CONTEXT_0, "buttonClick", v23);
    local v25 = nil;
    if v22 == v8.LoadMoreUsers then
        if v23.sectionType == v11.FriendRequests then
            v25 = v13.DiagCounters.ShowMoreButtonPressedFriendRequests;
        elseif v23.sectionType == v11.Friends then
            v25 = v13.DiagCounters.ShowMoreButtonPressedFriends;
        end;
    end;
    if v25 then
        v21._diagImpl:reportCounter(v25, 1);
    end;
end;
v13.playerSearch = function(v26, v27, v28, v29, v30) --[[ Line: 129 ]] --[[ Name: playerSearch ]]
    -- upvalues: v12 (copy), l_LocalizationService_0 (copy)
    assert(type(v27) == "string", "Expected act to be a string");
    if v28 then
        assert(type(v28) == "string", "Expected keyword to be a string");
    end;
    if v29 then
        assert(type(v29) == "string", "Expected source to be a string");
    end;
    v12:info("eventName: search ctx: players keyword: {} source: {}", v28, v29);
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v32 = {
        act = v27, 
        kwd = v28, 
        source = v29, 
        locale = l_RobloxLocaleId_0, 
        currentPage = v30
    };
    v26._eventStreamImpl:setRBXEventStream("players", "search", v32);
end;
v13._toStringAdditionalArgs = function(_, v34) --[[ Line: 153 ]] --[[ Name: _toStringAdditionalArgs ]]
    -- upvalues: l_tutils_0 (copy)
    if not v34 then
        return "";
    else
        local v35, _ = string.gsub(" args: " .. l_tutils_0.toString(v34), "%s+", " ");
        return v35;
    end;
end;
v13.pageLoaded = function(v37) --[[ Line: 162 ]] --[[ Name: pageLoaded ]]
    -- upvalues: v12 (copy), v13 (copy)
    v12:info("pageLoaded");
    local l_UserLoadedPage_0 = v13.DiagCounters.UserLoadedPage;
    v37._diagImpl:reportCounter(l_UserLoadedPage_0, 1);
end;
v13.pageLoadedWithArgs = function(v39, v40, v41) --[[ Line: 168 ]] --[[ Name: pageLoadedWithArgs ]]
    -- upvalues: v12 (copy)
    v12:info("pageLoaded" .. v40 or v39.BASE_CONTEXT);
    v39._eventStreamImpl:setRBXEventStream(v40 or v39.BASE_CONTEXT, "luaPageLoad", v41);
end;
v13._pagePerformanceReport = function(v42, v43, v44, v45) --[[ Line: 174 ]] --[[ Name: _pagePerformanceReport ]]
    -- upvalues: v10 (copy), v12 (copy)
    local v46 = v45 or os.clock();
    local v47 = v42._getLoadingTimeInfo and v42._getLoadingTimeInfo() or {};
    local l_startPage_0 = v47.startPage;
    local l_startTime_0 = v47.startTime;
    if not v10.fromRawValue(l_startPage_0) or type(l_startTime_0) ~= "number" then
        v12:warning("Cannot report loading time: incorrect startPage or startTime");
        return;
    else
        local v50 = (v46 - l_startTime_0) * 1000;
        local v51 = v10[l_startPage_0].rawValue();
        local v52 = v43 .. "_" .. v51;
        local v53 = {
            startPage = v51, 
            loadingTime = v50, 
            uid = v42.localUserId
        };
        v12:info("pageLoaded in " .. v50 .. "ms");
        v42._diagImpl:reportStats(v52, v50);
        v42._eventStreamImpl:setRBXEventStream(v42.BASE_CONTEXT, v44, v53);
        return;
    end;
end;
v13._reportPagePerformanceOnceCheck = function(v54, v55) --[[ Line: 200 ]] --[[ Name: _reportPagePerformanceOnceCheck ]]
    if v54._reportedPagePerformanceOnce[v55] then
        return true;
    else
        v54._reportedPagePerformanceOnce[v55] = true;
        return false;
    end;
end;
v13.pageMountingTimeReport = function(v56, v57) --[[ Line: 208 ]] --[[ Name: pageMountingTimeReport ]]
    -- upvalues: v13 (copy)
    if v56:_reportPagePerformanceOnceCheck("pageMountingTime") then
        return;
    else
        v56:_pagePerformanceReport(v13.DiagStats.MountingPageTime, "pageMountingTime", v57);
        return;
    end;
end;
v13.pageLoadingTimeReport = function(v58, v59) --[[ Line: 216 ]] --[[ Name: pageLoadingTimeReport ]]
    -- upvalues: v13 (copy)
    if v58:_reportPagePerformanceOnceCheck("pageLoadingTime") then
        return;
    else
        v58:_pagePerformanceReport(v13.DiagStats.LoadingPageTime, "pageLoadingTime", v59);
        return;
    end;
end;
v13.reportAddFriendsEntrypoint = function(v60, v61, v62) --[[ Line: 224 ]] --[[ Name: reportAddFriendsEntrypoint ]]
    -- upvalues: v13 (copy), l_AppPage_0 (copy)
    assert(v13.Navigation[v61] ~= nil, "invalid screen");
    if v61 == l_AppPage_0.Home then
        v60._eventStreamImpl:setRBXEventStream("addUniversalFriends", "buttonClick", {
            btn = "LegacyAddFriendsButton", 
            absolutePosition = 1, 
            showContactImporterModal = if v62 then v62.showContactImporterModal else nil
        });
    end;
    v60._diagImpl:reportCounter(v13.Navigation[v61], 1);
end;
v13.impressionEvent = function(v63, v64, v65) --[[ Line: 236 ]] --[[ Name: impressionEvent ]]
    -- upvalues: v9 (copy)
    assert(v9.isEnumValue(v64), "invalid impression name used");
    v63._eventStreamImpl:setRBXEventStream("addUniversalFriends", v64:rawValue(), v65);
    v63._diagImpl:reportCounter(v64:rawValue(), 1);
end;
return v13;