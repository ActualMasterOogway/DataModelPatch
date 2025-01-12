local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Models.BundleInfo);
local v6 = require(l_Parent_0.Services.Network);
local v7 = require(l_Parent_0.Actions.SetAssets);
local v8 = require(l_Parent_0.Actions.SetBundles);
local v9 = require(l_Parent_0.createInspectAndBuyKeyMapper);
local v10 = require(l_Parent_0.Thunks.SendCounter);
local v11 = require(l_Parent_0.Constants);
local v12 = {
    v6
};
local v13 = v9("getItemDetails");
return function(v14, v15) --[[ Line: 23 ]] --[[ Name: GetItemDetails ]]
    -- upvalues: v3 (copy), v12 (copy), v6 (copy), v13 (copy), l_PerformFetch_0 (copy), v4 (copy), v7 (copy), v5 (copy), v8 (copy), v10 (copy), v11 (copy)
    return v3.new(script.Name, v12, function(v16, v17) --[[ Line: 24 ]]
        -- upvalues: v6 (ref), v13 (ref), v14 (copy), v15 (copy), l_PerformFetch_0 (ref), v4 (ref), v7 (ref), v5 (ref), v8 (ref), v10 (ref), v11 (ref)
        local v18 = v17[v6];
        local v19 = v13(v16:getState().storeId, v14, v15);
        return l_PerformFetch_0.Single(v19, function() --[[ Line: 29 ]]
            -- upvalues: v18 (copy), v14 (ref), v15 (ref), v4 (ref), v16 (copy), v7 (ref), v5 (ref), v8 (ref), v10 (ref), v11 (ref)
            return v18.getItemDetails(v14, v15):andThen(function(v20) --[[ Line: 30 ]]
                -- upvalues: v15 (ref), v4 (ref), v16 (ref), v7 (ref), v5 (ref), v8 (ref), v10 (ref), v11 (ref)
                if v15 == Enum.AvatarItemType.Asset then
                    local v21 = v4.fromGetItemDetails(v20);
                    v16:dispatch(v7({
                        v21
                    }));
                elseif v15 == Enum.AvatarItemType.Bundle then
                    local v22 = v5.fromGetItemDetails(v20);
                    v16:dispatch(v8({
                        v22
                    }));
                else
                    v16:dispatch(v10(v11.Counters.GetItemDetailsRespondedWithUnknownItemType));
                end;
                v16:dispatch(v10(v11.Counters.GetItemDetails .. v11.CounterSuffix.RequestSucceeded));
            end, function(_) --[[ Line: 44 ]]
                -- upvalues: v16 (ref), v10 (ref), v11 (ref)
                v16:dispatch(v10(v11.Counters.GetItemDetails .. v11.CounterSuffix.RequestRejected));
            end);
        end)(v16):catch(function(_) --[[ Line: 49 ]]
            -- upvalues: v16 (copy), v10 (ref), v11 (ref)
            v16:dispatch(v10(v11.Counters.GetItemDetails .. v11.CounterSuffix.RequestFailed));
        end);
    end);
end;