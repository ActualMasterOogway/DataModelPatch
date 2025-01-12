local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_script_FirstAncestor_0.constants);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.Parent.Style);
local v6 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useEventConnection_0 = v4.useEventConnection;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_GetTextSize_0 = v5.GetTextSize;
return function(v10) --[[ Line: 21 ]] --[[ Name: TrackDetails ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), l_GetTextSize_0 (copy), v2 (copy), l_useEventConnection_0 (copy), l_RunService_0 (copy)
    local v11 = l_useStyle_0();
    local l_CaptionHeader_0 = v11.Font.CaptionHeader;
    local l_CaptionBody_0 = v11.Font.CaptionBody;
    local l_TextEmphasis_0 = v11.Theme.TextEmphasis;
    local l_TextMuted_0 = v11.Theme.TextMuted;
    local v16 = v3.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: l_GetTextSize_0 (ref), v10 (copy), l_CaptionHeader_0 (copy), v2 (ref)
        return l_GetTextSize_0(v10.trackName, l_CaptionHeader_0.RelativeSize, l_CaptionHeader_0.Font, v2.BIG_VECTOR);
    end, {
        v10.trackName, 
        l_CaptionHeader_0.RelativeSize, 
        l_CaptionHeader_0.Font
    }).X * 12;
    local v17 = 1 / (v16 / 60 * 2);
    local v18, v19 = v3.useBinding({
        0, 
        0, 
        0
    });
    l_useEventConnection_0(l_RunService_0.Heartbeat, function(v20) --[[ Line: 42 ]]
        -- upvalues: v18 (copy), v17 (copy), v19 (copy)
        local v21 = v18:getValue();
        for v22 = 1, #v21 do
            v21[v22] = v21[v22] + v17 * v20;
            if v22 == 1 and v21[v22] >= 1 then
                v21[v22] = -2;
            elseif v22 == 2 and v21[v22] >= 2 then
                v21[v22] = -1;
            elseif v22 == 3 and v21[v22] >= 3 then
                v21[v22] = 0;
            end;
        end;
        v19(v21);
    end, {
        v17
    });
    local function v24(v23) --[[ Line: 60 ]] --[[ Name: createTrackNameInstance ]]
        -- upvalues: v3 (ref), v10 (copy), l_CaptionHeader_0 (copy), v11 (copy), l_TextEmphasis_0 (copy)
        return v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v10.trackName, 
            Font = l_CaptionHeader_0.Font, 
            TextSize = v11.Font.BaseSize * l_CaptionHeader_0.RelativeSize, 
            TextColor3 = l_TextEmphasis_0.Color, 
            Size = UDim2.fromScale(1, 1), 
            TextTransparency = l_TextEmphasis_0.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Position = v23
        });
    end;
    return v3.createElement("Frame", {
        Size = v10.size, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        Layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        ScrollingFrame = v3.createElement("Frame", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(v16, v2.TRACK_NAME_HEIGHT)
        }, {
            FirstTrackName = v24(v18:map(function(v25) --[[ Line: 90 ]]
                return UDim2.fromScale(-v25[1], 0);
            end)), 
            SecondTrackName = v24(v18:map(function(v26) --[[ Line: 94 ]]
                return UDim2.fromScale(1 - v26[2], 0);
            end)), 
            ThirdTrackName = v24(v18:map(function(v27) --[[ Line: 98 ]]
                return UDim2.fromScale(2 - v27[3], 0);
            end)), 
            Padding = v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 5)
            })
        }), 
        ArtistName = v3.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v10.artistName, 
            Font = l_CaptionBody_0.Font, 
            TextSize = v11.Font.BaseSize * l_CaptionBody_0.RelativeSize * 0.9, 
            TextColor3 = l_TextMuted_0.Color, 
            Size = UDim2.new(1, 0, 0, v2.ARTIST_NAME_HEIGHT), 
            TextTransparency = l_TextMuted_0.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2
        })
    });
end;