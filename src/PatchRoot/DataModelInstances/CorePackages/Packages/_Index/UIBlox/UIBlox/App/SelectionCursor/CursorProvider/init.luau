local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v4 = require(l_Parent_1.Cryo);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactGamepad);
local v7 = require(l_Parent_0.Core.Style.useStyle);
local v8 = require(script.Parent.CursorContext);
local v9 = require(script.Parent.CursorComponent);
local v10 = require(script.Parent.CursorType);
local function _(v11, v12, v13) --[[ Line: 20 ]]
    return string.format("%f %f %f %f", v11.Scale, v11.Offset, v12, v13);
end;
local function v24(v15) --[[ Line: 24 ]]
    local v16 = 1e999;
    local v17 = 1e999;
    local v18 = 1e999;
    local v19 = 1e999;
    for v20, v21 in string.split(v15, " ") do
        local v22 = tonumber(v21);
        if v22 ~= nil then
            if v20 == 1 then
                v16 = v22;
            elseif v20 == 2 then
                v17 = v22;
            elseif v20 == 3 then
                v18 = v22;
            elseif v20 == 4 then
                v19 = v22;
            end;
        end;
    end;
    local v23 = false;
    if v16 ~= 1e999 then
        v23 = false;
        if v17 ~= 1e999 then
            v23 = false;
            if v18 ~= 1e999 then
                v23 = v19 ~= 1e999;
            end;
        end;
    end;
    assert(v23, "Error! Not all parameters are decoded.");
    return UDim.new(v16, (math.max(0, v17 + v18))), v18, v19;
end;
return function(v25) --[[ Line: 53 ]]
    -- upvalues: v5 (copy), v6 (copy), v7 (copy), v4 (copy), v10 (copy), v24 (copy), v9 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy), v8 (copy)
    local v26, v27 = v5.useState({});
    local v28, v29 = v5.useState({});
    local v30 = v5.createRef();
    local v31, v32 = v5.useState(nil);
    local v33 = v6.useRefCache();
    local l_SelectionCursor_0 = v7().Tokens.Component.SelectionCursor;
    local function v43(v35, v36, v37) --[[ Line: 61 ]]
        -- upvalues: l_SelectionCursor_0 (copy), v26 (copy), v27 (copy), v4 (ref), v33 (copy)
        local v38 = UDim.new(0, 0);
        if v35 ~= nil then
            v38 = v35;
        end;
        local v39 = 0;
        if v37 ~= nil then
            assert(v37 > 0, "Error! borderWidth should be larger than 0.");
            v39 = v37;
        else
            v39 = l_SelectionCursor_0.BorderWidth;
        end;
        local v40 = 0;
        v40 = if v36 ~= nil then v36 - v39 else l_SelectionCursor_0.Offset - v39;
        local l_v38_0 = v38;
        local v42 = string.format("%f %f %f %f", l_v38_0.Scale, l_v38_0.Offset, v40, v39);
        if v26[v42] == nil then
            v27(v4.Dictionary.join(v26, {
                [v42] = true
            }));
        end;
        return v33[v42];
    end;
    local function v45(v44) --[[ Line: 94 ]]
        -- upvalues: v10 (ref), v28 (copy), v29 (copy), v4 (ref), v33 (copy)
        assert(v10.isEnumValue(v44), ("Error! expected a CursorType enum, got %s"):format((tostring(v44))));
        if v28[v44] == nil then
            v29(v4.Dictionary.join(v28, {
                [v44] = true
            }));
        end;
        return v33[v44];
    end;
    local function v57() --[[ Line: 109 ]]
        -- upvalues: v26 (copy), v33 (copy), v31 (copy), v24 (ref), v5 (ref), v9 (ref), v28 (copy)
        local v46 = {};
        for v47, _ in pairs(v26) do
            local v49 = false;
            if v33[v47] ~= nil then
                v49 = false;
                if v31 ~= nil then
                    v49 = v33[v47].current == v31;
                end;
            end;
            local v50, v51, v52 = v24(v47);
            v46[v47] = v5.createElement(v9, {
                ref = v33[v47], 
                isVisible = v49, 
                cornerRadius = v50, 
                offset = v51, 
                borderWidth = v52
            });
        end;
        for v53, _ in pairs(v28) do
            local v55 = v53.rawValue();
            local v56 = false;
            if v33[v53] ~= nil then
                v56 = false;
                if v31 ~= nil then
                    v56 = v33[v53].current == v31;
                end;
            end;
            v46[v53] = v5.createElement(v55, {
                ref = v33[v53], 
                isVisible = v56
            });
        end;
        return v46;
    end;
    v5.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: v30 (copy), l_CoreGui_0 (ref), l_GuiService_0 (ref), v32 (copy)
        if v30.current == nil or not v30.current:IsDescendantOf(game) then
            return;
        else
            local v58 = v30.current:IsDescendantOf(l_CoreGui_0);
            local function v59() --[[ Line: 149 ]] --[[ Name: setUpSelectionImageObjectConnection ]]
                -- upvalues: v58 (copy), l_GuiService_0 (ref), v32 (ref)
                if v58 then
                    return l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 154 ]]
                        -- upvalues: l_GuiService_0 (ref), v32 (ref)
                        if l_GuiService_0.SelectedCoreObject == nil then
                            v32(nil);
                            return;
                        else
                            v32(l_GuiService_0.SelectedCoreObject.SelectionImageObject);
                            return;
                        end;
                    end);
                else
                    return l_GuiService_0:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ Line: 162 ]]
                        -- upvalues: l_GuiService_0 (ref), v32 (ref)
                        if l_GuiService_0.SelectedObject == nil then
                            v32(nil);
                            return;
                        else
                            v32(l_GuiService_0.SelectedObject.SelectionImageObject);
                            return;
                        end;
                    end);
                end;
            end;
            local v60 = v59();
            local v61 = v30.current.AncestryChanged:Connect(function() --[[ Line: 173 ]]
                -- upvalues: v60 (ref), v59 (copy)
                v60:Disconnect();
                v60 = v59();
            end);
            return function() --[[ Line: 183 ]]
                -- upvalues: v60 (ref), v61 (copy)
                v60:Disconnect();
                v61:Disconnect();
            end;
        end;
    end, {});
    return v5.createElement(v8.Provider, {
        value = {
            getCursor = v43, 
            getCursorByType = v45
        }
    }, v4.Dictionary.join({
        InvisibleContainer = v5.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            Visible = false, 
            ref = v30
        }, (v57()))
    }, v25.children));
end;