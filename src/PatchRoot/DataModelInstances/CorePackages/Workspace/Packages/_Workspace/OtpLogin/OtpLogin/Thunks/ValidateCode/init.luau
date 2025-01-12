local l_Parent_0 = script.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.dependencies).Promise;
local v2 = require(l_Parent_0.Requests.PostValidateCode);
local _ = require(l_Parent_0.Common.otpLoginTypes);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), l_Promise_0 (copy)
    return function() --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v4 (copy), v5 (copy), l_Promise_0 (ref)
        return v2(v4, v5):andThen(function(v6) --[[ Line: 9 ]]
            -- upvalues: l_Promise_0 (ref)
            return l_Promise_0.resolve(v6.responseBody);
        end):catch(function(v7) --[[ Line: 11 ]]
            -- upvalues: l_Promise_0 (ref)
            if v7.data then
                return l_Promise_0.reject(v7.data.errorCode);
            elseif v7.StatusCode then
                return l_Promise_0.reject(v7.StatusCode);
            else
                return l_Promise_0.reject();
            end;
        end);
    end;
end;