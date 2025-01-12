local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Services.CaptureService);
local v2 = require(l_Parent_0.Enums.CapturesToastType);
local v3 = require(l_Parent_0.Actions.ToastTriggered);
local _ = require(l_Parent_0.Types);
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    return function(v6) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), v5 (copy), v3 (ref), v2 (ref)
        v1:SaveCaptureToExternalStorage(v5.filePath);
        v6:dispatch(v3(v2.CaptureSavedToDevice));
    end;
end;