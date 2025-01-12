local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Components.ChromeWindow);
local v3 = require(l_script_FirstAncestor_0.Hooks.useCurrentSong);
local v4 = require(l_script_FirstAncestor_0.Hooks.useAssetFavoriting);
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
local l_useMemo_0 = v1.useMemo;
local l_GetFFlagSongbirdUseReportAudioModal_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).GetFFlagSongbirdUseReportAudioModal;
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagUpdateReportModalForAudio);
local v10 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdFixReportModalShownBehavior);
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdFasterUpdatesBetweenMusicChanges);
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagSongbirdUnverifiedMusicState);
local v13 = require(l_script_FirstAncestor_0.Components.ReportAudioPopupContext);
return function(v14) --[[ Line: 28 ]] --[[ Name: ChromeWindowWrapper ]]
    -- upvalues: v3 (copy), l_GetFFlagSongbirdUseReportAudioModal_0 (copy), v13 (copy), v12 (copy), l_useMemo_0 (copy), v4 (copy), v9 (copy), l_useEffect_0 (copy), l_useCallback_0 (copy), v10 (copy), v1 (copy), v2 (copy), v11 (copy)
    local v15 = v3();
    local v16 = if l_GetFFlagSongbirdUseReportAudioModal_0() then v13.use() else nil;
    local v17 = if v12() then l_useMemo_0(function() --[[ Line: 34 ]]
        -- upvalues: v15 (copy)
        if v15 then
            return (tonumber(v15.metadata.AssetId));
        else
            return nil;
        end;
    end, {
        v15
    }) else l_useMemo_0(function() --[[ Line: 37 ]]
        -- upvalues: v15 (copy)
        if v15.metadata then
            return (tonumber(v15.metadata.AssetId));
        else
            return nil;
        end;
    end, {
        v15.metadata
    });
    local v18 = v4(v17);
    if v9() then
        l_useEffect_0(function() --[[ Line: 46 ]]
            -- upvalues: v16 (copy), v17 (copy)
            v16.setAssetId(v17);
            return function() --[[ Line: 49 ]]
                -- upvalues: v16 (ref)
                v16.setAssetId(nil);
            end;
        end, {
            v17
        });
    end;
    local v19 = l_useCallback_0(function() --[[ Line: 55 ]]
        -- upvalues: l_GetFFlagSongbirdUseReportAudioModal_0 (ref), v16 (copy), v14 (copy), v10 (ref)
        if l_GetFFlagSongbirdUseReportAudioModal_0() then
            v16.setVisibility(true);
        end;
        if v14.onReport then
            v14.onReport();
        end;
        if not v10() and v14.onClose then
            v14.onClose();
        end;
    end, {
        v14.onClose, 
        v14.onReport
    });
    return v1.createElement(v2, {
        song = if v12() then if v15 then {
            title = v15.metadata.Title, 
            artists = {
                v15.metadata.Artist
            }, 
            isLiked = v18.isFavorited, 
            meetsCriteria = v15.meetsCriteria
        } else nil else if v15.metadata then {
            title = v15.metadata.Title, 
            artists = {
                v15.metadata.Artist
            }, 
            isLiked = v18.isFavorited
        } else nil, 
        maxSize = v14.maxSize, 
        isLoading = if v11() then nil else v18.isLoading or v15.metadata == nil, 
        onToggleLike = v18.toggleFavorite, 
        onReport = v19, 
        onClose = v14.onClose
    });
end;