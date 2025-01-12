local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.UIBlox);
local l_useLayerCollector_0 = v4.Core.Layout.LayerCollector.useLayerCollector;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local v8 = require(l_script_FirstAncestor_0.Components.ChatLineReportSelectableLine);
local v9 = require(l_script_FirstAncestor_0.Common.isSystemMessage);
local l_PartialPageModal_0 = v4.App.Dialog.Modal.PartialPageModal;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v12 = require(l_Parent_0.Foundation);
local l_Empty_0 = v12.Empty;
local l_RadioGroup_0 = v12.RadioGroup;
local l_ScrollView_0 = v12.ScrollView;
local l_ScrollBarVisibility_0 = v12.Enums.ScrollBarVisibility;
local l_GetFFlagChatLineReportShowMostRecentHistory_0 = require(l_Parent_0.SharedFlags).GetFFlagChatLineReportShowMostRecentHistory;
local function v27(v18, _, v20, v21) --[[ Line: 35 ]] --[[ Name: createChildren ]]
    -- upvalues: v9 (copy), v2 (copy), l_RadioGroup_0 (copy), v8 (copy)
    local v22 = {};
    local v23 = {};
    local v24 = -1;
    for v25, v26 in pairs(v18) do
        if not v9(v26) then
            v24 = v24 + 1;
            v23[v25] = v24;
            table.insert(v22, v2.createElement(l_RadioGroup_0.Item, {
                value = v25, 
                label = v2.createElement(v8, {
                    message = v26, 
                    localizedText = v20, 
                    scrollViewSizeX = v21
                })
            }));
        end;
    end;
    return v22, v23;
end;
return function(v28) --[[ Line: 62 ]] --[[ Name: ChatLineReportSelectionModal ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), v7 (copy), v27 (copy), v3 (copy), l_useLayerCollector_0 (copy), l_GetFFlagChatLineReportShowMostRecentHistory_0 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_Empty_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_RadioGroup_0 (copy)
    local v29 = v2.useRef(nil);
    local v30, v31 = v2.useState(0);
    local v32 = v2.useRef(nil);
    local v33, v34 = v2.useState(0);
    local v35 = v2.useRef(nil);
    local v36 = l_useLocalization_0(v7.ChatLineLocalizationKeys);
    local v37, v38 = v27(v28.messages, v28.setSelectedMessage, v36, v33);
    local v39 = v3.isEmpty(v37);
    local v40 = l_useLayerCollector_0();
    local l_absoluteSize_0 = v40.absoluteSize;
    v2.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v29 (copy), v31 (copy)
        if v29.current then
            v29.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 78 ]]
                -- upvalues: v31 (ref), v29 (ref)
                v31(v29.current.AbsoluteSize.Y);
            end);
        end;
    end, {
        v29.current, 
        l_absoluteSize_0
    });
    v2.useEffect(function() --[[ Line: 84 ]]
        -- upvalues: v32 (copy), v34 (copy)
        if v32.current then
            v32.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 86 ]]
                -- upvalues: v34 (ref), v32 (ref)
                v34(v32.current.AbsoluteSize.X);
            end);
        end;
    end, {
        v32.current, 
        l_absoluteSize_0
    });
    if l_GetFFlagChatLineReportShowMostRecentHistory_0() then
        v2.useEffect(function() --[[ Line: 94 ]]
            -- upvalues: v32 (copy), v35 (copy), v7 (ref)
            if v32.current then
                local l_FirstChildWhichIsA_0 = v32.current:FindFirstChildWhichIsA("ScrollingFrame", true);
                if l_FirstChildWhichIsA_0 then
                    v35.current = l_FirstChildWhichIsA_0;
                    v35.current.CanvasPosition = Vector2.new(0, v7.SelectionModalCanvasPositionTopPadding);
                end;
            end;
        end, {
            v32.current
        });
    end;
    return v2.createElement(l_PartialPageModal_0, {
        screenSize = Vector2.new(l_absoluteSize_0.X, l_absoluteSize_0.Y - v40.insets.top), 
        position = UDim2.new(0.5, 0, 0, v40.insets.top + v7.SelectionModalPositionOffset), 
        anchorPoint = Vector2.new(0.5, 0), 
        title = v36.ChatSelectionModalTitle, 
        onCloseClicked = v28.onBack, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v28.onContinue, 
                        text = v36.ChatSelectionModalButton, 
                        isDisabled = v39 or v28.selectedMessage == nil
                    }
                }
            }
        }
    }, {
        messageView = if v39 then v2.createElement(l_Empty_0, {}) else v2.createElement(l_ScrollView_0, {
            Size = UDim2.new(1, 0, 0, (math.min(l_absoluteSize_0.Y - v40.insets.top - v7.SelectionModalScreenSizeOffset, v30 + v7.SelectionModalRadioGroupOffset))), 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.new(1, 0, 0, 0), 
                scrollBarVisibility = l_ScrollBarVisibility_0.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y
            }, 
            tag = "padding-top-medium padding-bottom-medium", 
            ref = v32
        }, {
            RadioGroup = v2.createElement(l_RadioGroup_0.Root, {
                onValueChanged = function(v43) --[[ Line: 147 ]] --[[ Name: onValueChanged ]]
                    -- upvalues: v28 (copy), v7 (ref), v38 (copy)
                    v28.setSelectedMessage(v28.messages[v43]);
                    v28.analyticsDispatch({
                        type = v7.AnalyticsActions.SetChatLineSelected, 
                        selected_chat_line_index = v38[v43]
                    });
                end, 
                ref = v29
            }, v37)
        })
    });
end;