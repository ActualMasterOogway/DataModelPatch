local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.UIBlox);
local l_Images_0 = v2.App.ImageSet.Images;
local l_IconSize_0 = v2.App.Constant.IconSize;
local l_Toast_0 = v2.App.Dialog.Toast;
local v6 = require(script.Parent.Logger);
local v7 = v1.PureComponent:extend("ToastScreen");
v7.defaultProps = {
    navigation = nil
};
v7.init = function(v8) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: l_Images_0 (copy), l_IconSize_0 (copy)
    v8.hasToastChanged = false;
    v8.getToastProps = function(v9) --[[ Line: 20 ]]
        -- upvalues: l_Images_0 (ref), l_IconSize_0 (ref), v8 (copy)
        local l_toastContent_0 = v9.toastContent;
        return {
            toastContent = {
                toastTitle = l_toastContent_0.toastTitle, 
                toastSubtitle = l_toastContent_0.toastSubtitle, 
                iconColorStyle = l_toastContent_0.iconColorStyle, 
                iconImage = l_toastContent_0.iconImage or l_Images_0["icons/status/alert"], 
                iconSize = l_toastContent_0.iconSize or Vector2.new(l_IconSize_0.Regular, l_IconSize_0.Regular), 
                swipeUpDismiss = l_toastContent_0.swipeUpDismiss, 
                onAppeared = function() --[[ Line: 31 ]] --[[ Name: onAppeared ]]
                    -- upvalues: l_toastContent_0 (copy), v8 (ref)
                    if l_toastContent_0.onAppeared then
                        l_toastContent_0.onAppeared();
                    end;
                    v8.hasToastChanged = false;
                end, 
                onActivated = l_toastContent_0.onActivated, 
                onDismissed = function() --[[ Line: 38 ]] --[[ Name: onDismissed ]]
                    -- upvalues: l_toastContent_0 (copy), v8 (ref)
                    if l_toastContent_0.onDismissed then
                        l_toastContent_0.onDismissed();
                    end;
                    if not v8.hasToastChanged then
                        v8.props.navigation.goBack();
                    end;
                end
            }, 
            anchorPoint = v9.anchorPoint, 
            duration = v9.duration or 2, 
            layoutOrder = v9.layoutOrder, 
            position = v9.position, 
            size = v9.size, 
            show = v9.show
        };
    end;
end;
v7.render = function(v11) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Toast_0 (copy)
    assert(type(v11.props.navigation) ~= "nil", "ToastScreen should be wrapped with Roact Navigation");
    local v12 = v11.getToastProps(v11.props.navigation.getParam("toastProps", {}));
    return v1.createElement(l_Toast_0, v12);
end;
v7.didUpdate = function(v13, _, _) --[[ Line: 67 ]] --[[ Name: didUpdate ]]
    v13.hasToastChanged = true;
end;
v7.didMount = function(_) --[[ Line: 71 ]] --[[ Name: didMount ]]
    -- upvalues: v6 (copy)
    v6:info("{screen} mounted");
end;
return v7;