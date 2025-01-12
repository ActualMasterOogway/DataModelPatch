local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local v6 = require(l_Parent_0.UIBlox);
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v6.App.Dialog.Modal.PartialPageModal;
local l_useLayerCollector_0 = v6.Core.Layout.LayerCollector.useLayerCollector;
local v10 = require(l_script_FirstAncestor_0.Common.ScrollViewGradient);
return function(_) --[[ Line: 19 ]] --[[ Name: TreeReport ]]
    -- upvalues: l_useLayerCollector_0 (copy), v2 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_View_0 (copy), v10 (copy), l_Text_0 (copy)
    local l_absoluteSize_0 = l_useLayerCollector_0().absoluteSize;
    return v2.createElement(l_PartialPageModal_0, {
        title = "Skeleton Tree Report", 
        screenSize = Vector2.new(l_absoluteSize_0.X, l_absoluteSize_0.Y), 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        text = "Submit", 
                        onActivated = function() --[[ Line: 32 ]] --[[ Name: onActivated ]]

                        end
                    }
                }
            }
        }
    }, {
        View = v2.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, 200)
        }, {
            ScrollViewGradient = v2.createElement(v10, {
                gradientHeight = 50
            }, {
                PlaceholderContent = v2.createElement(l_Text_0, {
                    Size = UDim2.new(1, 0, 0, 100), 
                    Text = "Skeleton Tree Report Content"
                })
            })
        })
    });
end;