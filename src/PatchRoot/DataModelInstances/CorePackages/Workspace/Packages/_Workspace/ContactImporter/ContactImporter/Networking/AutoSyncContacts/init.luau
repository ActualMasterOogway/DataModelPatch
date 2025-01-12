local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_NetworkingContacts_0 = v1.NetworkingContacts;
local l_Promise_0 = v1.Promise;
local v4 = require(l_Parent_0.Utils.contactImporterSync);
local v5 = require(l_Parent_0.Utils.formatContacts);
return function(v6, v7, v8, v9) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), l_Promise_0 (copy), v5 (copy), l_NetworkingContacts_0 (copy)
    return function(v10) --[[ Line: 9 ]]
        -- upvalues: v4 (ref), v8 (copy), v6 (copy), v9 (copy), v7 (copy), l_Promise_0 (ref), v5 (ref), l_NetworkingContacts_0 (ref)
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        local v12 = v4:shouldSyncContacts(v8, v6, l_UnixTimestampMillis_0);
        if v9 or v12 then
            v7:supportsContacts():andThen(function(v13) --[[ Line: 15 ]]
                -- upvalues: l_Promise_0 (ref)
                if v13 then
                    return (l_Promise_0.resolve());
                else
                    return (l_Promise_0.reject());
                end;
            end):andThen(function() --[[ Line: 18 ]]
                -- upvalues: v7 (ref)
                return v7:getContacts();
            end):andThen(function(v14) --[[ Line: 21 ]]
                -- upvalues: v5 (ref), v10 (copy), l_NetworkingContacts_0 (ref)
                local v15 = v5(v14);
                return v10:dispatch(l_NetworkingContacts_0.UploadContactsByUser.API(v15));
            end):andThen(function() --[[ Line: 25 ]]
                -- upvalues: v4 (ref), v8 (ref), v6 (ref), l_UnixTimestampMillis_0 (copy)
                return v4:updateSyncTimestamp(v8, v6, l_UnixTimestampMillis_0);
            end):catch(function() --[[ Line: 28 ]]

            end);
        end;
    end;
end;