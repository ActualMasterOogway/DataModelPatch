local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v3.usePreferredInput;
local v5 = require(l_Parent_0.GameTile);
local l_AppGameTile_0 = v5.AppGameTile;
local v7 = require(l_script_FirstAncestor_0.useTriggerGameTileFeedbackCallbacks);
local v8 = require(l_script_FirstAncestor_0.SeeAllTile);
local v9 = require(l_script_FirstAncestor_0.useNavigateToGameDetails);
local _ = require(l_Parent_0.HoldToPlay);
local l_FFlagLuaAppGameTileInteractionFeedback_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileInteractionFeedback;
local l_FFlagLuaAppMigrateGameTile_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTile;
local l_FFlagLuaAppMigrateGameTileIxp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateGameTileIxp;
local l_GameTileExperimentation_0 = v5.GameTileExperimentation;
local v15 = {
    GameTile = "GameTile", 
    SeeAllTile = "SeeAllTile"
};
return function(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) --[[ Line: 27 ]] --[[ Name: useRenderGameCollectionItem ]]
    -- upvalues: l_usePreferredInput_0 (copy), v9 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (copy), v7 (copy), v3 (copy), l_FFlagLuaAppMigrateGameTile_0 (copy), l_FFlagLuaAppMigrateGameTileIxp_0 (copy), l_GameTileExperimentation_0 (copy), v2 (copy), v8 (copy), v15 (copy), l_AppGameTile_0 (copy)
    local v41 = l_usePreferredInput_0();
    local v42 = v9();
    local v43 = nil;
    local v44 = nil;
    if l_FFlagLuaAppGameTileInteractionFeedback_0 then
        local v45, v46 = v7();
        v43 = v45;
        v44 = v46;
    end;
    local v47 = v22 and v41 == v3.Input.Pointer;
    local v48 = true;
    if v18 ~= "Wide" then
        v48 = v18 == "Event";
    end;
    local v49 = l_FFlagLuaAppMigrateGameTile_0 and not l_FFlagLuaAppMigrateGameTileIxp_0 or l_FFlagLuaAppMigrateGameTileIxp_0 and l_GameTileExperimentation_0.getIsTileMigrationEnabled();
    return (v2.useCallback(function(v50, v51, v52, v53) --[[ Line: 113 ]]
        -- upvalues: v30 (copy), v28 (copy), v2 (ref), v8 (ref), v15 (ref), v38 (copy), l_AppGameTile_0 (ref), v23 (copy), v24 (copy), v19 (copy), v20 (copy), v21 (copy), v48 (copy), v16 (copy), v17 (copy), v18 (copy), v47 (copy), v29 (copy), v25 (copy), v26 (copy), v27 (copy), v42 (copy), v31 (copy), v32 (copy), v33 (copy), v34 (copy), v35 (copy), l_FFlagLuaAppGameTileInteractionFeedback_0 (ref), v43 (ref), v44 (ref), v36 (copy), v37 (copy), v39 (copy), l_FFlagLuaAppMigrateGameTile_0 (ref), v40 (copy), v49 (copy)
        if v30 and v51 == v30 and v28 then
            return v2.createElement(v8, {
                onActivated = v28, 
                Size = v52, 
                LayoutOrder = v51
            }), v15.SeeAllTile;
        else
            local v54 = nil;
            if v38 then
                v54 = v38(v51);
            end;
            return v2.createElement(l_AppGameTile_0, {
                Size = v52, 
                entry = v50, 
                layoutOrder = v51, 
                ZIndex = -v51, 
                reportGameDetailOpened = v23, 
                reportExperienceLaunched = v24, 
                index = v50.realGameEntryIndex or v51, 
                friendFooterEnabled = v19, 
                showFriendActivity = v20, 
                impressionsTag = v21, 
                useGridTile = v48, 
                playerCountStyle = v16, 
                isSponsoredFooterAllowed = v17, 
                gameTileLayoutType = v18, 
                useHoverTile = v47, 
                topicId = v29, 
                launchExperienceEventContext = v25, 
                referralSource = v26, 
                source = v27, 
                rowNum = v53, 
                navigateToGameDetails = v42, 
                hideGameStats = v31, 
                playButtonStyle = v32, 
                isContained = v33, 
                hideTitle = v34, 
                hideMetadata = v35, 
                onGuiStateChanged = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v43 else nil, 
                onActivated = if l_FFlagLuaAppGameTileInteractionFeedback_0 then v44 else nil, 
                isDisabled = v54, 
                onSelectionGained = v36, 
                onSelectionLost = v37, 
                textSizeOffset = v39, 
                contentTextLineCount = if l_FFlagLuaAppMigrateGameTile_0 then v40 else nil, 
                isUnifiedGameTile = if l_FFlagLuaAppMigrateGameTile_0 then v49 else nil
            }), v15.GameTile;
        end;
    end, {
        v48, 
        v19, 
        v31, 
        v20, 
        v21, 
        v16, 
        v17, 
        v18, 
        v29, 
        v23, 
        v24, 
        v28, 
        v25, 
        v27, 
        v26, 
        v30, 
        v47, 
        v32, 
        v33, 
        v34, 
        v35, 
        v39, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v43 else nil, 
        if l_FFlagLuaAppGameTileInteractionFeedback_0 then v44 else nil, 
        v36, 
        v37, 
        v38, 
        if l_FFlagLuaAppMigrateGameTile_0 then v40 else nil, 
        if l_FFlagLuaAppMigrateGameTile_0 then v49 else nil
    }));
end;