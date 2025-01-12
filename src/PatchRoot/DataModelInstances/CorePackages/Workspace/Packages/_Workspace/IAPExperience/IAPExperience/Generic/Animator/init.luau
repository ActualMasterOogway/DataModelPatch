local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Localization_0 = require(l_Parent_1.RobloxAppLocales).Localization;
local v4 = require(l_Parent_0.Locale.LocaleProvider);
local l_LocalizationProvider_0 = require(l_Parent_1.Localization).LocalizationProvider;
local v6 = require(l_Parent_1.Roact);
local v7 = require(l_Parent_1.Otter);
local v8 = v6.Component:extend(script.Name);
local v9 = {
    dampingRatio = 1, 
    frequency = 1.6
};
v8.init = function(v10) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy), v7 (copy), v9 (copy)
    v10.state = {
        shouldRenderChildren = v10.props.shouldShow
    };
    local v11, v12 = v6.createBinding(1);
    v10.motor = v7.createSingleMotor(1);
    v10.motor:start();
    v10.motor:onStep(v12);
    v10.animationProgress = v11;
    v10.motor:onComplete(function() --[[ Line: 47 ]]
        -- upvalues: v10 (copy)
        local l_props_0 = v10.props;
        if l_props_0.shouldShow then
            if l_props_0.onShown ~= nil then
                l_props_0.onShown();
                return;
            end;
        else
            v10:setState({
                shouldRenderChildren = false
            });
            if l_props_0.onHidden ~= nil then
                l_props_0.onHidden();
            end;
        end;
    end);
    v10.motor:setGoal(v7.spring(v10.props.shouldShow and 0 or 1, v9));
end;
v8.didUpdate = function(v14, v15, _) --[[ Line: 66 ]] --[[ Name: didUpdate ]]
    -- upvalues: v7 (copy), v9 (copy)
    local l_props_1 = v14.props;
    if v15.shouldShow ~= l_props_1.shouldShow then
        if l_props_1.shouldShow then
            v14:setState({
                shouldRenderChildren = l_props_1.shouldShow
            });
        end;
        v14.motor:setGoal(v7.spring(l_props_1.shouldShow and 0 or 1, v9));
    end;
end;
v8.willUnmount = function(v18) --[[ Line: 79 ]] --[[ Name: willUnmount ]]
    v18.motor:destroy();
end;
v8.renderWithoutLocale = function(v19) --[[ Line: 83 ]] --[[ Name: renderWithoutLocale ]]
    -- upvalues: v6 (copy)
    local l_props_2 = v19.props;
    if l_props_2.shouldAnimate then
        return v6.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Position = v19.animationProgress:map(function(v21) --[[ Line: 91 ]]
                -- upvalues: l_props_2 (copy)
                if l_props_2.animateDown then
                    return UDim2.new(0, 0, -1 * v21, 0);
                else
                    return UDim2.new(0, 0, 1 * v21, 0);
                end;
            end), 
            ZIndex = l_props_2.ZIndex
        }, v19.state.shouldRenderChildren and l_props_2.renderChildren() or nil);
    elseif l_props_2.shouldShow then
        return l_props_2.renderChildren();
    else
        return nil;
    end;
end;
v8.render = function(v22) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v4 (copy), l_LocalizationService_0 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy)
    return v6.createElement(v4, {
        locale = l_LocalizationService_0 and l_LocalizationService_0.RobloxLocaleId
    }, {
        v6.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            v22:renderWithoutLocale()
        })
    });
end;
return v8;