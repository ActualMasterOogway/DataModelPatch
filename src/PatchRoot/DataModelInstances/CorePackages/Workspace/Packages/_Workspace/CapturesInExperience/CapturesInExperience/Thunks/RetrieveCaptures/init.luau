local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Actions.CapturesRetrieved);
local v3 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.Types);
local function _(v5) --[[ Line: 9 ]] --[[ Name: getSelectedCapture ]]
    -- upvalues: v3 (copy)
    local l_SelectedCaptureIndex_0 = v5[v3.RoduxKey].Carousel.SelectedCaptureIndex;
    if l_SelectedCaptureIndex_0 ~= nil then
        return v5[v3.RoduxKey].Captures[l_SelectedCaptureIndex_0];
    else
        return nil;
    end;
end;
return function() --[[ Line: 18 ]]
    -- upvalues: v3 (copy), l_CaptureService_0 (copy), v2 (copy)
    return function(v8) --[[ Line: 19 ]]
        -- upvalues: v3 (ref), l_CaptureService_0 (ref), v2 (ref)
        local v9 = v8:getState();
        local l_SelectedCaptureIndex_1 = v9[v3.RoduxKey].Carousel.SelectedCaptureIndex;
        local v11 = if l_SelectedCaptureIndex_1 ~= nil then v9[v3.RoduxKey].Captures[l_SelectedCaptureIndex_1] else nil;
        v9 = l_CaptureService_0:RetrieveCaptures();
        v8:dispatch(v2(v9, v11));
    end;
end;