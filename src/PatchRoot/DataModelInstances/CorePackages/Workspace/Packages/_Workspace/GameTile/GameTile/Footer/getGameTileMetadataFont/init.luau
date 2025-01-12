return function(v0, v1) --[[ Line: 1 ]] --[[ Name: getGameTileMetadataFont ]]
    if v0 then
        return v1.Semantic.Typography.Body;
    else
        return v1.Semantic.Typography.CaptionHeader;
    end;
end;