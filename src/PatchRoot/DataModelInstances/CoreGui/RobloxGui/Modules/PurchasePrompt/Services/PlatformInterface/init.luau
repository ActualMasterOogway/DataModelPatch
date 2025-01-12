local l_Parent_0 = script.Parent.Parent;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_GuiService_0 = game:GetService("GuiService");
local v4 = require(l_Parent_0.Utils.Base64);
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v6 = nil;
pcall(function() --[[ Line: 11 ]]
    -- upvalues: v6 (ref)
    v6 = game:GetService("PlatformService");
end);
local l_GetFStringVNGWebshopUrl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringVNGWebshopUrl;
local l_FFlagEnablePreSignedVngShopRedirectUrl_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePreSignedVngShopRedirectUrl;
local l_UrlBuilder_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptDeps).UrlBuilder.UrlBuilder;
local v10 = string.gsub(l_ContentProvider_0.BaseUrl:lower(), "/m.", "/www.");
return {
    new = function() --[[ Line: 27 ]] --[[ Name: new ]]
        -- upvalues: l_MarketplaceService_0 (copy), v10 (copy), l_GuiService_0 (copy), v4 (copy), l_UrlBuilder_0 (copy), v6 (ref), l_FFlagEnablePreSignedVngShopRedirectUrl_0 (copy), l_GetFStringVNGWebshopUrl_0 (copy)
        local v11 = {};
        setmetatable(v11, {
            __tostring = function() --[[ Line: 31 ]] --[[ Name: __tostring ]]
                return "Service(PlatformInterface)";
            end
        });
        v11.signalMockPurchasePremium = function() --[[ Line: 36 ]] --[[ Name: signalMockPurchasePremium ]]
            -- upvalues: l_MarketplaceService_0 (ref)
            l_MarketplaceService_0:SignalMockPurchasePremium();
        end;
        v11.startPremiumUpsell = function(v12) --[[ Line: 40 ]] --[[ Name: startPremiumUpsell ]]
            -- upvalues: v10 (ref), l_GuiService_0 (ref)
            local v13 = ("%supgrades/paymentmethods?ap=%d"):format(v10, v12);
            l_GuiService_0:OpenBrowserWindow(v13);
        end;
        v11.startRobuxUpsellWeb = function(v14) --[[ Line: 46 ]] --[[ Name: startRobuxUpsellWeb ]]
            -- upvalues: l_GuiService_0 (ref), v10 (ref)
            if v14 then
                l_GuiService_0:OpenBrowserWindow(("%supgrades/paymentmethods?ap=%s"):format(v10, v14));
                return;
            else
                l_GuiService_0:OpenBrowserWindow(("%sUpgrades/Robux.aspx"):format(v10));
                return;
            end;
        end;
        v11.openSecuritySettings = function(v15) --[[ Line: 54 ]] --[[ Name: openSecuritySettings ]]
            -- upvalues: v4 (ref), v10 (ref), l_GuiService_0 (ref)
            if v15 then
                local v16 = v4.Encode(v15);
                local v17 = ("%smy/account?challenge=%s#!/security"):format(v10, v16);
                l_GuiService_0:OpenBrowserWindow(v17);
                return;
            else
                local v18 = ("%smy/account#!/security"):format(v10);
                l_GuiService_0:OpenBrowserWindow(v18);
                return;
            end;
        end;
        v11.openTermsOfUse = function() --[[ Line: 68 ]] --[[ Name: openTermsOfUse ]]
            -- upvalues: l_UrlBuilder_0 (ref), l_GuiService_0 (ref)
            local v19 = l_UrlBuilder_0.static.about.terms();
            l_GuiService_0:OpenBrowserWindow(v19);
        end;
        v11.openRobuxStore = function() --[[ Line: 74 ]] --[[ Name: openRobuxStore ]]
            -- upvalues: l_GuiService_0 (ref), v10 (ref)
            l_GuiService_0:OpenBrowserWindow(("%sUpgrades/Robux.aspx"):format(v10));
        end;
        v11.promptNativePurchaseWithLocalPlayer = function(v20) --[[ Line: 78 ]] --[[ Name: promptNativePurchaseWithLocalPlayer ]]
            -- upvalues: l_MarketplaceService_0 (ref)
            return l_MarketplaceService_0:PromptNativePurchaseWithLocalPlayer(v20);
        end;
        v11.promptNativePurchase = function(v21, v22) --[[ Line: 82 ]] --[[ Name: promptNativePurchase ]]
            -- upvalues: l_MarketplaceService_0 (ref)
            return l_MarketplaceService_0:PromptNativePurchase(v21, v22);
        end;
        v11.beginPlatformStorePurchase = function(v23) --[[ Line: 86 ]] --[[ Name: beginPlatformStorePurchase ]]
            -- upvalues: v6 (ref)
            return v6:BeginPlatformStorePurchase(v23);
        end;
        v11.openVngStore = function(v24) --[[ Line: 90 ]] --[[ Name: openVngStore ]]
            -- upvalues: l_FFlagEnablePreSignedVngShopRedirectUrl_0 (ref), l_GetFStringVNGWebshopUrl_0 (ref), l_GuiService_0 (ref)
            if l_FFlagEnablePreSignedVngShopRedirectUrl_0 then
                if not v24 or v24 == "" then
                    v24 = l_GetFStringVNGWebshopUrl_0();
                end;
                l_GuiService_0:OpenBrowserWindow(v24);
                return;
            else
                l_GuiService_0:OpenBrowserWindow(l_GetFStringVNGWebshopUrl_0());
                return;
            end;
        end;
        return v11;
    end
};