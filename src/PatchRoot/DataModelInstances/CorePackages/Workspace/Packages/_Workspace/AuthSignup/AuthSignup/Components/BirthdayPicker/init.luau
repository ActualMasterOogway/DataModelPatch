local l_Parent_0 = script:FindFirstAncestor("AuthSignup").Parent;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Roact);
local l_FitChildren_0 = require(l_Parent_0.AuthCommon).Components.FitChildren;
local v5 = require(l_Parent_0.ArgCheck);
local l_TimeUnit_0 = require(l_Parent_0.Time).TimeUnit;
local l_DateTime_0 = require(l_Parent_0.Time).DateTime;
local v8 = require(l_Parent_0.ReactFocusNavigation);
local v9 = game:DefineFastFlag("SkipBirthdayPickerUpdateOnMount", false);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_ScrollingPicker_0 = require(l_Parent_0.AuthCommon).Components.ScrollingPicker;
local l_DateHelper_0 = require(l_Parent_0.Time).DateHelper;
local l_FFlagEnableUniversalFocusNavigation_0 = require(l_Parent_0.SharedFlags).FFlagEnableUniversalFocusNavigation;
local v15 = {
    Default = "Default", 
    Emphasized = "Emphasized", 
    Muted = "Muted"
};
local v16 = {};
for v17 = 1, 31 do
    table.insert(v16, v17);
end;
local l_ReasonDateInvalid_0 = l_DateHelper_0.ReasonDateInvalid;
local l_MonthsLocalizationKeys_0 = l_DateHelper_0.MonthsLocalizationKeys;
local l_DateTypeOrder_0 = l_DateHelper_0.DateTypeOrder;
local v21 = v3.PureComponent:extend("BirthdayPicker");
v21.defaultProps = {
    minAgeAllowed = 0, 
    maxAgeAllowed = 99, 
    NextSelectionUp = nil, 
    NextSelectionDown = nil, 
    skipUpdateOnMount = false
};
v21.init = function(v22) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: l_DateTime_0 (copy), l_TimeUnit_0 (copy), v5 (copy), v3 (copy), l_withStyle_0 (copy), v15 (copy)
    v22.isMounted = false;
    local l_Values_0 = l_DateTime_0.now():GetValues();
    v22.currentDate = {
        [l_TimeUnit_0.Months] = v5.isNonNegativeNumber(l_Values_0.Month, "current month in BirthdayPicker"), 
        [l_TimeUnit_0.Days] = v5.isNonNegativeNumber(l_Values_0.Day, "current day in BirthdayPicker"), 
        [l_TimeUnit_0.Years] = v5.isNonNegativeNumber(l_Values_0.Year, "current year in BirthdayPicker")
    };
    local v24 = v22.currentDate[l_TimeUnit_0.Years];
    local l_minAgeAllowed_0 = v22.props.minAgeAllowed;
    local v26 = v24 - v22.props.maxAgeAllowed;
    local v27 = v24 - l_minAgeAllowed_0;
    v22.dummyYears = {};
    for v28 = v26, v27 do
        table.insert(v22.dummyYears, v28);
    end;
    local l_initialMonth_0 = v22.props.initialMonth;
    local l_initialDay_0 = v22.props.initialDay;
    local l_initialYear_0 = v22.props.initialYear;
    local v32 = nil;
    if l_initialYear_0 then
        v32 = math.clamp(l_initialYear_0, v26, v27) - v26 + 1;
    end;
    v22.state = {
        selectedMonthIndex = l_initialMonth_0 or 1, 
        selectedDayIndex = l_initialDay_0 or 1, 
        selectedYearIndex = v32 or #v22.dummyYears + -1, 
        continueButtonEnabled = true
    };
    v22.datePickerRef = v3.createRef();
    v22.defaultRef = v3.createRef();
    v22.renderEntryTextfunction = function(v33, v34) --[[ Line: 110 ]]
        -- upvalues: l_withStyle_0 (ref), v15 (ref), v3 (ref)
        return l_withStyle_0(function(v35) --[[ Line: 111 ]]
            -- upvalues: v34 (copy), v15 (ref), v3 (ref), v33 (copy)
            local l_Font_0 = v35.Font.Body.Font;
            local v37 = v35.Font.BaseSize * v35.Font.Body.RelativeSize;
            local l_Color_0 = v35.Theme.TextDefault.Color;
            local l_Transparency_0 = v35.Theme.TextDefault.Transparency;
            if v34 == v15.Muted then
                l_Color_0 = v35.Theme.TextMuted.Color;
                l_Transparency_0 = v35.Theme.TextMuted.Transparency;
            elseif v34 == v15.Emphasized then
                l_Font_0 = v35.Font.Header1.Font;
                v37 = v35.Font.BaseSize * v35.Font.Header1.RelativeSize;
                l_Color_0 = v35.Theme.TextEmphasis.Color;
                l_Transparency_0 = v35.Theme.TextEmphasis.Transparency;
            end;
            return v3.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = tostring(v33), 
                Font = l_Font_0, 
                TextSize = v37, 
                TextColor3 = l_Color_0, 
                TextTransparency = l_Transparency_0
            });
        end);
    end;
    v22.onSelectedIndexChangedForMonth = function(v40) --[[ Line: 140 ]]
        -- upvalues: v22 (copy)
        if v22.state.selectedMonthIndex ~= v40 then
            spawn(function() --[[ Line: 144 ]]
                -- upvalues: v22 (ref), v40 (copy)
                if v22.isMounted then
                    v22:setState({
                        selectedMonthIndex = v40
                    });
                end;
            end);
        end;
    end;
    v22.onSelectedIndexChangedForDay = function(v41) --[[ Line: 154 ]]
        -- upvalues: v22 (copy)
        if v22.state.selectedDayIndex ~= v41 then
            spawn(function() --[[ Line: 158 ]]
                -- upvalues: v22 (ref), v41 (copy)
                if v22.isMounted then
                    v22:setState({
                        selectedDayIndex = v41
                    });
                end;
            end);
        end;
    end;
    v22.onSelectedIndexChangedForYear = function(v42) --[[ Line: 168 ]]
        -- upvalues: v22 (copy)
        if v22.state.selectedYearIndex ~= v42 then
            spawn(function() --[[ Line: 172 ]]
                -- upvalues: v22 (ref), v42 (copy)
                if v22.isMounted then
                    v22:setState({
                        selectedYearIndex = v42
                    });
                end;
            end);
        end;
    end;
    v22.onActivated = function(_) --[[ Line: 182 ]]
        -- upvalues: v22 (copy)
        if v22.props.focusedGuiObject and v22.datePickerRef and v22.defaultRef.current then
            v22.props.focusGuiObject(v22.defaultRef.current, true);
        end;
    end;
    v22.onEntryActivated = function() --[[ Line: 188 ]]
        -- upvalues: v22 (copy)
        if v22.props.focusedGuiObject and v22.datePickerRef and v22.datePickerRef.current then
            v22.props.focusGuiObject(v22.datePickerRef.current, true);
        end;
    end;
end;
v21.didMount = function(v44) --[[ Line: 195 ]] --[[ Name: didMount ]]
    -- upvalues: v9 (copy)
    local l_updateBirthday_0 = v44.props.updateBirthday;
    local l_selectedMonthIndex_0 = v44.state.selectedMonthIndex;
    local l_selectedDayIndex_0 = v44.state.selectedDayIndex;
    local l_selectedYearIndex_0 = v44.state.selectedYearIndex;
    local v49 = v44.dummyYears[l_selectedYearIndex_0];
    if l_updateBirthday_0 and (not v9 or not v44.props.skipUpdateOnMount) then
        l_updateBirthday_0(l_selectedMonthIndex_0, l_selectedDayIndex_0, v49);
    end;
    v44.isMounted = true;
end;
v21.willUnmount = function(v50) --[[ Line: 210 ]] --[[ Name: willUnmount ]]
    v50.isMounted = false;
end;
v21.updatePickerState = function(v51) --[[ Line: 214 ]] --[[ Name: updatePickerState ]]
    -- upvalues: l_DateHelper_0 (copy), l_ReasonDateInvalid_0 (copy)
    local l_selectedMonthIndex_1 = v51.state.selectedMonthIndex;
    local l_selectedDayIndex_1 = v51.state.selectedDayIndex;
    local l_selectedYearIndex_1 = v51.state.selectedYearIndex;
    local v55 = v51.dummyYears[l_selectedYearIndex_1];
    local v56 = false;
    local v57, v58 = l_DateHelper_0:isValidDate(l_selectedMonthIndex_1, l_selectedDayIndex_1, v55);
    if not v57 and v58 == l_ReasonDateInvalid_0.IsInvalidDayOfMonth then
        v56 = true;
        l_selectedDayIndex_1 = l_DateHelper_0:getLastDayOfTheMonthInYear(l_selectedMonthIndex_1, v55);
    end;
    spawn(function() --[[ Line: 230 ]]
        -- upvalues: v51 (copy), v56 (ref), l_selectedDayIndex_1 (ref), v57 (copy)
        if v51.isMounted then
            v51:setState({
                selectedDayIndex = v56 and l_selectedDayIndex_1 or nil, 
                continueButtonEnabled = v57
            });
        end;
    end);
end;
v21.didUpdate = function(v59) --[[ Line: 240 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_DateHelper_0 (copy)
    local l_updateBirthday_1 = v59.props.updateBirthday;
    local l_selectedMonthIndex_2 = v59.state.selectedMonthIndex;
    local l_selectedDayIndex_2 = v59.state.selectedDayIndex;
    local l_selectedYearIndex_2 = v59.state.selectedYearIndex;
    local v64 = v59.dummyYears[l_selectedYearIndex_2];
    if v59.state.continueButtonEnabled ~= l_DateHelper_0:isValidDate(l_selectedMonthIndex_2, l_selectedDayIndex_2, v64) then
        v59:updatePickerState();
    end;
    if l_updateBirthday_1 then
        l_updateBirthday_1(l_selectedMonthIndex_2, l_selectedDayIndex_2, v64);
    end;
end;
v21.render = function(v65) --[[ Line: 258 ]] --[[ Name: render ]]
    -- upvalues: l_LocalizationService_0 (copy), l_DateTypeOrder_0 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy), v3 (copy), l_FitChildren_0 (copy), l_FFlagEnableUniversalFocusNavigation_0 (copy), l_ScrollingPicker_0 (copy), l_TimeUnit_0 (copy), v15 (copy), l_MonthsLocalizationKeys_0 (copy), l_DateHelper_0 (copy), v16 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v67 = l_DateTypeOrder_0[l_RobloxLocaleId_0];
    local l_layoutOrder_0 = v65.props.layoutOrder;
    local l_selectedMonthIndex_3 = v65.state.selectedMonthIndex;
    local l_selectedDayIndex_3 = v65.state.selectedDayIndex;
    local l_selectedYearIndex_3 = v65.state.selectedYearIndex;
    return l_withStyle_0(function(_) --[[ Line: 268 ]]
        -- upvalues: l_withLocalization_0 (ref), v3 (ref), l_FitChildren_0 (ref), l_layoutOrder_0 (copy), l_FFlagEnableUniversalFocusNavigation_0 (ref), v65 (copy), l_ScrollingPicker_0 (ref), v67 (copy), l_TimeUnit_0 (ref), l_withStyle_0 (ref), v15 (ref), l_MonthsLocalizationKeys_0 (ref), l_selectedMonthIndex_3 (copy), l_DateHelper_0 (ref), l_RobloxLocaleId_0 (copy), v16 (ref), l_selectedDayIndex_3 (copy), l_selectedYearIndex_3 (copy)
        return l_withLocalization_0({
            continueText = "Authentication.SignUp.Label.Continue"
        })(function(_) --[[ Line: 271 ]]
            -- upvalues: v3 (ref), l_FitChildren_0 (ref), l_layoutOrder_0 (ref), l_FFlagEnableUniversalFocusNavigation_0 (ref), v65 (ref), l_ScrollingPicker_0 (ref), v67 (ref), l_TimeUnit_0 (ref), l_withStyle_0 (ref), l_withLocalization_0 (ref), v15 (ref), l_MonthsLocalizationKeys_0 (ref), l_selectedMonthIndex_3 (ref), l_DateHelper_0 (ref), l_RobloxLocaleId_0 (ref), v16 (ref), l_selectedDayIndex_3 (ref), l_selectedYearIndex_3 (ref)
            return v3.createElement(l_FitChildren_0.FitFrame, {
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = l_FitChildren_0.FitAxis.Height, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                ListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 14)
                }), 
                DatePickerWrap = v3.createElement(l_FitChildren_0.FitFrame, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    fitAxis = l_FitChildren_0.FitAxis.Height, 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    CenterFrame = v3.createElement("ImageLabel", {
                        Size = UDim2.new(1, 0, 0, 50), 
                        Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/DatePickerDivider.png", 
                        BackgroundTransparency = 1, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(2, 2, 4, 4), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        ZIndex = 2
                    }), 
                    DatePicker = v3.createElement(if l_FFlagEnableUniversalFocusNavigation_0 then l_FitChildren_0.FitTextButton else l_FitChildren_0.FitFrame, {
                        Size = UDim2.new(1, 0, 0, 0), 
                        fitAxis = l_FitChildren_0.FitAxis.Height, 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1, 
                        Selectable = l_FFlagEnableUniversalFocusNavigation_0 and true or nil, 
                        NextSelectionUp = if l_FFlagEnableUniversalFocusNavigation_0 then v65.props.NextSelectionUp else nil, 
                        NextSelectionDown = if l_FFlagEnableUniversalFocusNavigation_0 then v65.props.NextSelectionDown else nil, 
                        NextSelectionLeft = if l_FFlagEnableUniversalFocusNavigation_0 then v65.datePickerRef.current else nil, 
                        NextSelectionRight = if l_FFlagEnableUniversalFocusNavigation_0 then v65.datePickerRef.current else nil, 
                        Text = l_FFlagEnableUniversalFocusNavigation_0 and "" or nil, 
                        [v3.Ref] = if l_FFlagEnableUniversalFocusNavigation_0 then v65.datePickerRef else nil, 
                        [v3.Event.Activated] = if l_FFlagEnableUniversalFocusNavigation_0 then v65.onActivated else nil
                    }, {
                        ListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        WheelContainer = v3.createElement(l_FitChildren_0.FitFrame, {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            fitAxis = l_FitChildren_0.FitAxis.Height, 
                            BorderSizePixel = 0, 
                            BackgroundTransparency = 1, 
                            ClipsDescendants = true
                        }, {
                            ListLayout = v3.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Horizontal, 
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }), 
                            Padding = v3.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, 5), 
                                PaddingRight = UDim.new(0, 5), 
                                PaddingTop = UDim.new(0, 5), 
                                PaddingBottom = UDim.new(0, 5)
                            }), 
                            MonthWheel = v3.createElement(l_ScrollingPicker_0, {
                                layoutOrder = v67[l_TimeUnit_0.Months], 
                                size = UDim2.new(0.45, 0, 0, 200), 
                                renderEntry = function(v74) --[[ Line: 353 ]] --[[ Name: renderEntry ]]
                                    -- upvalues: l_withStyle_0 (ref), l_withLocalization_0 (ref), v65 (ref), v15 (ref), l_MonthsLocalizationKeys_0 (ref)
                                    return l_withStyle_0(function(_) --[[ Line: 354 ]]
                                        -- upvalues: l_withLocalization_0 (ref), v74 (copy), v65 (ref), v15 (ref), l_MonthsLocalizationKeys_0 (ref)
                                        return l_withLocalization_0({
                                            monthText = v74
                                        })(function(v76) --[[ Line: 357 ]]
                                            -- upvalues: v65 (ref), v15 (ref), v74 (ref), l_MonthsLocalizationKeys_0 (ref)
                                            local l_selectedMonthIndex_4 = v65.state.selectedMonthIndex;
                                            local l_Default_0 = v15.Default;
                                            if v74 == l_MonthsLocalizationKeys_0[l_selectedMonthIndex_4] then
                                                l_Default_0 = v15.Emphasized;
                                            end;
                                            return v65.renderEntryTextfunction(v76.monthText, l_Default_0);
                                        end);
                                    end);
                                end, 
                                getEntryWrapperProps = l_FFlagEnableUniversalFocusNavigation_0 and function(v79) --[[ Line: 373 ]]
                                    -- upvalues: v65 (ref), v3 (ref), l_MonthsLocalizationKeys_0 (ref)
                                    local l_selectedMonthIndex_5 = v65.state.selectedMonthIndex;
                                    return {
                                        [v3.Ref] = if v79 == l_MonthsLocalizationKeys_0[l_selectedMonthIndex_5] then v65.defaultRef else nil
                                    };
                                end or nil, 
                                entries = l_MonthsLocalizationKeys_0, 
                                entrySizeOnScrollingAxis = 50, 
                                onSelectedIndexChanged = v65.onSelectedIndexChangedForMonth, 
                                parentSpecifiedTarget = l_selectedMonthIndex_3, 
                                onEntryActivated = if l_FFlagEnableUniversalFocusNavigation_0 then v65.onEntryActivated else nil
                            }), 
                            DayWheel = v3.createElement(l_ScrollingPicker_0, {
                                layoutOrder = v67[l_TimeUnit_0.Days], 
                                size = UDim2.new(0.2, 0, 0, 200), 
                                renderEntry = function(v81) --[[ Line: 394 ]] --[[ Name: renderEntry ]]
                                    -- upvalues: l_withLocalization_0 (ref), l_DateHelper_0 (ref), v65 (ref), l_RobloxLocaleId_0 (ref), v15 (ref)
                                    return l_withLocalization_0({
                                        dayAffix = l_DateHelper_0.DayAffixLocalizationKey
                                    })(function(v82) --[[ Line: 397 ]]
                                        -- upvalues: v65 (ref), l_DateHelper_0 (ref), v81 (copy), l_RobloxLocaleId_0 (ref), v15 (ref)
                                        local l_selectedMonthIndex_6 = v65.state.selectedMonthIndex;
                                        local v84 = v65.dummyYears[v65.state.selectedYearIndex];
                                        local l_selectedDayIndex_4 = v65.state.selectedDayIndex;
                                        local l_l_DateHelper_0_FormattedDayString_0 = l_DateHelper_0:GetFormattedDayString(v81, v82.dayAffix, l_RobloxLocaleId_0);
                                        local l_Default_1 = v15.Default;
                                        if l_DateHelper_0:isInvalidDayOfTheMonth(l_selectedMonthIndex_6, v81, v84) then
                                            l_Default_1 = v15.Muted;
                                        elseif v81 == l_selectedDayIndex_4 then
                                            l_Default_1 = v15.Emphasized;
                                        end;
                                        return v65.renderEntryTextfunction(l_l_DateHelper_0_FormattedDayString_0, l_Default_1);
                                    end);
                                end, 
                                entries = v16, 
                                entrySizeOnScrollingAxis = 50, 
                                onSelectedIndexChanged = v65.onSelectedIndexChangedForDay, 
                                parentSpecifiedTarget = l_selectedDayIndex_3, 
                                onEntryActivated = if l_FFlagEnableUniversalFocusNavigation_0 then v65.onEntryActivated else nil
                            }), 
                            YearWheel = v3.createElement(l_ScrollingPicker_0, {
                                layoutOrder = v67[l_TimeUnit_0.Years], 
                                size = UDim2.new(0.35, 0, 0, 200), 
                                renderEntry = function(v88) --[[ Line: 428 ]] --[[ Name: renderEntry ]]
                                    -- upvalues: l_withLocalization_0 (ref), l_DateHelper_0 (ref), v65 (ref), l_RobloxLocaleId_0 (ref), v15 (ref)
                                    return l_withLocalization_0({
                                        yearAffix = l_DateHelper_0.YearAffixLocalizationKey
                                    })(function(v89) --[[ Line: 431 ]]
                                        -- upvalues: v65 (ref), l_DateHelper_0 (ref), v88 (copy), l_RobloxLocaleId_0 (ref), v15 (ref)
                                        local v90 = v65.dummyYears[v65.state.selectedYearIndex];
                                        local l_l_DateHelper_0_FormattedYearString_0 = l_DateHelper_0:GetFormattedYearString(v88, v89.yearAffix, l_RobloxLocaleId_0);
                                        local l_Default_2 = v15.Default;
                                        if v88 == v90 then
                                            l_Default_2 = v15.Emphasized;
                                        end;
                                        return v65.renderEntryTextfunction(l_l_DateHelper_0_FormattedYearString_0, l_Default_2);
                                    end);
                                end, 
                                entries = v65.dummyYears, 
                                entrySizeOnScrollingAxis = 50, 
                                onSelectedIndexChanged = v65.onSelectedIndexChangedForYear, 
                                parentSpecifiedTarget = l_selectedYearIndex_3, 
                                onEntryActivated = if l_FFlagEnableUniversalFocusNavigation_0 then v65.onEntryActivated else nil
                            })
                        })
                    })
                })
            });
        end);
    end);
end;
if l_FFlagEnableUniversalFocusNavigation_0 then
    return function(v93) --[[ Line: 465 ]]
        -- upvalues: v8 (copy), v3 (copy), v21 (copy), v2 (copy)
        local v94 = v8.useFocusedGuiObject();
        local v95 = v8.useFocusGuiObject();
        return v3.createElement(v21, v2.Dictionary.join(v93, {
            focusedGuiObject = v94, 
            focusGuiObject = v95
        }));
    end;
else
    return v21;
end;