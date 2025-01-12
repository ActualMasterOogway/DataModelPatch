local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.Components.CaptureService.PromptConnections);
local v6 = require(l_Parent_0.Enums.PromptType);
local v7 = require(l_Parent_0.Components.CaptureService.SaveCapturesPrompt);
local v8 = require(l_Parent_0.Components.CaptureService.ShareCapturePrompt);
local _ = require(l_Parent_0.Types);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v11 = {
    [v6.SaveCaptures] = v7, 
    [v6.ShareCapture] = v8
};
return function(_) --[[ Line: 23 ]]
    -- upvalues: l_useSelector_0 (copy), v4 (copy), v11 (copy), v2 (copy), v5 (copy)
    local v14 = l_useSelector_0(function(v13) --[[ Line: 24 ]]
        -- upvalues: v4 (ref)
        return v13[v4.RoduxKey].Prompts[1];
    end);
    local v15 = v14 and v14.PromptData;
    local v16 = v14 and v14.PromptId;
    local v17 = v14 and v14.PromptType;
    local v18 = nil;
    if v17 then
        local v19 = v11[v17];
        if v19 then
            v18 = v2.createElement(v19, {
                promptData = v15, 
                promptId = v16
            });
        else
            error((("Unexpected prompt type: %*!"):format(v17)));
        end;
    end;
    return v2.createElement(v2.Fragment, {}, {
        PromptConnections = v2.createElement(v5), 
        Prompt = v18
    });
end;