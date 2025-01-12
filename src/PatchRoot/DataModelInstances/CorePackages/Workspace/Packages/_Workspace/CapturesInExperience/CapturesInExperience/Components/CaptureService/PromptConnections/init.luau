local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.UIBlox);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useExternalEvent_0 = v5.Core.Hooks.useExternalEvent;
local v8 = require(l_Parent_0.App.CapturesPolicy);
local v9 = require(l_Parent_0.Actions.PromptTriggered);
local v10 = require(l_Parent_0.Enums.PromptType);
local _ = require(l_Parent_0.Types);
return (v8.connect(function(v12) --[[ Line: 54 ]]
    return {
        enableShareCaptureCTA = v12.enableShareCaptureCTA()
    };
end)(function(v13) --[[ Line: 22 ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v9 (copy), v10 (copy), l_useExternalEvent_0 (copy), l_CaptureService_0 (copy)
    local v14 = l_useDispatch_0();
    local v18 = v3.useCallback(function(v15, v16) --[[ Line: 25 ]]
        -- upvalues: v14 (copy), v9 (ref), v10 (ref)
        local v17 = {
            contentIds = v16
        };
        v14(v9(v15, v10.SaveCaptures, v17));
    end, {});
    l_useExternalEvent_0(l_CaptureService_0.OpenSaveCapturesPrompt, v18);
    local v23 = v3.useCallback(function(v19, v20, v21) --[[ Line: 35 ]]
        -- upvalues: v13 (copy), v14 (copy), v9 (ref), v10 (ref), l_CaptureService_0 (ref)
        local v22 = {
            contentId = v20, 
            launchData = v21
        };
        if v13.enableShareCaptureCTA then
            v14(v9(v19, v10.ShareCapture, v22));
            return;
        else
            l_CaptureService_0:OnSharePromptFinished(v19, false);
            return;
        end;
    end, {
        v13.enableShareCaptureCTA
    });
    l_useExternalEvent_0(l_CaptureService_0.OpenShareCapturePrompt, v23);
    return v3.createElement(v3.Fragment, {}, {});
end));