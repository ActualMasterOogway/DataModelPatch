local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.ArgCheck);
local l_CollectionHeader_0 = require(l_Parent_0.CollectionViews).CollectionHeader;
local l_SearchSourceEvent_0 = require(l_Parent_0.DiscoveryTypes).SearchSourceEvent;
local l_FFlagLuaAppUpdateCollectionHeader_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUpdateCollectionHeader;
local v7 = require(script.Parent.Context);
return function(v8) --[[ Line: 22 ]] --[[ Name: SearchSelectionTypeHeader ]]
    -- upvalues: v1 (copy), v7 (copy), v3 (copy), v2 (copy), l_CollectionHeader_0 (copy), l_SearchSourceEvent_0 (copy), l_FFlagLuaAppUpdateCollectionHeader_0 (copy)
    local v9 = v1.useContext(v7);
    v3.assert(v9 ~= nil, "Using selection header component outside of SearchTypeSelection context");
    if not v9 then
        return nil;
    else
        local v10 = v9.selections or {};
        local v12 = v2.List.filter(v10, function(v11) --[[ Line: 32 ]]
            -- upvalues: v8 (copy)
            return v11 and v11.name == v8.selectionType;
        end)[1];
        v3.assert(v12 ~= nil, "Trying to navigate to non existing selection");
        if not v12 then
            return nil;
        else
            return v1.createElement(l_CollectionHeader_0, {
                LayoutOrder = v8.LayoutOrder, 
                title = v12.text, 
                onActivate = function() --[[ Line: 44 ]] --[[ Name: onActivate ]]
                    -- upvalues: v12 (copy), l_SearchSourceEvent_0 (ref)
                    if v12.onActivated then
                        v12.onActivated(l_SearchSourceEvent_0.SeeAll);
                    end;
                end, 
                shouldUseGridPageLayout_legacy = not l_FFlagLuaAppUpdateCollectionHeader_0 or nil
            });
        end;
    end;
end;