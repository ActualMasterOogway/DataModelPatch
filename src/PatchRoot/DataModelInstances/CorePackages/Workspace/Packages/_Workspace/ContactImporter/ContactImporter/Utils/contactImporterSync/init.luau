local v0 = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature(v0.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS);
local v2 = require(script.Parent.Parent.Flags.getFIntContactImporterSyncMinHours);
return {
    updateSyncTimestamp = function(_, v4, v5, v6) --[[ Line: 11 ]] --[[ Name: updateSyncTimestamp ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v0 (copy)
        if not l_game_EngineFeature_0 then
            return;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 15 ]]
                -- upvalues: v4 (copy), v0 (ref)
                return v4:GetItem(v0.LOCAL_STORAGE_KEY_CONTACTS_SYNC);
            end);
            if l_status_0 then
                local v9 = "";
                if l_result_0 == "" then
                    v9 = v5 .. ":" .. tostring(v6);
                else
                    local v10 = false;
                    for v11 in string.gmatch(l_result_0 or "", "([^,]+)") do
                        local v12 = string.split(v11, ":");
                        local v13 = v12[1];
                        local v14 = tonumber(v12[2]) or 0;
                        if v13 == v5 then
                            v10 = true;
                            v14 = v6;
                        end;
                        local v15 = v13 .. ":" .. tostring(v14);
                        if v9 ~= "" then
                            v9 = v9 .. "," .. v15;
                        else
                            v9 = v15;
                        end;
                    end;
                    if not v10 then
                        v9 = v9 .. "," .. v5 .. ":" .. tostring(v6);
                    end;
                end;
                do
                    local l_v9_0 = v9;
                    pcall(function() --[[ Line: 46 ]]
                        -- upvalues: v4 (copy), v0 (ref), l_v9_0 (ref)
                        v4:SetItem(v0.LOCAL_STORAGE_KEY_CONTACTS_SYNC, l_v9_0);
                        v4:Flush();
                    end);
                end;
            end;
            return;
        end;
    end, 
    shouldSyncContacts = function(_, v18, v19, v20) --[[ Line: 53 ]] --[[ Name: shouldSyncContacts ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v0 (copy), v2 (copy)
        if not l_game_EngineFeature_0 then
            return true;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 57 ]]
                -- upvalues: v18 (copy), v0 (ref)
                return v18:GetItem(v0.LOCAL_STORAGE_KEY_CONTACTS_SYNC);
            end);
            if not l_status_1 then
                return true;
            else
                local v23 = 0;
                for v24 in string.gmatch(l_result_1 or "", "([^,]+)") do
                    local v25 = string.split(v24, ":");
                    if v25[1] == v19 then
                        v23 = tonumber(v25[2]);
                        break;
                    end;
                end;
                if v2() * 3600000 <= v20 - v23 then
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end
};