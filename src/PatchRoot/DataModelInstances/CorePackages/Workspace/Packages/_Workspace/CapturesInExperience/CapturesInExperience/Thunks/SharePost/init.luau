local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Players_0 = game:GetService("Players");
local l_default_0 = require(l_Parent_1.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.Utils.getLocalUserId);
local v6 = require(l_Parent_0.App.Networking);
local l_NetworkingShareLinks_0 = v6.NetworkingShareLinks;
local l_LinkType_0 = v6.RoduxShareLinks.Enums.LinkType;
return function(v9) --[[ Line: 18 ]]
    -- upvalues: l_LinkType_0 (copy), v5 (copy), l_Players_0 (copy), l_NetworkingShareLinks_0 (copy), l_default_0 (copy), v4 (copy)
    return function(v10) --[[ Line: 19 ]]
        -- upvalues: l_LinkType_0 (ref), v5 (ref), l_Players_0 (ref), v9 (copy), l_NetworkingShareLinks_0 (ref), l_default_0 (ref), v4 (ref)
        local v11 = {
            linkType = l_LinkType_0.ContentPost.rawValue(), 
            postCreatorId = v5(l_Players_0), 
            postId = v9
        };
        v10:dispatch(l_NetworkingShareLinks_0.GetOrGenerateLink.API(v11)):andThen(function(v12) --[[ Line: 28 ]]
            -- upvalues: l_default_0 (ref), v4 (ref)
            local l_shortUrl_0 = v12.responseBody.shortUrl;
            if not l_default_0 then
                return;
            else
                assert(l_default_0 ~= nil, "ExternalContentSharingProtocol is required");
                l_default_0:shareUrl({
                    context = v4.CapturesContext, 
                    url = l_shortUrl_0
                });
                return;
            end;
        end):catch(function(v14) --[[ Line: 41 ]]
            warn("GenerateLink failed with error:", v14);
        end);
    end;
end;