local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_0.Actions.CapturesRetrieved);
local v5 = require(l_Parent_0.Actions.CarouselClosed);
local v6 = require(l_Parent_0.Actions.CarouselIndexSelected);
local v7 = require(l_Parent_0.Actions.CarouselOpened);
local v8 = require(l_Parent_0.Actions.DeleteWarningModalClosed);
local v9 = require(l_Parent_0.Actions.DeleteWarningModalOpened);
local _ = require(l_Parent_0.Types);
local v11 = {
    IsOpen = false, 
    IsDeleteWarningModalOpen = false, 
    SelectedCaptureIndex = 0
};
local function _(v12, v13, v14) --[[ Line: 27 ]] --[[ Name: findNewSelectedCaptureIndex ]]
    -- upvalues: v2 (copy)
    if v12[v13] ~= nil and v12[v13].filePath == v14.filePath then
        return v13;
    else
        return v2.List.findWhere(v12, function(v15) --[[ Line: 37 ]]
            -- upvalues: v14 (copy)
            return v15.filePath == v14.filePath;
        end);
    end;
end;
return v3.createReducer(v11, {
    [v4.name] = function(v17, v18) --[[ Line: 43 ]]
        -- upvalues: v2 (copy)
        if v17.IsOpen == false then
            return v17;
        elseif #v18.captures == 0 then
            return v2.Dictionary.join(v17, {
                IsOpen = false, 
                SelectedCaptureIndex = 0
            });
        elseif v18.selectedCapture == nil then
            local v19 = #v18.captures;
            return v2.Dictionary.join(v17, {
                SelectedCaptureIndex = math.min(v17.SelectedCaptureIndex, v19)
            });
        else
            assert(v18.selectedCapture ~= nil, "CapturesRetrieved selectedCapture should not be nil");
            local l_selectedCapture_0 = v18.selectedCapture;
            local l_captures_0 = v18.captures;
            local l_SelectedCaptureIndex_0 = v17.SelectedCaptureIndex;
            local v24 = if l_captures_0[l_SelectedCaptureIndex_0] ~= nil and l_captures_0[l_SelectedCaptureIndex_0].filePath == l_selectedCapture_0.filePath then l_SelectedCaptureIndex_0 else v2.List.findWhere(l_captures_0, function(v23) --[[ Line: 37 ]]
                -- upvalues: l_selectedCapture_0 (copy)
                return v23.filePath == l_selectedCapture_0.filePath;
            end);
            if v24 == v17.SelectedCaptureIndex then
                return v17;
            elseif v24 ~= nil then
                return v2.Dictionary.join(v17, {
                    SelectedCaptureIndex = v24
                });
            else
                l_captures_0 = #v18.captures;
                return v2.Dictionary.join(v17, {
                    SelectedCaptureIndex = math.clamp(v17.SelectedCaptureIndex - 1, 1, l_captures_0)
                });
            end;
        end;
    end, 
    [v5.name] = function(v25, _) --[[ Line: 88 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v25, {
            IsOpen = false, 
            SelectedCaptureIndex = 0
        });
    end, 
    [v6.name] = function(v27, v28) --[[ Line: 95 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v27, {
            SelectedCaptureIndex = v28.index
        });
    end, 
    [v7.name] = function(v29, v30) --[[ Line: 101 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v29, {
            IsOpen = true, 
            SelectedCaptureIndex = v30.index
        });
    end, 
    [v8.name] = function(v31, _) --[[ Line: 108 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v31, {
            IsDeleteWarningModalOpen = false
        });
    end, 
    [v9.name] = function(v33, _) --[[ Line: 114 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v33, {
            IsDeleteWarningModalOpen = true
        });
    end
});