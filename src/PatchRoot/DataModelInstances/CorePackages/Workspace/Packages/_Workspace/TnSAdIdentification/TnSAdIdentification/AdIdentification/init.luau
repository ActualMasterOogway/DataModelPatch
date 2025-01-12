local l_AdService_0 = game:GetService("AdService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TnSAdIdentification");
local v3 = require(l_script_FirstAncestor_0.Flags.GetFIntAdIdentificationMinimumAreaPerMyriad);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFIntAdIdentifiedTelemetryThrottleHundredthsPercent);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.LoggingProtocol);
local l_default_0 = v6.default;
local v8 = math.max(v3() / 10000, 0);
local v9 = {};
getLocalCharacterPosition = function(v10) --[[ Line: 25 ]] --[[ Name: getLocalCharacterPosition ]]
    local l_HumanoidRootPart_0 = v10:FindFirstChild("HumanoidRootPart");
    if not l_HumanoidRootPart_0 then
        return nil;
    else
        return l_HumanoidRootPart_0.Position;
    end;
end;
local v12 = Vector2.new(0, 0);
local v13 = Vector2.new(1e999, 1e999);
getViewportCorners = function(v14, v15) --[[ Line: 36 ]] --[[ Name: getViewportCorners ]]
    -- upvalues: v13 (copy), v12 (copy)
    local l_v13_0 = v13;
    local l_v12_0 = v12;
    local l_ViewportSize_0 = v15.ViewportSize;
    local v19 = 0;
    for _, v21 in ipairs(v14) do
        local v22, v23 = v15:WorldToViewportPoint(v21);
        local v24 = Vector2.new(v22.X, v22.Y) / l_ViewportSize_0;
        if not v23 then
            v24 = Vector2.new(math.clamp(v24.X, 0, 1), (math.clamp(v24.Y, 0, 1)));
        end;
        v19 = v19 + 1;
        l_v13_0 = l_v13_0:Min(v24);
        l_v12_0 = l_v12_0:Max(v24);
    end;
    if v19 <= 2 then
        return v13, v12;
    else
        return l_v13_0, l_v12_0;
    end;
end;
checkVisibility = function(v25, v26, v27, v28) --[[ Line: 65 ]] --[[ Name: checkVisibility ]]
    local l_Position_0 = v25.CFrame.Position;
    local l_ViewportSize_1 = v25.ViewportSize;
    local v31 = RaycastParams.new();
    v31.FilterType = Enum.RaycastFilterType.Exclude;
    v31.FilterDescendantsInstances = v28;
    v31.IgnoreWater = true;
    local v32 = 0;
    local v33 = 0;
    local v34 = v27[2] - v27[1];
    local v35 = v27[3] - v27[1];
    for v36 = 1, 4 do
        local v37 = v34 * (v36 - 0.5) / 4;
        for v38 = 1, 4 do
            local v39 = v27[1] + v37 + v35 * (v38 - 0.5) / 4;
            local v40 = v39 - l_Position_0;
            v32 = v32 + 1;
            local v41, _ = v25:WorldToViewportPoint(v39);
            if v41.Z >= 0 and v41.X >= 0 and v41.Y >= 0 and v41.X <= l_ViewportSize_1.X and v41.Y <= l_ViewportSize_1.Y then
                local v43 = workspace:Raycast(l_Position_0, v40 * 1.1, v31);
                if v43 and v43.Instance == v26 then
                    v33 = v33 + 1;
                end;
            end;
        end;
    end;
    return v33 / v32;
end;
createSingleVisibleRegionFromWorldSpaceCorners = function(v44, v45) --[[ Line: 112 ]] --[[ Name: createSingleVisibleRegionFromWorldSpaceCorners ]]
    local l_ViewportSize_2 = v45.ViewportSize;
    local v47 = table.create(#v44);
    for v48, v49 in ipairs(v44) do
        local v50, _ = v45:WorldToViewportPoint(v49);
        v47[v48] = Vector2.new(v50.X, v50.Y) / l_ViewportSize_2;
    end;
    return {
        convexHull = {
            v47[1], 
            v47[2], 
            v47[4], 
            v47[3]
        }, 
        id = 1
    };
end;
getAdCenterAndScreenArea = function(v52, v53) --[[ Line: 126 ]] --[[ Name: getAdCenterAndScreenArea ]]
    local l_ViewportSize_3 = v53.ViewportSize;
    local v55 = Vector3.new(0, 0, 0, 0);
    local v56 = 0;
    local v57 = {};
    for _, v59 in ipairs(v52) do
        v55 = v55 + v59;
        local v60, _ = v53:WorldToViewportPoint(v59);
        table.insert(v57, Vector2.new(v60.X, v60.Y) / l_ViewportSize_3);
    end;
    return v55 / 4, (v56 + math.abs(((v57[2] - v57[1]):Cross(v57[3] - v57[1]))) + math.abs(((v57[2] - v57[4]):Cross(v57[3] - v57[4])))) / 2;
end;
v9.getAdsForPoint = function(v62, v63) --[[ Line: 193 ]]
    local v64 = {};
    for v65, v66 in pairs(v62) do
        local l_boundingBox_0 = v66.boundingBox;
        if v63.X >= l_boundingBox_0.min.X and v63.Y >= l_boundingBox_0.min.Y and v63.X <= l_boundingBox_0.max.X and v63.Y <= l_boundingBox_0.max.Y then
            for _, v69 in ipairs(v66.visibleRegions) do
                local l_convexHull_0 = v69.convexHull;
                if #l_convexHull_0 >= 3 then
                    local v71 = l_convexHull_0[#l_convexHull_0];
                    local v72 = true;
                    local v73 = true;
                    for _, v75 in ipairs(l_convexHull_0) do
                        local v76 = (v75 - v71):Cross(v63 - v71);
                        v73 = v73 and v76 <= 0;
                        v72 = v72 and v76 >= 0;
                        v71 = v75;
                    end;
                    if v72 or v73 then
                        v64[v65] = v66;
                        break;
                    end;
                end;
            end;
        end;
    end;
    return v64;
end;
v9.getVisibleAds = function() --[[ Line: 229 ]]
    -- upvalues: l_AdService_0 (copy), l_Players_0 (copy), v13 (copy), v8 (copy), l_default_0 (copy), v6 (copy), v4 (copy)
    local v77 = {};
    local v78 = {
        totalAds = 0, 
        checkedAds = 0, 
        duration = 0
    };
    if not game:GetEngineFeature("GetReportAdInfo") then
        return v77, v78;
    else
        local l_l_AdService_0_ReportAdInfo_0 = l_AdService_0:GetReportAdInfo();
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if not l_CurrentCamera_0 then
            return v77, v78;
        else
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if not l_LocalPlayer_0 then
                return v77, v78;
            else
                local l_Character_0 = l_LocalPlayer_0.Character;
                local v83 = nil;
                local v84 = {};
                v83 = if l_Character_0 then getLocalCharacterPosition(l_Character_0) or l_CurrentCamera_0.CFrame.Position else l_CurrentCamera_0.CFrame.Position;
                local v85 = os.clock();
                v78.totalAds = #l_l_AdService_0_ReportAdInfo_0;
                local function _() --[[ Line: 266 ]]
                    -- upvalues: v78 (copy), v85 (copy)
                    v78.duration = os.clock() - v85;
                    return v78;
                end;
                local function _() --[[ Line: 271 ]]
                    -- upvalues: v85 (copy)
                    return os.clock() - v85 > 0.2;
                end;
                local v88 = 1;
                for _, v90 in ipairs(l_l_AdService_0_ReportAdInfo_0) do
                    if os.clock() - v85 > 0.2 then
                        local l_v77_0 = v77;
                        v78.duration = os.clock() - v85;
                        return l_v77_0, v78;
                    else
                        local l_basePart_0 = v90.basePart;
                        local l_adUnitName_0 = v90.adUnitName;
                        local l_assetId_0 = v90.assetId;
                        local l_encryptedAdTrackingData_0 = v90.encryptedAdTrackingData;
                        local l_encryptionMetadata_0 = v90.encryptionMetadata;
                        if l_encryptedAdTrackingData_0 == "" or l_encryptionMetadata_0 == "" or l_assetId_0 == "11307989327" then
                            v78.checkedAds = v78.checkedAds + 1;
                        else
                            local l_assetCorners_0 = v90.assetCorners;
                            if not l_assetCorners_0 or #l_assetCorners_0 < 4 then
                                v78.checkedAds = v78.checkedAds + 1;
                            else
                                local v98, v99 = getAdCenterAndScreenArea(l_assetCorners_0, l_CurrentCamera_0);
                                local l_Magnitude_0 = (v98 - v83).Magnitude;
                                if (v98 - l_CurrentCamera_0.CFrame.Position):Dot(l_CurrentCamera_0.CFrame.LookVector) < 0 then
                                    v78.checkedAds = v78.checkedAds + 1;
                                else
                                    local l_Unit_0 = (l_assetCorners_0[1] - l_assetCorners_0[2]):Cross(l_assetCorners_0[1] - l_assetCorners_0[3]).Unit;
                                    if l_Unit_0:Dot(v98 - l_basePart_0.Position) < 0 then
                                        l_Unit_0 = -l_Unit_0;
                                    end;
                                    if (l_CurrentCamera_0.CFrame.Position - v98):Dot(l_Unit_0) < 0 then
                                        v78.checkedAds = v78.checkedAds + 1;
                                    else
                                        local v102, v103 = getViewportCorners(l_assetCorners_0, l_CurrentCamera_0);
                                        if v102 == v13 then
                                            v78.checkedAds = v78.checkedAds + 1;
                                        elseif v99 < v8 then
                                            v78.checkedAds = v78.checkedAds + 1;
                                        else
                                            local v104 = checkVisibility(l_CurrentCamera_0, l_basePart_0, l_assetCorners_0, v84);
                                            if v104 < 0.3 then
                                                v78.checkedAds = v78.checkedAds + 1;
                                            elseif os.clock() - v85 > 0.2 then
                                                local l_v77_1 = v77;
                                                v78.duration = os.clock() - v85;
                                                return l_v77_1, v78;
                                            else
                                                v77[v88] = {
                                                    distance = l_Magnitude_0, 
                                                    boundingBox = {
                                                        min = v102, 
                                                        max = v103
                                                    }, 
                                                    hitRate = v104, 
                                                    visibleRegions = {
                                                        createSingleVisibleRegionFromWorldSpaceCorners(l_assetCorners_0, l_CurrentCamera_0)
                                                    }, 
                                                    adUnitName = l_adUnitName_0, 
                                                    assetId = l_assetId_0, 
                                                    encryptedAdTrackingData = l_encryptedAdTrackingData_0, 
                                                    encryptionMetadata = l_encryptionMetadata_0
                                                };
                                                l_default_0:logRobloxTelemetryEvent({
                                                    eventName = "AdIdentifiedInAbuseReport", 
                                                    backends = {
                                                        v6.TelemetryBackends.Points
                                                    }, 
                                                    throttlingPercentage = v4(), 
                                                    lastUpdated = {
                                                        24, 
                                                        6, 
                                                        25
                                                    }, 
                                                    description = "Ad Identified in Report Anything Screenshot"
                                                }, nil, {
                                                    assetId = l_assetId_0, 
                                                    encryptedAdTrackingData = l_encryptedAdTrackingData_0, 
                                                    encryptionMetadata = l_encryptionMetadata_0
                                                });
                                                v78.checkedAds = v78.checkedAds + 1;
                                                v88 = v88 + 1;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                local l_v77_2 = v77;
                v78.duration = os.clock() - v85;
                return l_v77_2, v78;
            end;
        end;
    end;
end;
return v9;