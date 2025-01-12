local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppTopBanner");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_script_FirstAncestor_0.Enums.AppTopBannerType);
local v6 = require(l_script_FirstAncestor_0.Constants);
local v7 = require(l_script_FirstAncestor_0.Actions.SetAppTopBanner);
local v8 = require(l_script_FirstAncestor_0.Actions.DisableAppTopBanner);
local v9 = {
    isDisabled = v4.FFlagMoveSquadTitleFetchIntoTopBanner and true or false, 
    expanded = false, 
    appTopBannerType = v5.None, 
    appTopBannerContentProps = nil, 
    appTopBannerContentHeight = 0, 
    onAppTopBannerClick = function() --[[ Line: 41 ]] --[[ Name: onAppTopBannerClick ]]

    end
};
return v3.createReducer(v9, {
    [v7.name] = function(v10, v11) --[[ Line: 45 ]]
        -- upvalues: v2 (copy), v6 (copy), v9 (copy)
        local l_isDisabled_0 = v10.isDisabled;
        if v11.expanded then
            return (v2.Dictionary.join(v10, {
                expanded = v11.expanded, 
                appTopBannerType = v11.appTopBannerType, 
                appTopBannerContentProps = v11.appTopBannerContentProps, 
                onAppTopBannerClick = v11.onAppTopBannerClick, 
                appTopBannerContentHeight = v11.appTopBannerContentHeight or v6.CONTENT_HEIGHT, 
                isDisabled = l_isDisabled_0
            }));
        else
            if v10.expanded ~= v11.expanded then
                v10 = v2.Dictionary.join(v9, {
                    isDisabled = l_isDisabled_0
                });
            end;
            return v10;
        end;
    end, 
    [v8.name] = function(v13, v14) --[[ Line: 65 ]]
        -- upvalues: v2 (copy)
        if v13.isDisabled == v14.isDisabled then
            return v13;
        else
            return (v2.Dictionary.join(v13, {
                isDisabled = not v13.isDisabled
            }));
        end;
    end
});