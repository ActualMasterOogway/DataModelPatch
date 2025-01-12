local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.UIBloxConfig);
local l_Parent_2 = l_Parent_1.Parent;
if (v2.refactorInteractable or false) == false then
    return require(script.Parent.Interactable_DEPRECATED);
else
    local v4 = require(l_Parent_2.Cryo);
    local v5 = require(l_Parent_2.React);
    local _ = require(l_Parent_0.Control.Enum.ControlState);
    local v7 = require(l_Parent_1.Core.Control.Enum.ControlStateEvent);
    local v8 = require(l_Parent_0.Control.Hooks.useGuiControlState);
    local v9 = require(l_Parent_0.Control.Hooks.useInteractionFeedback);
    local v10 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
    return v5.forwardRef(function(v11, v12) --[[ Line: 56 ]] --[[ Name: Interactable ]]
        -- upvalues: v5 (copy), v2 (copy), v9 (copy), v8 (copy), v7 (copy), v10 (copy), v4 (copy)
        local v13 = v5.useRef(nil);
        local v14 = v5.useRef(nil);
        local v15 = if v2.enableInteractionFeedback then v9() else nil;
        local v16 = v5.useRef(v11.userInteractionEnabled == nil or v11.userInteractionEnabled);
        local v19 = v5.useCallback(function(v17, v18) --[[ Line: 67 ]]
            -- upvalues: v2 (ref), v15 (copy), v11 (copy)
            if v2.enableInteractionFeedback then
                v15(v11.feedbackType, v17, v18);
            end;
            if v11.onStateChanged then
                v11.onStateChanged(v17, v18);
            end;
        end, {
            v11.onStateChanged, 
            v15, 
            v11.feedbackType
        });
        local v20, v21 = v8(v13, v19, v16.current);
        v5.useImperativeHandle(v12, function() --[[ Line: 83 ]]
            -- upvalues: v13 (copy)
            return v13.current;
        end, {});
        local v22 = v5.useCallback(function(...) --[[ Line: 88 ]]
            -- upvalues: v16 (copy), v11 (copy), v5 (ref)
            if v16.current == false or v11.isDisabled then
                return nil;
            elseif v11[v5.Event.Activated] then
                return v11[v5.Event.Activated](...);
            else
                return nil;
            end;
        end, {
            v11[v5.Event.Activated], 
            v11.isDisabled
        });
        v5.useEffect(function() --[[ Line: 98 ]]
            -- upvalues: v11 (copy), v14 (copy), v21 (copy), v7 (ref)
            if v11.isDisabled ~= nil then
                v14.current = v11.isDisabled;
                if v11.isDisabled then
                    v21.events[v7.Disabled]();
                    return;
                else
                    v21.events[v7.Enabled]();
                    return;
                end;
            elseif v14.current == nil then
                v14.current = false;
                v21.events[v7.Enabled]();
                return;
            else
                if v14.current == true then
                    v14.current = false;
                    v21.events[v7.Enabled]();
                end;
                return;
            end;
        end, {
            v11.isDisabled
        });
        v5.useEffect(function() --[[ Line: 118 ]]
            -- upvalues: v11 (copy), v16 (copy)
            if v11.userInteractionEnabled ~= nil then
                v16.current = v11.userInteractionEnabled;
                return;
            else
                v16.current = true;
                return;
            end;
        end, {
            v11.userInteractionEnabled
        });
        local v23 = v11.component or v10.Button;
        local v24 = v4.Dictionary.join(v11, {
            ref = v20, 
            onStateChanged = v4.None, 
            isDisabled = v4.None, 
            userInteractionEnabled = v4.None, 
            feedbackType = v4.None, 
            Active = if v11.isDisabled ~= nil then not v11.isDisabled else nil, 
            [v5.Event.Activated] = v22
        });
        return v5.createElement(v23, v24);
    end);
end;