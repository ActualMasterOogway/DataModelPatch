local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent;
local l_withStyle_0 = v3.Core.Style.withStyle;
local v7 = require(l_Parent_0.Actions.SetFeedbackFlowState);
local v8 = require(l_Parent_0.Actions.SetScreenSize);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v10 = require(l_Parent_0.Resources.Assets);
local v11 = require(l_Parent_0.Components.FeedbackReportDialog);
local v12 = require(l_Parent_0.Components.RefinedFeedbackBar);
local v13 = require(l_Parent_0.Components.FeedbackSubmissionToast);
local v14 = require(l_Parent_0.Components.HelpModal);
local v15 = require(l_Parent_0.Components.OnboardingModal);
local v16 = v1.PureComponent:extend("FeedbackApp");
v16.validateProps = v4.strictInterface({
    setScreenGuiSize = v4.callback
});
v16.render = function(v17) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v13 (copy), v14 (copy), v15 (copy), v11 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy), v12 (copy), v10 (copy)
    return v1.createElement(v3.Core.Style.Provider, {}, {
        Gui = v1.createElement("ScreenGui", {
            AutoLocalize = false, 
            IgnoreGuiInset = true, 
            OnTopOfCoreBlur = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            [v1.Change.AbsoluteSize] = v17.props.setScreenGuiSize
        }, {
            ScreenFrame = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 10
            }, {
                FeedbackSubmissionToast = v1.createElement(v13), 
                HelpModal = v1.createElement(v14), 
                OnboardingModal = v1.createElement(v15), 
                FeedbackReportDialog = v1.createElement(v11)
            }), 
            RefinedFeedbackBar = l_withLocalization_0({
                feedbackBarText = "CoreScripts.Feedback.FeedbackBar.MainLabel"
            })(function(v18) --[[ Line: 64 ]]
                -- upvalues: l_withStyle_0 (ref), v1 (ref), v12 (ref), v10 (ref)
                return l_withStyle_0(function(v19) --[[ Line: 65 ]]
                    -- upvalues: v1 (ref), v12 (ref), v18 (copy), v10 (ref)
                    local l_Font_0 = v19.Font;
                    return v1.createElement(v12, {
                        leftHint = {
                            text = v18.feedbackBarText, 
                            hintTextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                            maxWidth = 200, 
                            icon = v10.Images.FeedbackBarHintIcon
                        }
                    }, {});
                end);
            end)
        })
    });
end;
return v2.connect(function() --[[ Line: 81 ]]

end, function(v21) --[[ Line: 81 ]]
    -- upvalues: v8 (copy), v7 (copy)
    return {
        setScreenGuiSize = function(v22) --[[ Line: 83 ]] --[[ Name: setScreenGuiSize ]]
            -- upvalues: v21 (copy), v8 (ref)
            v21(v8(v22.AbsoluteSize));
        end, 
        setFeedbackFlowState = function(v23) --[[ Line: 86 ]] --[[ Name: setFeedbackFlowState ]]
            -- upvalues: v21 (copy), v7 (ref)
            v21(function(v24) --[[ Line: 87 ]]
                -- upvalues: v7 (ref), v23 (copy)
                v24:dispatch(v7(v23));
            end);
        end
    };
end)(v16);