return function(v0) --[[ Line: 1 ]]
    local function _() --[[ Line: 2 ]] --[[ Name: isQQ ]]
        -- upvalues: v0 (copy)
        return string.find(v0.fromString("corp:")(), "qq.com");
    end;
    return {
        catalog = v0.fromString("www:catalog"), 
        buildersClub = v0.fromString("www:mobile-app-upgrades/native-ios/bc"), 
        trades = v0.fromString("www:trades"), 
        profile = v0.fromString("www:users/profile"), 
        friends = v0.fromString("www:users/friends"), 
        groups = v0.fromString("www:my/communities"), 
        inventory = v0.fromString("www:users/inventory"), 
        messages = v0.fromString("www:my/messages"), 
        feed = v0.fromString("www:feeds/inapp"), 
        develop = v0.fromString("www:develop"), 
        creatorHub = v0.fromString("create:"), 
        blog = v0.fromString("blog:"), 
        giftCards = function(v2) --[[ Line: 19 ]] --[[ Name: giftCards ]]
            -- upvalues: v0 (copy)
            local v3 = v2 or "";
            return v0.fromString("www:giftcards?ref={source}")({
                source = v3
            });
        end, 
        amazonStore = v0.fromString("https://www.amazon.com/roblox"), 
        help = v0.fromString(string.find(v0.fromString("corp:")(), "qq.com") and "corp:faq" or "www:help"), 
        appealsPortal = {
            main = v0.fromString("www:report-appeals?t_source={source|app}"), 
            violation = v0.fromString("www:report-appeals?vid={id}&t_source={source|app}")
        }, 
        email = {
            getSetEmail = v0.fromString("accountSettings:v1/email"), 
            sendVerificationEmail = v0.fromString("accountSettings:v1/email/verify")
        }, 
        about = {
            us = function(v4) --[[ Line: 38 ]] --[[ Name: us ]]
                -- upvalues: v0 (copy)
                local v5 = v4 or "";
                return v0.fromString("www:info/about-us?locale={localeCode}")({
                    localeCode = v5
                });
            end, 
            careers = function(v6) --[[ Line: 42 ]] --[[ Name: careers ]]
                -- upvalues: v0 (copy)
                if string.find(v0.fromString("corp:")(), "qq.com") then
                    return v0.fromString("corp:careers.html");
                else
                    local v7 = v6 or "";
                    return v0.fromString("www:info/jobs?locale={localeCode}")({
                        localeCode = v7
                    });
                end;
            end, 
            parents = function(v8) --[[ Line: 50 ]] --[[ Name: parents ]]
                -- upvalues: v0 (copy)
                local v9 = v8 or "";
                return v0.fromString("www:info/parents?locale={localeCode}")({
                    localeCode = v9
                });
            end, 
            terms = function(v10) --[[ Line: 54 ]] --[[ Name: terms ]]
                -- upvalues: v0 (copy)
                if string.find(v0.fromString("corp:")(), "qq.com") and v10.useGameQQUrls then
                    return v0.fromString("https://game.qq.com/contract.shtml")();
                else
                    return v0.fromString("www:info/terms")();
                end;
            end, 
            privacy = function(v11) --[[ Line: 61 ]] --[[ Name: privacy ]]
                -- upvalues: v0 (copy)
                if string.find(v0.fromString("corp:")(), "qq.com") and v11.useGameQQUrls then
                    return v0.fromString("https://game.qq.com/privacy_guide.shtml")();
                else
                    return v0.fromString("www:info/privacy")();
                end;
            end, 
            guidelines = v0.fromString("www:info/community-guidelines"), 
            support = v0.fromString("www:support")
        }, 
        settings = {
            account = v0.fromString("www:my/account#!/info"), 
            security = v0.fromString("www:my/account#!/security"), 
            privacy = v0.fromString("www:my/account#!/privacy"), 
            parentalControls = v0.fromString("www:my/account#!/parental-controls"), 
            billing = v0.fromString("www:my/account#!/billing"), 
            subscriptions = v0.fromString("www:my/account#!/subscriptions"), 
            notifications = v0.fromString("www:my/account#!/notifications")
        }, 
        tencent = {
            childrenPrivacyGuide = v0.fromString("https://game.qq.com/privacy_guide_children.shtml"), 
            luobuRiderTerms = v0.fromString("https://roblox.qq.com/web201904/newsdetail.html?newsid=12429812"), 
            reputationInfo = v0.fromString("https://gamecredit.qq.com/static/games/index.htm"), 
            luobuThirdPartyDataUse = v0.fromString("https://game.qq.com/zlkdatasys/privacy_SDK.html")
        }, 
        idVerification = {
            verify = v0.fromString("www:id-verification/verify"), 
            getAge = v0.fromString("apis:age-verification-service/v1/age-verification/get-verified-age")
        }, 
        notifications = {
            clearUnread = v0.fromString("notifications:stream-notifications/clear-unread"), 
            unreadCount = v0.fromString("notifications:stream-notifications/unread-count")
        }, 
        securityAlert = v0.fromString("www:security-feedback?payload={payload}&username={username}")
    };
end;