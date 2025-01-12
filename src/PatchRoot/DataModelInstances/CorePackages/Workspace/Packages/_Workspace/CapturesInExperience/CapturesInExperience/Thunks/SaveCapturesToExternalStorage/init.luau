local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Enums.CapturesToastType);
local v3 = require(l_Parent_0.Actions.ToastTriggered);
local _ = require(l_Parent_0.Types);
return function(v5) --[[ Line: 10 ]]
    -- upvalues: l_CaptureService_0 (copy), v3 (copy), v2 (copy)
    local v6 = {};
    for _, v8 in v5 do
        table.insert(v6, v8.filePath);
    end;
    return function(v9) --[[ Line: 16 ]]
        -- upvalues: l_CaptureService_0 (ref), v6 (copy), v3 (ref), v2 (ref)
        l_CaptureService_0:SaveCapturesToExternalStorageAsync(v6);
        v9:dispatch(v3(v2.CaptureSavedToDevice));
    end;
end;