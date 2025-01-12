local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v8 = {};
v8.__index = v8;
v8.__tostring = function() --[[ Line: 16 ]]
    return "Service(Analytics)";
end;
v8.new = function(v9, v10) --[[ Line: 22 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), l_EventStream_0 (copy), l_RbxAnalyticsService_0 (copy), l_Players_0 (copy), l_UserInputService_0 (copy), l_HttpService_0 (copy), l_RunService_0 (copy)
    local v11 = {};
    setmetatable(v11, v8);
    v11.eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0);
    v11.pid = tostring(game.PlaceId);
    v11.uid = tostring(l_Players_0.LocalPlayer.UserId);
    v11.feature = "inspectAndBuy";
    v11.inspecteeUid = v9;
    v11.ctx = v10;
    v11.reportOpenInspectMenu = function() --[[ Line: 34 ]] --[[ Name: reportOpenInspectMenu ]]
        -- upvalues: v11 (copy)
        v11:report("inspectUser", {});
    end;
    v11.reportTryOnButtonClicked = function(v12, v13) --[[ Line: 41 ]] --[[ Name: reportTryOnButtonClicked ]]
        -- upvalues: v11 (copy)
        local v14 = {
            itemType = v12, 
            itemID = v13
        };
        v11:report("tryItem", v14);
    end;
    v11.reportFavoriteItem = function(v15, v16, v17, v18, v19, v20) --[[ Line: 51 ]] --[[ Name: reportFavoriteItem ]]
        -- upvalues: v11 (copy)
        local v21 = {
            itemType = v15, 
            itemID = v16, 
            favorite = v17, 
            success = v18, 
            failureReason = v19, 
            favoriteCount = v20
        };
        v11:report("favoriteItem", v21);
    end;
    v11.reportPurchaseAttempt = function(v22, v23) --[[ Line: 65 ]] --[[ Name: reportPurchaseAttempt ]]
        -- upvalues: v11 (copy)
        local v24 = {
            itemType = v22, 
            itemID = v23
        };
        v11:report("purchaseAttemptItem", v24);
    end;
    v11.reportPurchaseSuccess = function(v25, v26) --[[ Line: 75 ]] --[[ Name: reportPurchaseSuccess ]]
        -- upvalues: v11 (copy)
        local v27 = {
            itemType = v25, 
            itemID = v26
        };
        v11:report("purchaseSuccessItem", v27);
    end;
    v11.reportItemDetailPageOpened = function(v28, v29) --[[ Line: 89 ]] --[[ Name: reportItemDetailPageOpened ]]
        -- upvalues: v11 (copy)
        local v30 = {
            itemType = v28, 
            itemID = v29
        };
        v11:report("itemDetailView", v30);
    end;
    v11.platformStr = (function() --[[ Line: 99 ]] --[[ Name: getPlatformString ]]
        -- upvalues: l_UserInputService_0 (ref), l_HttpService_0 (ref)
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v32 = "Unknown";
        if l_l_UserInputService_0_Platform_0 == Enum.Platform.Windows then
            return "Windows";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
            return "OSX";
        elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.IOS then
            return "IOS";
        else
            if l_l_UserInputService_0_Platform_0 == Enum.Platform.Android then
                local l_l_HttpService_0_UserAgent_0 = l_HttpService_0:GetUserAgent();
                v32 = string.find(l_l_HttpService_0_UserAgent_0, "AmazonAppStore") and "Amazon" or "Android";
                if string.find(l_l_HttpService_0_UserAgent_0, "OculusQuest3Store") then
                    return "Quest";
                end;
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBox360 then
                return "XBox";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.UWP then
                return "UWP";
            elseif l_l_UserInputService_0_Platform_0 == Enum.Platform.PS4 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS3 or l_l_UserInputService_0_Platform_0 == Enum.Platform.PS5 then
                v32 = "PlayStation";
            end;
            return v32;
        end;
    end)();
    v11.sendCounter = function(v34) --[[ Line: 132 ]] --[[ Name: sendCounter ]]
        -- upvalues: l_RunService_0 (ref), v11 (copy), l_RbxAnalyticsService_0 (ref)
        if l_RunService_0:IsStudio() then
            return;
        else
            local v35 = "inspectAndBuy" .. "_" .. v11.platformStr .. "_" .. v34;
            l_RbxAnalyticsService_0:ReportCounter(v35);
            return;
        end;
    end;
    return v11;
end;
v8.report = function(v36, v37, v38) --[[ Line: 144 ]] --[[ Name: report ]]
    -- upvalues: v3 (copy)
    local v39 = {
        pid = v36.pid, 
        uid = v36.uid, 
        inspecteeUid = v36.inspecteeUid, 
        feature = "inspectAndBuy"
    };
    local v40 = v3.Dictionary.join(v39, v38);
    v36.eventStream:sendEventDeferred(v36.ctx, v37, v40);
end;
return v8;