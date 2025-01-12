local l_Parent_0 = script:FindFirstAncestor("UnitTestHelpersJest").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_jest_0 = require(l_Parent_0.JestGlobals).jest;
return function(v3) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), l_jest_0 (copy)
    return v1.Dictionary.join({
        network = l_jest_0.fn(), 
        closeCentralOverlay = l_jest_0.fn(), 
        launchGame = l_jest_0.fn(), 
        resolveLinkFromLinkId = l_jest_0.fn().mockReturnValue({}), 
        analyticsImpls = {
            shareLinksAnalytics = {
                openAppViaShareLink = l_jest_0.fn(), 
                resolveLink = l_jest_0.fn(), 
                errorDialogButtonClick = l_jest_0.fn(), 
                errorJoinDialogButtonClick = l_jest_0.fn(), 
                gameLaunch = l_jest_0.fn()
            }
        }
    }, v3 or {});
end;