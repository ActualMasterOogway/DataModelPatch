local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Thunks.RetrieveCaptures);
local _ = require(l_Parent_0.Types);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: l_CaptureService_0 (copy), v2 (copy)
    local v5 = {};
    for _, v7 in ipairs(v4) do
        table.insert(v5, v7.filePath);
    end;
    return function(v8) --[[ Line: 15 ]]
        -- upvalues: l_CaptureService_0 (ref), v5 (copy), v2 (ref)
        l_CaptureService_0:DeleteCapturesAsync(v5);
        v8:dispatch(v2());
    end;
end;