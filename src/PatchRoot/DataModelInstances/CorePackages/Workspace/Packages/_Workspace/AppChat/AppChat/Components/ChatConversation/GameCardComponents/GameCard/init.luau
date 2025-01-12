local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.AssetCardComponents.AssetCard);
local v5 = require(script.Parent.PlayButton);
local v6 = require(script.Parent.ViewDetailsButton);
local v7 = v2.PureComponent:extend("GameCard");
v7.defaultProps = {
    isPlayButtonEnabled = true, 
    playText = "Play", 
    viewDetailsText = "View Details", 
    noDescriptionText = "Placeholder: No Description", 
    gameName = nil, 
    gameIcon = nil, 
    gameDescription = nil, 
    contentLoadedCallback = nil, 
    bodyActivated = nil, 
    playabilityStatus = nil, 
    conversationId = nil, 
    universeId = nil, 
    placeId = nil, 
    price = nil, 
    eventStream = nil, 
    playButtonActivated = nil, 
    viewDetailsActivated = nil, 
    viewDetailsEnabled = true
};
v7.makeButtons = function(v8, _) --[[ Line: 61 ]] --[[ Name: makeButtons ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy), v6 (copy)
    if not v8.props.playabilityStatus then
        return;
    else
        local l_isPlayable_0 = v8.props.playabilityStatus.isPlayable;
        if v8.props.isLoading then
            return {
                loading = v2.createElement(v3.App.Loading.ShimmerPanel, {
                    Size = UDim2.new(1, 0, 0, 32), 
                    cornerRadius = UDim.new(0, 4)
                })
            };
        elseif v8.props.isPlayButtonEnabled and l_isPlayable_0 == true then
            return {
                playButton = v2.createElement(v5, {
                    placeId = v8.props.placeId, 
                    universeId = v8.props.universeId, 
                    text = v8.props.playText, 
                    conversationId = v8.props.conversationId, 
                    onActivated = function() --[[ Line: 85 ]] --[[ Name: onActivated ]]
                        -- upvalues: v8 (copy)
                        v8.props.onPlayButtonActivated(v8.props);
                    end, 
                    eventStream = v8.props.eventStream
                })
            };
        elseif v8.props.viewDetailsEnabled then
            return {
                viewDetails = v2.createElement(v6, {
                    text = v8.props.viewDetailsText, 
                    onActivated = function() --[[ Line: 97 ]] --[[ Name: onActivated ]]
                        -- upvalues: v8 (copy)
                        v8.props.openDetails(v8.props);
                    end, 
                    eventStream = v8.props.eventStream
                })
            };
        else
            return;
        end;
    end;
end;
v7.render = function(v11) --[[ Line: 107 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    return v3.Style.withStyle(function(v12) --[[ Line: 108 ]]
        -- upvalues: v11 (copy), v2 (ref), v4 (ref)
        if v11.props.universeId then
            local v13 = nil;
            if v11.props.gameDescription then
                v13 = v11.props.gameDescription:gsub("%s", " ");
                if v13:gsub("^%s+$", "") == "" then
                    v13 = v11.props.noDescriptionText;
                end;
            end;
            return v2.createElement(v4, {
                isLoading = v11.props.isLoading, 
                cardTitle = v11.props.gameName, 
                cardBodyText = v13, 
                cardIcon = v11.props.gameIcon, 
                contentLoadedCallback = v11.props.contentLoadedCallback, 
                bodyActivated = function() --[[ Line: 128 ]] --[[ Name: bodyActivated ]]
                    -- upvalues: v11 (ref)
                    if v11.props.viewDetailsEnabled then
                        v11.props.openDetails(v11.props);
                    end;
                end
            }, v11:makeButtons(v12));
        else
            return v2.createElement(v4, {
                cardTitle = v11.props.gameName or "", 
                cardBodyText = v11.props.gameDescription or "", 
                cardIcon = v11.props.gameIcon or "", 
                isLoading = true
            }, {
                fill = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 32)
                })
            });
        end;
    end);
end;
return v7;