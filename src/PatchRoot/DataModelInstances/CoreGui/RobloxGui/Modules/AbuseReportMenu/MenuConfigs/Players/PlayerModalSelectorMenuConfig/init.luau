local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v4 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.Constants);
local l_InExperienceCapabilities_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities;
local v8 = require(l_script_FirstAncestor_0.Flags.GetFFlagAbuseReportShouldUseCanDisplayPeoplesUsernamesAppPolicy);
return {
    componentType = "modalSelector", 
    getIsVisible = function(_) --[[ Line: 15 ]] --[[ Name: getIsVisible ]]
        return true;
    end, 
    getMenuItems = function(v10) --[[ Line: 18 ]] --[[ Name: getMenuItems ]]
        -- upvalues: v2 (copy), v4 (copy), v3 (copy), v8 (copy), l_InExperienceCapabilities_0 (copy)
        return (v2.List.map(v10.playerObjects, function(v11) --[[ Line: 19 ]]
            -- upvalues: v4 (ref), v3 (ref), v8 (ref), l_InExperienceCapabilities_0 (ref)
            local v12 = if v4.Utils.isPlayerVerified(v11) then v3.emoji.verified else "";
            if v8() then
                return {
                    label = v11.DisplayName .. v12, 
                    subLabel = if l_InExperienceCapabilities_0.canDisplayPeoplesUsernames then "[@" .. v11.Name .. "]" else nil, 
                    identifier = v11.Name
                };
            else
                return {
                    label = v11.DisplayName .. v12, 
                    subLabel = "[@" .. v11.Name .. "]", 
                    identifier = v11.Name
                };
            end;
        end));
    end, 
    getSelectedValue = function(v13) --[[ Line: 41 ]] --[[ Name: getSelectedValue ]]
        -- upvalues: v8 (copy), l_InExperienceCapabilities_0 (copy)
        local l_allegedAbuser_0 = v13.allegedAbuser;
        if l_allegedAbuser_0 then
            local l_DisplayName_0 = l_allegedAbuser_0.DisplayName;
            local l_Name_0 = l_allegedAbuser_0.Name;
            local v17 = l_DisplayName_0 .. "[@" .. l_Name_0 .. "]";
            if v8() then
                v17 = l_DisplayName_0 .. if l_InExperienceCapabilities_0.canDisplayPeoplesUsernames then "[@" .. l_Name_0 .. "]" else "";
            end;
            return v17;
        else
            return nil;
        end;
    end, 
    onUpdateSelectedOption = function(v18, v19, v20, v21) --[[ Line: 55 ]] --[[ Name: onUpdateSelectedOption ]]
        -- upvalues: v6 (copy)
        if v18.identifier then
            local l_identifier_0 = v18.identifier;
            for _, v24 in v19.playerObjects do
                if l_identifier_0 == v24.Name then
                    local l_UserId_0 = v24.UserId;
                    v21.analyticsDispatch({
                        type = v6.AnalyticsActions.IncrementPersonChanged
                    });
                    v20({
                        type = v6.PlayerMenuActions.UpdateAbuser, 
                        abuseId = l_UserId_0, 
                        abuser = v24
                    });
                end;
            end;
        end;
    end, 
    fieldLabel = "WhichPerson", 
    componentName = "PlayerSelector"
};