local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.DuplicateAnalytics.upsellCardModalAction);
local v3 = require(l_script_FirstAncestor_0.DuplicateAnalytics.upsellCardFormInteraction);
local v4 = require(l_script_FirstAncestor_0.DuplicateAnalytics.EventStreamConstants);
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
return {
    get = function(v6) --[[ Line: 16 ]] --[[ Name: get ]]
        -- upvalues: l_RoactAnalytics_0 (copy), v2 (copy), v4 (copy), v3 (copy)
        local v7 = l_RoactAnalytics_0.get(v6);
        return {
            reportModalShownWithSection = function(v8, v9, v10) --[[ Line: 21 ]] --[[ Name: reportModalShownWithSection ]]
                -- upvalues: v2 (ref), v7 (copy), v4 (ref)
                v2(v7.EventStream, v8, "", v4.ActionType.Shown, v9, v10);
            end, 
            reportModalShownWithSectionAndError = function(v11, v12, v13, v14, v15) --[[ Line: 32 ]] --[[ Name: reportModalShownWithSectionAndError ]]
                -- upvalues: v2 (ref), v7 (copy), v4 (ref)
                v2(v7.EventStream, v11, v12, v4.ActionType.Shown, v13, v14, v15);
            end, 
            reportModalDismissedWithSection = function(v16, v17, v18) --[[ Line: 44 ]] --[[ Name: reportModalDismissedWithSection ]]
                -- upvalues: v2 (ref), v7 (copy), v4 (ref)
                v2(v7.EventStream, v16, "", v4.ActionType.Dismiss, v17, v18);
            end, 
            reportModalActionWithSection = function(v19, v20, v21, v22, v23, v24) --[[ Line: 55 ]] --[[ Name: reportModalActionWithSection ]]
                -- upvalues: v2 (ref), v7 (copy)
                v2(v7.EventStream, v19, v20, v21, v22, v23, v24);
            end, 
            reportInteractWithActionAndSection = function(v25, v26, v27, v28, v29, v30) --[[ Line: 59 ]] --[[ Name: reportInteractWithActionAndSection ]]
                -- upvalues: v3 (ref), v7 (copy)
                v3(v7.EventStream, v25, v26, v27, v28, v29, v30);
            end
        };
    end
};