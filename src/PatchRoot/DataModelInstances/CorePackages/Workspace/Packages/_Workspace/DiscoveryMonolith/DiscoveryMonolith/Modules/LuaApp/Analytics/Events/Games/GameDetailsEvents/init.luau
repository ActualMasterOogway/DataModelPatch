local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_Immutable_0 = require(l_Parent_0.AppCommonLib).Immutable;
local l_FFlagMediaGallerySnappingTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagMediaGallerySnappingTelemetry;
local l_FFlagMediaAccordionAndFullTelemetry_0 = require(l_Parent_0.SharedFlags).FFlagMediaAccordionAndFullTelemetry;
local l_FFlagLuaAppFiatPaidAccess_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppFiatPaidAccess;
local function _(v6) --[[ Line: 12 ]] --[[ Name: gameDetailsBasicEvent ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy)
    return function(v7, v8, v9, v10) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (ref), l_Immutable_0 (ref), v6 (copy)
        assert(type(v8) == "string", "Expected eventContext to be a string");
        assert(type(v9) == "string", "Expected placeId to be a string");
        assert(type(v10) == "table", "Expected state to be a table");
        local v11 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v9
        };
        v11 = l_Immutable_0.JoinDictionaries(v11, v10);
        v7:setRBXEventStream(v8, v6, v11);
    end;
end;
local function _(v13) --[[ Line: 31 ]] --[[ Name: gameDetailsToggleEvent ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy)
    local function v19(v14, v15, v16, v17) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (ref), l_Immutable_0 (ref), v13 (copy)
        assert(type(v15) == "string", "Expected eventContext to be a string");
        assert(type(v16) == "string", "Expected placeId to be a string");
        assert(type(v17) == "table", "Expected state to be a table");
        local v18 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v16
        };
        v18 = l_Immutable_0.JoinDictionaries(v18, v17);
        v14:setRBXEventStream(v15, v13, v18);
    end;
    return function(v20, v21, v22, v23, v24) --[[ Line: 33 ]]
        -- upvalues: l_Immutable_0 (ref), v19 (copy)
        assert(type(v23) == "boolean", "Expected state to be a boolean");
        if v24 ~= nil then
            assert(type(v24) == "table", "Expected extraData to be a table");
        end;
        local v25 = l_Immutable_0.JoinDictionaries(v24 or {}, {
            state = v23 and "on" or "off"
        });
        return v19(v20, v21, v22, v25);
    end;
end;
local function _(v27) --[[ Line: 47 ]] --[[ Name: gameDetailsSimpleEvent ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy)
    local function v33(v28, v29, v30, v31) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (ref), l_Immutable_0 (ref), v27 (copy)
        assert(type(v29) == "string", "Expected eventContext to be a string");
        assert(type(v30) == "string", "Expected placeId to be a string");
        assert(type(v31) == "table", "Expected state to be a table");
        local v32 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v30
        };
        v32 = l_Immutable_0.JoinDictionaries(v32, v31);
        v28:setRBXEventStream(v29, v27, v32);
    end;
    return function(v34, v35, v36, v37) --[[ Line: 49 ]]
        -- upvalues: v33 (copy)
        return v33(v34, v35, v36, v37 or {});
    end;
end;
local v39 = {};
local v40 = "copyExperienceLink";
local l_v40_0 = v40 --[[ copy: 13 -> 14 ]];
local function v47(v42, v43, v44, v45) --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_0 (copy)
    assert(type(v43) == "string", "Expected eventContext to be a string");
    assert(type(v44) == "string", "Expected placeId to be a string");
    assert(type(v45) == "table", "Expected state to be a table");
    local v46 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v44
    };
    v46 = l_Immutable_0.JoinDictionaries(v46, v45);
    v42:setRBXEventStream(v43, l_v40_0, v46);
end;
local l_v47_0 = v47 --[[ copy: 12 -> 15 ]];
v39.CopyExperienceLink = function(v49, v50, v51, v52) --[[ Line: 49 ]]
    -- upvalues: l_v47_0 (copy)
    return l_v47_0(v49, v50, v51, v52 or {});
end;
v40 = "favorite";
local l_v40_1 = v40 --[[ copy: 13 -> 16 ]];
v47 = function(v54, v55, v56, v57) --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_1 (copy)
    assert(type(v55) == "string", "Expected eventContext to be a string");
    assert(type(v56) == "string", "Expected placeId to be a string");
    assert(type(v57) == "table", "Expected state to be a table");
    local v58 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v56
    };
    v58 = l_Immutable_0.JoinDictionaries(v58, v57);
    v54:setRBXEventStream(v55, l_v40_1, v58);
end;
local l_v47_1 = v47 --[[ copy: 12 -> 17 ]];
v39.Favorite = function(v60, v61, v62, v63, v64) --[[ Line: 33 ]]
    -- upvalues: l_Immutable_0 (copy), l_v47_1 (copy)
    assert(type(v63) == "boolean", "Expected state to be a boolean");
    if v64 ~= nil then
        assert(type(v64) == "table", "Expected extraData to be a table");
    end;
    local v65 = l_Immutable_0.JoinDictionaries(v64 or {}, {
        state = v63 and "on" or "off"
    });
    return l_v47_1(v60, v61, v62, v65);
end;
v40 = "follow";
local l_v40_2 = v40 --[[ copy: 13 -> 18 ]];
v47 = function(v67, v68, v69, v70) --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_2 (copy)
    assert(type(v68) == "string", "Expected eventContext to be a string");
    assert(type(v69) == "string", "Expected placeId to be a string");
    assert(type(v70) == "table", "Expected state to be a table");
    local v71 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v69
    };
    v71 = l_Immutable_0.JoinDictionaries(v71, v70);
    v67:setRBXEventStream(v68, l_v40_2, v71);
end;
local l_v47_2 = v47 --[[ copy: 12 -> 19 ]];
v39.Follow = function(v73, v74, v75, v76, v77) --[[ Line: 33 ]]
    -- upvalues: l_Immutable_0 (copy), l_v47_2 (copy)
    assert(type(v76) == "boolean", "Expected state to be a boolean");
    if v77 ~= nil then
        assert(type(v77) == "table", "Expected extraData to be a table");
    end;
    local v78 = l_Immutable_0.JoinDictionaries(v77 or {}, {
        state = v76 and "on" or "off"
    });
    return l_v47_2(v73, v74, v75, v78);
end;
v40 = "navigateToInviteFriends";
local l_v40_3 = v40 --[[ copy: 13 -> 20 ]];
v47 = function(v80, v81, v82, v83) --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_3 (copy)
    assert(type(v81) == "string", "Expected eventContext to be a string");
    assert(type(v82) == "string", "Expected placeId to be a string");
    assert(type(v83) == "table", "Expected state to be a table");
    local v84 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v82
    };
    v84 = l_Immutable_0.JoinDictionaries(v84, v83);
    v80:setRBXEventStream(v81, l_v40_3, v84);
end;
local l_v47_3 = v47 --[[ copy: 12 -> 21 ]];
v39.ShareGameToChat = function(v86, v87, v88, v89) --[[ Line: 49 ]]
    -- upvalues: l_v47_3 (copy)
    return l_v47_3(v86, v87, v88, v89 or {});
end;
v39.GameDetailsSubpage = function(v90, v91, v92, v93) --[[ Line: 59 ]] --[[ Name: GameDetailsSubpage ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy)
    local v94 = "gameDetailsSubpage";
    (function(v95, v96, v97, v98) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (ref), l_Immutable_0 (ref), v94 (copy)
        assert(type(v96) == "string", "Expected eventContext to be a string");
        assert(type(v97) == "string", "Expected placeId to be a string");
        assert(type(v98) == "table", "Expected state to be a table");
        local v99 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v97
        };
        v99 = l_Immutable_0.JoinDictionaries(v99, v98);
        v95:setRBXEventStream(v96, v94, v99);
    end)(v90, v91, v92, {
        subpage = v93
    });
end;
v39.Vote = function(v100, v101, v102, v103, v104) --[[ Line: 64 ]] --[[ Name: Vote ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy)
    local v105 = "vote";
    (function(v106, v107, v108, v109) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (ref), l_Immutable_0 (ref), v105 (copy)
        assert(type(v107) == "string", "Expected eventContext to be a string");
        assert(type(v108) == "string", "Expected placeId to be a string");
        assert(type(v109) == "table", "Expected state to be a table");
        local v110 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v108
        };
        v110 = l_Immutable_0.JoinDictionaries(v110, v109);
        v106:setRBXEventStream(v107, v105, v110);
    end)(v100, v101, v102, {
        vote = v103, 
        prevVote = v104
    });
end;
v40 = "openMore";
local l_v40_4 = v40 --[[ copy: 13 -> 22 ]];
v47 = function(v112, v113, v114, v115) --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_4 (copy)
    assert(type(v113) == "string", "Expected eventContext to be a string");
    assert(type(v114) == "string", "Expected placeId to be a string");
    assert(type(v115) == "table", "Expected state to be a table");
    local v116 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v114
    };
    v116 = l_Immutable_0.JoinDictionaries(v116, v115);
    v112:setRBXEventStream(v113, l_v40_4, v116);
end;
local l_v47_4 = v47 --[[ copy: 12 -> 23 ]];
v39.OpenMore = function(v118, v119, v120, v121) --[[ Line: 49 ]]
    -- upvalues: l_v47_4 (copy)
    return l_v47_4(v118, v119, v120, v121 or {});
end;
v40 = "openGameDetailsPT";
local l_v40_5 = v40 --[[ copy: 13 -> 24 ]];
v47 = function(v123, v124, v125, v126) --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_5 (copy)
    assert(type(v124) == "string", "Expected eventContext to be a string");
    assert(type(v125) == "string", "Expected placeId to be a string");
    assert(type(v126) == "table", "Expected state to be a table");
    local v127 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v125
    };
    v127 = l_Immutable_0.JoinDictionaries(v127, v126);
    v123:setRBXEventStream(v124, l_v40_5, v127);
end;
local l_v47_5 = v47 --[[ copy: 12 -> 25 ]];
v39.OpenPlayTogether = function(v129, v130, v131, v132) --[[ Line: 49 ]]
    -- upvalues: l_v47_5 (copy)
    return l_v47_5(v129, v130, v131, v132 or {});
end;
v40 = "createPrivateGame";
local l_v40_6 = v40 --[[ copy: 13 -> 26 ]];
v47 = function(v134, v135, v136, v137) --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_6 (copy)
    assert(type(v135) == "string", "Expected eventContext to be a string");
    assert(type(v136) == "string", "Expected placeId to be a string");
    assert(type(v137) == "table", "Expected state to be a table");
    local v138 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v136
    };
    v138 = l_Immutable_0.JoinDictionaries(v138, v137);
    v134:setRBXEventStream(v135, l_v40_6, v138);
end;
local l_v47_6 = v47 --[[ copy: 12 -> 27 ]];
v39.CreatePrivateGame = function(v140, v141, v142, v143) --[[ Line: 49 ]]
    -- upvalues: l_v47_6 (copy)
    return l_v47_6(v140, v141, v142, v143 or {});
end;
v40 = "joinFriendsInGame";
local l_v40_7 = v40 --[[ copy: 13 -> 28 ]];
v47 = function(v145, v146, v147, v148) --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_7 (copy)
    assert(type(v146) == "string", "Expected eventContext to be a string");
    assert(type(v147) == "string", "Expected placeId to be a string");
    assert(type(v148) == "table", "Expected state to be a table");
    local v149 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v147
    };
    v149 = l_Immutable_0.JoinDictionaries(v149, v148);
    v145:setRBXEventStream(v146, l_v40_7, v149);
end;
local l_v47_7 = v47 --[[ copy: 12 -> 29 ]];
v39.JoinFriendsInGame = function(v151, v152, v153, v154) --[[ Line: 49 ]]
    -- upvalues: l_v47_7 (copy)
    return l_v47_7(v151, v152, v153, v154 or {});
end;
v40 = "shareExperienceLink";
local l_v40_8 = v40 --[[ copy: 13 -> 30 ]];
v47 = function(v156, v157, v158, v159) --[[ Line: 13 ]]
    -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_8 (copy)
    assert(type(v157) == "string", "Expected eventContext to be a string");
    assert(type(v158) == "string", "Expected placeId to be a string");
    assert(type(v159) == "table", "Expected state to be a table");
    local v160 = {
        uid = tostring(l_Players_0.LocalPlayer.UserId), 
        placeId = v158
    };
    v160 = l_Immutable_0.JoinDictionaries(v160, v159);
    v156:setRBXEventStream(v157, l_v40_8, v160);
end;
local l_v47_8 = v47 --[[ copy: 12 -> 31 ]];
v39.ShareExperienceLink = function(v162, v163, v164, v165) --[[ Line: 49 ]]
    -- upvalues: l_v47_8 (copy)
    return l_v47_8(v162, v163, v164, v165 or {});
end;
local v166;
if l_FFlagLuaAppFiatPaidAccess_0 then
    v40 = "requestRefundClick";
    local l_v40_9 = v40 --[[ copy: 13 -> 40 ]];
    v47 = function(v168, v169, v170, v171) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_9 (copy)
        assert(type(v169) == "string", "Expected eventContext to be a string");
        assert(type(v170) == "string", "Expected placeId to be a string");
        assert(type(v171) == "table", "Expected state to be a table");
        local v172 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v170
        };
        v172 = l_Immutable_0.JoinDictionaries(v172, v171);
        v168:setRBXEventStream(v169, l_v40_9, v172);
    end;
    local l_v47_9 = v47 --[[ copy: 12 -> 41 ]];
    v166 = function(v174, v175, v176, v177) --[[ Line: 49 ]]
        -- upvalues: l_v47_9 (copy)
        return l_v47_9(v174, v175, v176, v177 or {});
    end;
else
    v166 = nil;
end;
v39.RequestRefundClick = v166;
if l_FFlagMediaGallerySnappingTelemetry_0 then
    v40 = "mediaGalleryActivated";
    local l_v40_10 = v40 --[[ copy: 13 -> 38 ]];
    v47 = function(v179, v180, v181, v182) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_10 (copy)
        assert(type(v180) == "string", "Expected eventContext to be a string");
        assert(type(v181) == "string", "Expected placeId to be a string");
        assert(type(v182) == "table", "Expected state to be a table");
        local v183 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v181
        };
        v183 = l_Immutable_0.JoinDictionaries(v183, v182);
        v179:setRBXEventStream(v180, l_v40_10, v183);
    end;
    local l_v47_10 = v47 --[[ copy: 12 -> 39 ]];
    v166 = function(v185, v186, v187, v188) --[[ Line: 49 ]]
        -- upvalues: l_v47_10 (copy)
        return l_v47_10(v185, v186, v187, v188 or {});
    end;
else
    v166 = nil;
end;
v39.MediaGalleryActivated = v166;
if l_FFlagMediaGallerySnappingTelemetry_0 then
    v40 = "mediaGallerySwiped";
    local l_v40_11 = v40 --[[ copy: 13 -> 36 ]];
    v47 = function(v190, v191, v192, v193) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_11 (copy)
        assert(type(v191) == "string", "Expected eventContext to be a string");
        assert(type(v192) == "string", "Expected placeId to be a string");
        assert(type(v193) == "table", "Expected state to be a table");
        local v194 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v192
        };
        v194 = l_Immutable_0.JoinDictionaries(v194, v193);
        v190:setRBXEventStream(v191, l_v40_11, v194);
    end;
    local l_v47_11 = v47 --[[ copy: 12 -> 37 ]];
    v166 = function(v196, v197, v198, v199) --[[ Line: 49 ]]
        -- upvalues: l_v47_11 (copy)
        return l_v47_11(v196, v197, v198, v199 or {});
    end;
else
    v166 = nil;
end;
v39.MediaGallerySwiped = v166;
if l_FFlagMediaAccordionAndFullTelemetry_0 then
    v40 = "mediaGalleryFullViewClosed";
    local l_v40_12 = v40 --[[ copy: 13 -> 34 ]];
    v47 = function(v201, v202, v203, v204) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_12 (copy)
        assert(type(v202) == "string", "Expected eventContext to be a string");
        assert(type(v203) == "string", "Expected placeId to be a string");
        assert(type(v204) == "table", "Expected state to be a table");
        local v205 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v203
        };
        v205 = l_Immutable_0.JoinDictionaries(v205, v204);
        v201:setRBXEventStream(v202, l_v40_12, v205);
    end;
    local l_v47_12 = v47 --[[ copy: 12 -> 35 ]];
    v166 = function(v207, v208, v209, v210) --[[ Line: 49 ]]
        -- upvalues: l_v47_12 (copy)
        return l_v47_12(v207, v208, v209, v210 or {});
    end;
else
    v166 = nil;
end;
v39.MediaGalleryClosed = v166;
if l_FFlagMediaAccordionAndFullTelemetry_0 then
    v40 = "mediaAccordionExpanded";
    local l_v40_13 = v40 --[[ copy: 13 -> 32 ]];
    v47 = function(v212, v213, v214, v215) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), l_v40_13 (copy)
        assert(type(v213) == "string", "Expected eventContext to be a string");
        assert(type(v214) == "string", "Expected placeId to be a string");
        assert(type(v215) == "table", "Expected state to be a table");
        local v216 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v214
        };
        v216 = l_Immutable_0.JoinDictionaries(v216, v215);
        v212:setRBXEventStream(v213, l_v40_13, v216);
    end;
    local l_v47_13 = v47 --[[ copy: 12 -> 33 ]];
    v166 = function(v218, v219, v220, v221) --[[ Line: 49 ]]
        -- upvalues: l_v47_13 (copy)
        return l_v47_13(v218, v219, v220, v221 or {});
    end;
else
    v166 = nil;
end;
v39.MediaAccordionExpanded = v166;
if l_FFlagMediaAccordionAndFullTelemetry_0 then
    v40 = "mediaAccordionCollapsed";
    v47 = function(v222, v223, v224, v225) --[[ Line: 13 ]]
        -- upvalues: l_Players_0 (copy), l_Immutable_0 (copy), v40 (copy)
        assert(type(v223) == "string", "Expected eventContext to be a string");
        assert(type(v224) == "string", "Expected placeId to be a string");
        assert(type(v225) == "table", "Expected state to be a table");
        local v226 = {
            uid = tostring(l_Players_0.LocalPlayer.UserId), 
            placeId = v224
        };
        v226 = l_Immutable_0.JoinDictionaries(v226, v225);
        v222:setRBXEventStream(v223, v40, v226);
    end;
    v166 = function(v227, v228, v229, v230) --[[ Line: 49 ]]
        -- upvalues: v47 (copy)
        return v47(v227, v228, v229, v230 or {});
    end;
else
    v166 = nil;
end;
v39.MediaAccordionCollapsed = v166;
return v39;