local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v2.App.Button.Enum.StandardButtonSize;
local l_useStyle_0 = v2.Core.Style.useStyle;
local v8 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
return function(v9) --[[ Line: 17 ]] --[[ Name: SelectInSceneReportMenu ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), l_StyledTextLabel_0 (copy), v8 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v10 = l_useStyle_0();
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 30)
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 15)
        }), 
        Title = v1.createElement(l_StyledTextLabel_0, {
            text = v8:FormatByKey("Feature.ReportAbuse.Heading.ReportUsingSelectInScene"), 
            fontStyle = v10.Font.Header1, 
            colorStyle = v10.Theme.TextEmphasis, 
            layoutOrder = 0, 
            automaticSize = Enum.AutomaticSize.XY
        }), 
        SubheadingFrame = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            LayoutOrder = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 30)
            }), 
            Subheading1 = v1.createElement(l_StyledTextLabel_0, {
                text = "\226\128\162 " .. v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"), 
                fontStyle = v10.Font.Body, 
                colorStyle = v10.Theme.TextEmphasis, 
                layoutOrder = 0, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            Subheading2 = v1.createElement(l_StyledTextLabel_0, {
                text = "\226\128\162 " .. v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"), 
                fontStyle = v10.Font.Body, 
                colorStyle = v10.Theme.TextEmphasis, 
                layoutOrder = 1, 
                automaticSize = Enum.AutomaticSize.XY
            }), 
            Subheading3 = v1.createElement(l_StyledTextLabel_0, {
                text = "\226\128\162 " .. v8:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3"), 
                fontStyle = v10.Font.Body, 
                colorStyle = v10.Theme.TextEmphasis, 
                layoutOrder = 2, 
                automaticSize = Enum.AutomaticSize.XY
            })
        }), 
        EnterSelectInSceneButton = v1.createElement(l_Button_0, {
            text = v8:FormatByKey("Feature.ReportAbuse.Action.EnterSceneReporting"), 
            buttonType = l_ButtonType_0.PrimarySystem, 
            standardSize = l_StandardButtonSize_0.Small, 
            layoutOrder = 2, 
            position = UDim2.new(0.5, 0, 0, 0), 
            anchorPoint = Vector2.new(0.5, 0), 
            fitContent = true, 
            onActivated = function() --[[ Line: 83 ]] --[[ Name: onActivated ]]
                -- upvalues: v9 (copy)
                local l_SafetyService_0 = game:GetService("SafetyService");
                local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
                if game:GetEngineFeature("ExperienceStateCaptureIsInBackground") then
                    local v13 = nil;
                    do
                        local l_v13_0 = v13;
                        l_v13_0 = l_ExperienceStateCaptureService_0:GetPropertyChangedSignal("IsInBackground"):Connect(function() --[[ Line: 90 ]]
                            -- upvalues: l_v13_0 (ref), l_ExperienceStateCaptureService_0 (copy), v9 (ref)
                            if not l_v13_0.Connected then
                                return;
                            else
                                if not l_ExperienceStateCaptureService_0.IsInBackground then
                                    v9.hideReportTab();
                                    l_v13_0:Disconnect();
                                end;
                                return;
                            end;
                        end);
                    end;
                end;
                l_SafetyService_0.IsCaptureModeForReport = true;
                l_ExperienceStateCaptureService_0:ToggleCaptureMode();
            end
        })
    });
end;