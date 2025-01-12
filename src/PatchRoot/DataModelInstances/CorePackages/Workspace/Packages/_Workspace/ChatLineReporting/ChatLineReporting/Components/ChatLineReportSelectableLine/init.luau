local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.getMessageText);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_InputLabel_0 = v4.InputLabel;
local l_View_0 = v4.View;
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local v8 = require(l_script_FirstAncestor_0.Components.ChatLineReportEyebrow);
return function(v9) --[[ Line: 22 ]] --[[ Name: ChatLineReportSelectableLine ]]
    -- upvalues: v3 (copy), v2 (copy), l_View_0 (copy), v7 (copy), v8 (copy), l_InputLabel_0 (copy)
    local v10, v11 = v3.useState(nil);
    local v12 = v2(v9.message.useTranslation, v9.message.translation, v9.message.text);
    local v13 = v9.message.prefixText or "";
    local v14 = v10 or v13;
    local l_userId_0 = v9.message.userId;
    if l_userId_0 and l_userId_0.data then
        local l_names_0 = l_userId_0.data.userProfiles[1].names;
        v11((string.gsub(v14, l_names_0.displayName, l_names_0.combinedName)));
    end;
    return v3.createElement(l_View_0, {
        Size = UDim2.new(0, v9.scrollViewSizeX - v7.SelectableLineScrollbarOffset, 1, 0), 
        LayoutOrder = 2, 
        tag = "col"
    }, {
        eyebrow = v3.createElement(v8, {
            message = v9.message, 
            localizedText = v9.localizedText
        }); 
        v3.createElement(l_InputLabel_0, {
            Text = ("%* %*"):format(v14, v12), 
            RichText = true, 
            LayoutOrder = 2
        })
    });
end;