local l_Parent_0 = script:FindFirstAncestor("AppStartup").Parent;
local v1 = require(l_Parent_0.Dash);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Images_0 = v3.App.ImageSet.Images;
local l_LinkButton_0 = v3.App.Button.LinkButton;
return function(v8) --[[ Line: 40 ]] --[[ Name: StartupMessage ]]
    -- upvalues: v1 (copy), v2 (copy), l_LinkButton_0 (copy), l_InteractiveAlert_0 (copy), l_Images_0 (copy), l_ButtonType_0 (copy)
    local l_localizedStrings_0 = v8.localizedStrings;
    local l_message_0 = v8.message;
    local l_overlayColor_0 = v8.overlayColor;
    local l_onDismissed_0 = v8.onDismissed;
    local l_screenSize_0 = v8.screenSize;
    local v15 = v1.map(v8.localizedLinks, function(v14) --[[ Line: 47 ]]
        -- upvalues: v2 (ref), l_LinkButton_0 (ref), v8 (copy)
        return v2.createElement(l_LinkButton_0, {
            text = v14.label, 
            onActivated = function() --[[ Line: 50 ]] --[[ Name: onActivated ]]
                -- upvalues: v8 (ref), v14 (copy)
                v8.onOpenUrl(v14.url, v14.label);
            end
        });
    end);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = l_message_0.isBlocking and 0 or l_overlayColor_0.Transparency, 
        BackgroundColor3 = l_overlayColor_0.Color3, 
        Active = true
    }, {
        InteractiveAlert = v2.createElement(l_InteractiveAlert_0, {
            screenSize = l_screenSize_0, 
            title = l_localizedStrings_0.titleText or "", 
            bodyText = l_localizedStrings_0.bodyText or "", 
            titleIcon = l_Images_0["icons/status/error_large"], 
            middleContent = function() --[[ Line: 68 ]] --[[ Name: middleContent ]]
                -- upvalues: v2 (ref), v1 (ref), v15 (copy)
                return v2.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, v1.append({
                    v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    })
                }, v15));
            end, 
            buttonStackInfo = if l_message_0.isBlocking then nil else {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_onDismissed_0, 
                            text = l_localizedStrings_0.buttonText
                        }
                    }
                }
            }
        })
    });
end;