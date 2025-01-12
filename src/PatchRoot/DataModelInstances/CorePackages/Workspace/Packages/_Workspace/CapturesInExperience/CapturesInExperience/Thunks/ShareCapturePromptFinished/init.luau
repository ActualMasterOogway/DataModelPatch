local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Enums.ExternalShareSourceType);
local v3 = require(l_Parent_0.Actions.PromptDismissed);
local v4 = require(l_Parent_0.Thunks.ShareCapture);
local v5 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
return function(v7, v8, v9) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), l_CaptureService_0 (copy), v5 (copy), v4 (copy), v2 (copy)
    return function(v10) --[[ Line: 13 ]]
        -- upvalues: v3 (ref), v7 (copy), v9 (copy), l_CaptureService_0 (ref), v8 (copy), v5 (ref), v4 (ref), v2 (ref)
        v10:dispatch(v3(v7));
        if v9 then
            task.spawn(function() --[[ Line: 17 ]]
                -- upvalues: l_CaptureService_0 (ref), v8 (ref), v5 (ref), v10 (copy), v4 (ref), v2 (ref)
                local l_l_CaptureService_0_CaptureFilePathAsync_0 = l_CaptureService_0:GetCaptureFilePathAsync(v8.contentId);
                local v12 = {
                    contentId = v8.contentId, 
                    filePath = l_l_CaptureService_0_CaptureFilePathAsync_0, 
                    type = v5.Screenshot
                };
                v10:dispatch(v4(v12, v2.Prompt, v8.launchData));
            end);
        end;
        l_CaptureService_0:OnSharePromptFinished(v7, v9);
    end;
end;