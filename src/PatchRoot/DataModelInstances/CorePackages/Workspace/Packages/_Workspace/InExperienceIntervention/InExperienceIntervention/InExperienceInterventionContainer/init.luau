local l_script_FirstAncestor_0 = script:FindFirstAncestor("InExperienceIntervention");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.InExperienceInterventionEventReceiver);
local v4 = require(l_script_FirstAncestor_0.Reducers.InExperienceInterventionUIStateReducer);
local v5 = require(l_script_FirstAncestor_0.InExperienceInterventionDialogManager);
local v6 = require(l_script_FirstAncestor_0.Utils.Constants);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
InExperienceInterventionContainer = function() --[[ Line: 11 ]] --[[ Name: InExperienceInterventionContainer ]]
    -- upvalues: v2 (copy), v4 (copy), v6 (copy), l_useLocalization_0 (copy), v3 (copy), v5 (copy)
    local v8, v9 = v2.useReducer(v4, v6.InitialUIState);
    local v10 = l_useLocalization_0(v6.localizationKeys);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        EventReceiver = v2.createElement(v3, {
            uiStateDispatch = v9, 
            localizedText = v10
        }), 
        DialogManager = v2.createElement(v5, {
            uiState = v8, 
            uiStateDispatch = v9
        })
    });
end;
return InExperienceInterventionContainer;