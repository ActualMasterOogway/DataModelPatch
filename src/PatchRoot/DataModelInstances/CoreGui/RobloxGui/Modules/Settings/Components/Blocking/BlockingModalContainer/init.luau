local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_RobloxGui_0.Modules.BlockingUtility);
local v5 = require(script.Parent.ActionModal);
local v6 = v2.PureComponent:extend("BlockingModalContainer");
v6.defaultProps = {
    screenSize = Vector2.new(1000, 1000), 
    blockingUtility = v4, 
    cancelTextKey = "Feature.SettingsHub.Action.Cancel", 
    blockTextKey = "Feature.SettingsHub.Action.Block", 
    titleKey = "Feature.SettingsHub.Heading.BlockUser", 
    bodyKey = "Feature.SettingsHub.Message.BlockConfirmation"
};
v6.validateProps = v3.interface({
    analytics = v3.optional(v3.table), 
    blockTextKey = v3.optional(v3.string), 
    blockingUtility = v3.optional(v3.table), 
    bodyKey = v3.optional(v3.string), 
    cancelTextKey = v3.optional(v3.string), 
    closeModal = v3.callback, 
    player = v3.interface({
        DisplayName = v3.string, 
        Name = v3.string, 
        UserId = v3.number
    }), 
    translator = v3.optional(v3.table), 
    titleKey = v3.optional(v3.string), 
    source = v3.optional(v3.string)
});
v6.init = function(v7) --[[ Line: 37 ]] --[[ Name: init ]]
    v7.state = {
        screenSize = Vector2.new(1000, 1000)
    };
    v7.action = function() --[[ Line: 42 ]]
        -- upvalues: v7 (copy)
        if v7.props.blockingUtility:BlockPlayerAsync(v7.props.player) then
            v7.props.analytics:action("SettingsHub", "blockUser", {
                blockeeUserId = v7.props.player.UserId, 
                source = v7.props.source
            });
        end;
        v7.props.closeModal();
    end;
    v7.setScreenSize = function(v8) --[[ Line: 55 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            screenSize = Vector2.new(v8.X, v8.Y)
        });
    end;
end;
v6.render = function(v9) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v5 (copy)
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        [v2.Change.AbsoluteSize] = function(v10) --[[ Line: 67 ]]
            -- upvalues: v9 (copy)
            v9.setScreenSize(v10.AbsoluteSize);
        end
    }, {
        BlockingModal = v2.createElement(v5, {
            title = v9.props.translator:FormatByKey(v9.props.titleKey, {
                DisplayName = v9.props.player.DisplayName
            }), 
            body = v9.props.translator:FormatByKey(v9.props.bodyKey, {
                DISPLAY_NAME = v9.props.player.DisplayName, 
                RBX_NAME = v9.props.player.Name
            }), 
            cancelText = v9.props.translator:FormatByKey(v9.props.cancelTextKey), 
            actionText = v9.props.translator:FormatByKey(v9.props.blockTextKey), 
            cancel = v9.props.closeModal, 
            action = v9.action, 
            screenSize = v9.state.screenSize
        })
    });
end;
return v6;