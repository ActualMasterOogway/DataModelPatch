local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Components.EventHostName);
local _ = require(l_script_FirstAncestor_0.types);
local l_Cell_0 = v3.App.Table.Cell;
local l_CellHeadDetail_0 = v3.App.Table.CellHeadDetail;
local l_CellTailDescription_0 = v3.App.Table.CellTailDescription;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v11 = {
    size = UDim2.new(1, 0, 0, 52)
};
return function(v12) --[[ Line: 27 ]] --[[ Name: EventHostedBy ]]
    -- upvalues: v1 (copy), v11 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_Cell_0 (copy), l_CellHeadDetail_0 (copy), l_CellTailDescription_0 (copy), v5 (copy)
    v12 = v1.Dictionary.join(v11, v12);
    local v13 = l_useStyle_0();
    local v14 = l_useLocalization_0({
        hostedBy = "Feature.VirtualEvents.HostedByLabel"
    });
    local v15 = v2.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v12 (ref)
        if v12.onActivated then
            v12.onActivated(v12.host);
        end;
    end, {
        v12
    });
    return v2.createElement(l_Cell_0, {
        size = v12.size, 
        userInteractionEnabled = true, 
        horizontalPadding = 0, 
        onActivated = v15, 
        head = v2.createElement(l_CellHeadDetail_0, {
            labelText = v14.hostedBy, 
            labelTextColor = v13.Theme.TextDefault, 
            labelTextFont = v13.Font.Body
        }), 
        tail = v2.createElement(l_CellTailDescription_0, {
            text = "", 
            renderTextOverride = function() --[[ Line: 53 ]] --[[ Name: renderTextOverride ]]
                -- upvalues: v2 (ref), v5 (ref), v12 (ref)
                return v2.createElement(v5, {
                    host = v12.host
                });
            end, 
            showArrow = true
        })
    });
end;