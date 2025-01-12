local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local v1 = require(l_script_FirstAncestor_0.Flags.GetFFlagGetHumanoidDescriptionUpdates);
local l_Players_0 = game:GetService("Players");
local v3 = {
    ERR_RA_CHARACTER = "ERR_RA_CHARACTER", 
    ERR_RA_HUMPLAYER = "ERR_RA_HUMPLAYER", 
    ERR_RA_HUMOBJ = "ERR_RA_HUMOBJ", 
    ERR_RA_HUMDESC = "ERR_RA_HUMDESC", 
    OK = "OK"
};
local function v8(v4) --[[ Line: 60 ]]
    local v5 = {};
    for _, v7 in ipairs(v4) do
        table.insert(v5, {
            AccessoryType = v7.AccessoryType.Value, 
            AssetId = v7.AssetId, 
            IsLayered = v7.IsLayered, 
            Order = v7.Order, 
            Puffiness = v7.Puffiness
        });
    end;
    return v5;
end;
return {
    getHumanoidDescription = function(v9) --[[ Line: 74 ]]
        -- upvalues: l_Players_0 (copy), v3 (copy), v1 (copy), v8 (copy)
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v9);
        local v11 = {
            BackAccessory = "", 
            BodyTypeScale = 0, 
            ClimbAnimation = 0, 
            DepthScale = 0, 
            Face = 0, 
            FaceAccessory = "", 
            FallAnimation = 0, 
            FrontAccessory = "", 
            GraphicTShirt = 0, 
            HairAccessory = "", 
            HatAccessory = "", 
            Head = 0, 
            HeadColor = {
                0, 
                0, 
                0
            }, 
            HeadScale = 0, 
            HeightScale = 0, 
            IdleAnimation = 0, 
            JumpAnimation = 0, 
            LeftArm = 0, 
            LeftArmColor = {
                0, 
                0, 
                0
            }, 
            LeftLeg = 0, 
            LeftLegColor = {
                0, 
                0, 
                0
            }, 
            MoodAnimation = 0, 
            NeckAccessory = "", 
            Pants = 0, 
            ProportionScale = 0, 
            RightArm = 0, 
            RightArmColor = {
                0, 
                0, 
                0
            }, 
            RightLeg = 0, 
            RightLegColor = {
                0, 
                0, 
                0
            }, 
            RunAnimation = 0, 
            Shirt = 0, 
            ShouldersAccessory = "", 
            SwimAnimation = 0, 
            Torso = 0, 
            TorsoColor = {
                0, 
                0, 
                0
            }, 
            WaistAccessory = "", 
            WalkAnimation = 0, 
            WidthScale = 0
        };
        if not l_l_Players_0_PlayerByUserId_0 then
            return v11, v3.ERR_RA_HUMPLAYER;
        else
            local l_Character_0 = l_l_Players_0_PlayerByUserId_0.Character;
            if l_Character_0 then
                local v13 = l_Character_0:WaitForChild("Humanoid", 1);
                if not v13 then
                    return v11, v3.ERR_RA_HUMOBJ;
                else
                    local v14 = nil;
                    if v1() then
                        local v15 = nil;
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 135 ]]
                            -- upvalues: v13 (copy)
                            return (v13:GetAppliedDescription());
                        end);
                        v15 = l_status_0;
                        v14 = l_result_0;
                        if not v15 then
                            return v11, v3.ERR_RA_HUMOBJ;
                        end;
                    else
                        v14 = v13:GetAppliedDescription();
                    end;
                    if not v14 then
                        return v11, v3.ERR_RA_HUMDESC;
                    else
                        local v18 = 0;
                        do
                            local l_v14_0 = v14;
                            if v1() then
                                local function v21(v20) --[[ Line: 152 ]]
                                    -- upvalues: l_v14_0 (ref), v11 (copy)
                                    if typeof(l_v14_0[v20]) == "Color3" then
                                        v11[v20] = {
                                            l_v14_0[v20].R, 
                                            l_v14_0[v20].G, 
                                            l_v14_0[v20].B
                                        };
                                        return;
                                    else
                                        v11[v20] = l_v14_0[v20];
                                        return;
                                    end;
                                end;
                                for v22, _ in pairs(v11) do
                                    if not pcall(v21, v22) then
                                        v18 = v18 + 1;
                                    end;
                                end;
                                local l_status_1, l_result_1 = pcall(l_v14_0.GetAccessories, l_v14_0, false);
                                if l_status_1 then
                                    local l_status_2, l_result_2 = pcall(v8, l_result_1);
                                    if l_status_2 then
                                        v11.AccessoryBlob = l_result_2;
                                    else
                                        v18 = v18 + 1;
                                    end;
                                else
                                    v18 = v18 + 1;
                                end;
                                v11.FieldErrorCount = v18;
                            else
                                pcall(function() --[[ Line: 187 ]]
                                    -- upvalues: v11 (copy), l_v14_0 (ref)
                                    for v28, _ in pairs(v11) do
                                        if typeof(l_v14_0[v28]) == "Color3" then
                                            v11[v28] = {
                                                l_v14_0[v28].R, 
                                                l_v14_0[v28].G, 
                                                l_v14_0[v28].B
                                            };
                                        else
                                            v11[v28] = l_v14_0[v28];
                                        end;
                                    end;
                                end);
                            end;
                        end;
                        return v11, v3.OK;
                    end;
                end;
            else
                return v11, v3.ERR_RA_CHARACTER;
            end;
        end;
    end
};