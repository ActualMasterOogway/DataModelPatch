local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local _ = require(l_Parent_0.Types);
return function(v3) --[[ Line: 6 ]] --[[ Name: getCaptureUploadData ]]
    -- upvalues: l_CaptureService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
        -- upvalues: l_CaptureService_0 (ref), v3 (copy)
        return l_CaptureService_0:GetCaptureUploadDataAsync(v3.filePath);
    end);
    if not l_status_0 then
        return nil;
    else
        return l_result_0;
    end;
end;