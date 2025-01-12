local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_AbuseReportMenu_0 = require(l_RobloxGui_0.Modules.AbuseReportMenu).AbuseReportMenu;
local l_ReportAbuseAnalytics_0 = require(l_RobloxGui_0.Modules.AbuseReportMenu).ReportAbuseAnalytics;
local v7 = nil;
local v8 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 16 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v11 = l_status_0 and l_result_0;
v7 = (function() --[[ Line: 23 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), v4 (copy), v8 (copy), v11 (copy), v3 (copy), l_AbuseReportMenu_0 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0._onHiddenCallback = function() --[[ Line: 27 ]]

    end;
    l_NewPage_0._onDisplayedCallback = function() --[[ Line: 28 ]]

    end;
    l_NewPage_0._onSettingsHiddenCallback = function() --[[ Line: 29 ]]

    end;
    l_NewPage_0._setNextPlayerToReportCallback = function() --[[ Line: 30 ]]

    end;
    l_NewPage_0._onMenuWidthChange = function() --[[ Line: 31 ]]

    end;
    l_NewPage_0.SetHub = function(_, v14) --[[ Line: 33 ]] --[[ Name: SetHub ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef = v14;
        l_NewPage_0.HubRef.SettingsShowSignal:connect(function(v15) --[[ Line: 37 ]]
            -- upvalues: l_NewPage_0 (ref)
            if not v15 then
                l_NewPage_0:onSettingsHidden();
            end;
        end);
        return l_NewPage_0;
    end;
    l_NewPage_0.showAlert = function(_, v17, v18, v19) --[[ Line: 46 ]] --[[ Name: showAlert ]]
        -- upvalues: v4 (ref), l_NewPage_0 (copy)
        v4:ShowAlert(v17, v18, l_NewPage_0.HubRef, v19);
    end;
    l_NewPage_0.showReportSentPage = function(_, v21) --[[ Line: 50 ]] --[[ Name: showReportSentPage ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef.ReportSentPageV2:ShowReportedPlayer(v21, true);
    end;
    l_NewPage_0.HideMenu = function(_) --[[ Line: 54 ]] --[[ Name: HideMenu ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SetVisibility(false, true);
    end;
    l_NewPage_0.ShowMenu = function(_) --[[ Line: 58 ]] --[[ Name: ShowMenu ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SetVisibility(true, true, l_NewPage_0, nil, "ScreenshotUnhide");
    end;
    l_NewPage_0.onHidden = function(_) --[[ Line: 62 ]] --[[ Name: onHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onHiddenCallback();
    end;
    l_NewPage_0.onSettingsHidden = function(_) --[[ Line: 66 ]] --[[ Name: onSettingsHidden ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onSettingsHiddenCallback();
    end;
    l_NewPage_0.onDisplayed = function(_) --[[ Line: 70 ]] --[[ Name: onDisplayed ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onDisplayedCallback();
    end;
    l_NewPage_0.setNextPlayerToReport = function(_, v28) --[[ Line: 74 ]] --[[ Name: setNextPlayerToReport ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._setNextPlayerToReportCallback(v28);
    end;
    l_NewPage_0.TabHeader.Name = "ReportAbuseTab";
    if v8.UIBloxThemeEnabled then
        local v29 = v8.Images["icons/actions/feedback"];
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectOffset = v29.ImageRectOffset;
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectSize = v29.ImageRectSize;
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = v29.Image;
        l_NewPage_0.TabHeader.TabLabel.Title.Text = "Report";
    else
        l_NewPage_0.TabHeader.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/ReportAbuseTab.png";
        if v11 then
            l_NewPage_0.TabHeader.Title.Text = "Report";
        else
            l_NewPage_0.TabHeader.Icon.Title.Text = "Report";
        end;
    end;
    l_NewPage_0.Page.Name = "ReportAbuseMenuNewContainerPage";
    l_NewPage_0.ShouldShowBottomBar = true;
    l_NewPage_0.ShouldShowHubBar = true;
    local v37 = v3.createElement(l_AbuseReportMenu_0, {
        hideReportTab = function() --[[ Line: 102 ]] --[[ Name: hideReportTab ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:HideMenu();
        end, 
        showReportTab = function() --[[ Line: 105 ]] --[[ Name: showReportTab ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:ShowMenu();
        end, 
        registerOnReportTabHidden = function(v30) --[[ Line: 108 ]] --[[ Name: registerOnReportTabHidden ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onHiddenCallback = v30;
        end, 
        registerOnReportTabDisplayed = function(v31) --[[ Line: 111 ]] --[[ Name: registerOnReportTabDisplayed ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onDisplayedCallback = v31;
        end, 
        registerOnMenuWidthChange = function(v32) --[[ Line: 114 ]] --[[ Name: registerOnMenuWidthChange ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onMenuWidthChange = v32;
        end, 
        registerSetNextPlayerToReport = function(v33) --[[ Line: 117 ]] --[[ Name: registerSetNextPlayerToReport ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._setNextPlayerToReportCallback = v33;
        end, 
        registerOnSettingsHidden = function(v34) --[[ Line: 120 ]] --[[ Name: registerOnSettingsHidden ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0._onSettingsHiddenCallback = v34;
        end, 
        showReportSentPage = function(v35) --[[ Line: 123 ]] --[[ Name: showReportSentPage ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:showReportSentPage(v35);
        end, 
        onReportComplete = function(v36) --[[ Line: 126 ]] --[[ Name: onReportComplete ]]
            -- upvalues: l_NewPage_0 (copy)
            l_NewPage_0:showAlert(v36, "Ok", function() --[[ Line: 127 ]]
                -- upvalues: l_NewPage_0 (ref)
                l_NewPage_0:HideMenu();
            end);
        end
    });
    v3.mount(v37, l_NewPage_0.Page, "AbuseReportMenu");
    l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 0);
    l_NewPage_0.Page.AutomaticSize = Enum.AutomaticSize.Y;
    l_NewPage_0.Page:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 142 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0._onMenuWidthChange(l_NewPage_0.Page.AbsoluteSize.X);
    end);
    return l_NewPage_0;
end)();
v7.Displayed.Event:connect(function() --[[ Line: 152 ]]
    -- upvalues: v7 (ref)
    v7:onDisplayed();
end);
v7.Hidden.Event:connect(function() --[[ Line: 156 ]]
    -- upvalues: v7 (ref)
    v7:onHidden();
end);
v7.ReportPlayer = function(_, v39, v40) --[[ Line: 160 ]] --[[ Name: ReportPlayer ]]
    -- upvalues: l_ReportAbuseAnalytics_0 (copy), v7 (ref)
    if v39 then
        l_ReportAbuseAnalytics_0:startAbuseReportSession(v40);
        v7:setNextPlayerToReport(v39);
        if not v7.HubRef:GetVisibility() then
            v7.HubRef:SetVisibility(true, false, v7);
            return;
        else
            v7.HubRef:SwitchToPage(v7, false, nil, nil, nil, {
                entrypoint = l_ReportAbuseAnalytics_0:getAbuseReportSessionEntryPoint()
            });
        end;
    end;
end;
return v7;