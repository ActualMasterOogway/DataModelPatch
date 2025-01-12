local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Thunks.RetrieveCaptures);
local _ = require(l_Parent_0.Types);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: l_CaptureService_0 (copy), v2 (copy)
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: l_CaptureService_0 (ref), v4 (copy), v2 (ref)
        l_CaptureService_0:DeleteCapture(v4.filePath);
        v5:dispatch(v2());
    end;
end;