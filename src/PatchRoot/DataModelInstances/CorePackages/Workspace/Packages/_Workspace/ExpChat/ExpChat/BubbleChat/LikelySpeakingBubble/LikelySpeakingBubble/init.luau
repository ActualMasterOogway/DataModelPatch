local l_TweenService_0 = game:GetService("TweenService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.ExpChatShared);
local v4 = require(l_script_FirstAncestor_0.Config);
local v5 = require(l_Parent_0.React);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_script_FirstAncestor_1 = script:FindFirstAncestor("BubbleChat");
local v8 = require(l_script_FirstAncestor_1.Carat);
local l_AvatarChatUISettings_0 = v4.AvatarChatUISettings;
local l_Analytics_0 = v3.Analytics;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableInExpLikelySpeakingAnalytics);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local v14 = Color3.fromRGB(57, 59, 61);
local v15 = UDim2.new(0.07, 0, 0.01, 0);
local function v20(v16) --[[ Line: 39 ]] --[[ Name: createSizeChangeTween ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Scale_0 = v16.Size.X.Scale;
    local v18 = TweenInfo.new(math.random(20, 30) * 0.01, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true);
    local v19 = {
        Size = UDim2.fromScale(l_Scale_0, math.random(2.5, 5) * 0.1)
    };
    return (l_TweenService_0:Create(v16, v18, v19));
end;
local function v22() --[[ Line: 54 ]] --[[ Name: getAnalyticsData ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v21 = "";
    if l_game_EngineFeature_0 then
        v21 = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    return game.GameId, game.PlaceId, v21;
end;
return function(v23) --[[ Line: 62 ]] --[[ Name: LikelySpeakingBubble ]]
    -- upvalues: v5 (copy), l_AvatarChatUISettings_0 (copy), v12 (copy), l_Analytics_0 (copy), v22 (copy), v20 (copy), v14 (copy), v15 (copy), l_Dictionary_0 (copy), v8 (copy)
    local v24 = v5.useRef(nil);
    local l_chatSettings_0 = v23.chatSettings;
    local l_SingleIconButtonSize_0 = l_AvatarChatUISettings_0.SingleIconButtonSize;
    local l_SingleIconCornerRadiusOffset_0 = l_AvatarChatUISettings_0.SingleIconCornerRadiusOffset;
    v5.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: v12 (ref), l_Analytics_0 (ref), v22 (ref)
        if v12() then
            l_Analytics_0.FireLikelySpeakingBubbleAnalytics("shown", v22());
        end;
    end, {});
    v5.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v24 (copy), v20 (ref)
        local v28 = {};
        if v24.current then
            for _, v30 in (v24.current:GetChildren()) do
                if v30:IsA("Frame") then
                    local v31 = v20(v30);
                    table.insert(v28, v31);
                    v31:Play();
                end;
            end;
            return function() --[[ Line: 86 ]]
                -- upvalues: v28 (copy)
                for _, v33 in v28 do
                    if v33 then
                        v33:Cancel();
                    end;
                end;
            end;
        else
            return;
        end;
    end, {
        v24.current
    });
    local v36 = v5.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: v5 (ref), l_SingleIconCornerRadiusOffset_0 (copy), v14 (ref), v15 (ref)
        local v34 = {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_SingleIconCornerRadiusOffset_0)
            }), 
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 2)
            })
        };
        for v35 = 1, 4 do
            v34["Line" .. v35] = v5.createElement("Frame", {
                BackgroundColor3 = v14, 
                Size = v15, 
                BorderSizePixel = 0, 
                ZIndex = 3, 
                LayoutOrder = v35
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_SingleIconCornerRadiusOffset_0)
                })
            });
        end;
        return v34;
    end, {});
    return v5.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Size = l_SingleIconButtonSize_0, 
        LayoutOrder = v23.LayoutOrder, 
        BackgroundTransparency = l_chatSettings_0.BackgroundTransparency, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3
    }, {
        Scale = v5.createElement("UIScale", {
            Scale = not v23.isInsideMaximizeDistance and 0.75 or 1
        }), 
        UICorner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_SingleIconCornerRadiusOffset_0)
        }), 
        Container = v5.createElement("ImageLabel", l_Dictionary_0.join({
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, l_chatSettings_0.ImageLabel), {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, l_SingleIconCornerRadiusOffset_0)
            }), 
            LikelySpeakingBubble = v5.createElement("TextButton", {
                Size = l_SingleIconButtonSize_0, 
                BorderSizePixel = 0, 
                Transparency = 1, 
                TextTransparency = 1, 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                [v5.Event.Activated] = function() --[[ Line: 160 ]]
                    -- upvalues: v12 (ref), l_Analytics_0 (ref), v22 (ref), v23 (copy)
                    if v12() then
                        l_Analytics_0.FireLikelySpeakingBubbleAnalytics("clicked", v22());
                    end;
                    if v23.onActivated then
                        v23.onActivated();
                    end;
                end
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, l_SingleIconCornerRadiusOffset_0)
                }), 
                Contents = v5.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BorderSizePixel = 0, 
                    Transparency = 1, 
                    BackgroundTransparency = 1, 
                    ref = v24, 
                    ZIndex = 2
                }, v36)
            })
        }), 
        Carat = l_chatSettings_0.TailVisible and v5.createElement(v8, {
            layoutOrder = 3, 
            chatSettings = l_chatSettings_0
        }), 
        BubbleGradient = l_chatSettings_0.UIGradient and v5.createElement("UIGradient", l_chatSettings_0.UIGradient)
    });
end;