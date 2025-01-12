local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_NetworkingFriends_0 = v1.NetworkingFriends;
local _ = require(l_Parent_0.Common.LocalTypes);
local l_NetworkingContacts_0 = v1.NetworkingContacts;
local l_NetworkingUserSettings_0 = v1.NetworkingUserSettings;
local l_RoduxContacts_0 = v1.RoduxContacts;
local l_Promise_0 = v1.Promise;
local l_llama_0 = v1.llama;
return function(v9) --[[ Line: 11 ]]
    -- upvalues: l_NetworkingFriends_0 (copy), l_NetworkingContacts_0 (copy), l_llama_0 (copy), l_Promise_0 (copy), l_NetworkingUserSettings_0 (copy), l_RoduxContacts_0 (copy)
    return {
        requestFriendship = function(v10) --[[ Line: 13 ]] --[[ Name: requestFriendship ]]
            -- upvalues: v9 (copy), l_NetworkingFriends_0 (ref)
            return v9(l_NetworkingFriends_0.RequestFriendshipFromContactId.API(v10));
        end, 
        findContacts = function() --[[ Line: 16 ]] --[[ Name: findContacts ]]
            -- upvalues: v9 (copy), l_NetworkingContacts_0 (ref)
            return v9(l_NetworkingContacts_0.FindContactFriends.API()):andThen(function(v11) --[[ Line: 17 ]]
                return v11.responseBody.userContactIds;
            end);
        end, 
        getContactEntities = function(v12) --[[ Line: 21 ]] --[[ Name: getContactEntities ]]
            -- upvalues: l_llama_0 (ref), l_Promise_0 (ref), v9 (copy), l_NetworkingContacts_0 (ref)
            if l_llama_0.isEmpty(v12) or not v12 then
                return l_Promise_0.resolve();
            else
                return v9(l_NetworkingContacts_0.GetContactEntitiesByContactId.API(v12));
            end;
        end, 
        uploadContacts = function(v13) --[[ Line: 28 ]] --[[ Name: uploadContacts ]]
            -- upvalues: v9 (copy), l_NetworkingContacts_0 (ref)
            return v9(l_NetworkingContacts_0.UploadContactsByUser.API(v13));
        end, 
        updateUserSettings = function() --[[ Line: 31 ]] --[[ Name: updateUserSettings ]]
            -- upvalues: v9 (copy), l_NetworkingUserSettings_0 (ref)
            return v9(l_NetworkingUserSettings_0.UpdateUserSettings.API({
                canUploadContacts = true
            }));
        end, 
        deviceContactsReceived = function(v14) --[[ Line: 34 ]] --[[ Name: deviceContactsReceived ]]
            -- upvalues: v9 (copy), l_RoduxContacts_0 (ref)
            return v9(l_RoduxContacts_0.Actions.DeviceContactsReceived(v14));
        end, 
        requestSent = function(v15) --[[ Line: 37 ]] --[[ Name: requestSent ]]
            -- upvalues: v9 (copy), l_RoduxContacts_0 (ref)
            return v9(l_RoduxContacts_0.Actions.RequestSent({
                id = v15
            }));
        end
    };
end;