local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_ContactList_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList;
local v6 = require(l_ContactList_0.Components.ContactListContainer);
local v7 = require(l_ContactList_0.Components.CallBarContainer);
local v8 = require(l_ContactList_0.Components.CallDialogContainer);
local v9 = require(l_ContactList_0.Components.PlayerMenuContainer);
return function() --[[ Line: 18 ]]
    -- upvalues: v2 (copy), l_SoundManager_0 (copy), l_SoundGroups_0 (copy), v8 (copy), v6 (copy), v9 (copy), v7 (copy)
    v2.useEffect(function() --[[ Line: 19 ]]
        -- upvalues: l_SoundManager_0 (ref), l_SoundGroups_0 (ref)
        l_SoundManager_0:CreateSoundGroup(l_SoundGroups_0.Iris.Name);
    end, {});
    return v2.createElement("Folder", {}, {
        CallDialogContainer = v2.createElement(v8), 
        ContactListContainer = v2.createElement(v6), 
        PlayerMenuContainer = v2.createElement(v9), 
        CallBarContainer = v2.createElement(v7)
    });
end;