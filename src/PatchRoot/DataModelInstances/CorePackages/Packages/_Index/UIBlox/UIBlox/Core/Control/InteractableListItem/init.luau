local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_0.Core.Control.Interactable);
local v5 = require(script.Parent.Enum.SelectionMode);
local v6 = v2.PureComponent:extend("InteractableListItem");
v6.init = function(v7) --[[ Line: 20 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v3 (copy)
    v7.onStateChanged = function(_, v9) --[[ Line: 21 ]]
        -- upvalues: v7 (copy)
        v7.props.setInteractableState(v7.props.id, v9);
    end;
    v7.onActivated = function() --[[ Line: 24 ]]
        -- upvalues: v7 (copy), v5 (ref), v3 (ref)
        local l_selection_0 = v7.props.selection;
        local v11 = {
            v7.props.id
        };
        if v7.props.selectionMode == v5.Multiple then
            v11 = v3.List.filter(l_selection_0, function(v12) --[[ Line: 28 ]]
                -- upvalues: v7 (ref)
                return v12 ~= v7.props.id;
            end);
            if #v11 == #l_selection_0 then
                table.insert(v11, v7.props.id);
            end;
        end;
        if v7.props.onSelectionChanged then
            v7.props.onSelectionChanged(v11, l_selection_0);
        end;
        if v7.props.selectionMode ~= v5.None then
            v7.props.setSelection(v11);
        end;
    end;
end;
v6.render = function(v13) --[[ Line: 44 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    local v14 = v3.List.find(v13.props.selection, v13.props.id) ~= nil;
    local v15, v16 = v13.props.renderItem(v13.props.item, v13.props.interactableState, v14, v13.props.id);
    return v2.createElement(v4, v3.Dictionary.join({
        Size = v13.props.itemSize, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, v16 or {}, {
        onStateChanged = v13.onStateChanged, 
        [v2.Event.Activated] = v13.onActivated
    }), v15);
end;
return v6;