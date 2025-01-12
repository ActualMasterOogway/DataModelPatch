local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_IXPService_0 = game:GetService("IXPService");
local l_HttpService_0 = game:GetService("HttpService");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_Parent_0 = script:FindFirstAncestor("ExperimentCacheManager").Parent;
local l_EventIngest_0 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest;
local l_memoize_0 = require(l_Parent_0.AppCommonLib).memoize;
local l_AppStorageJsonCacheUtils_0 = require(l_Parent_0.AppCommonLib).Utils.AppStorageJsonCacheUtils;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local l_LocalStorageKey_0 = require(l_Parent_0.LocalStorage).Enums.LocalStorageKey;
local v10 = require(script.Parent.GetExperimentCacheLayers);
local v11 = game:DefineFastFlag("EnableAppStorageJsonDecodeCache", false);
local v12 = {};
v12.__index = v12;
v12.new = function(v13, v14, v15) --[[ Line: 72 ]] --[[ Name: new ]]
    -- upvalues: l_IXPService_0 (copy), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), v10 (copy), v12 (copy)
    local v16 = {
        _ixpService = v13 or l_IXPService_0, 
        _eventIngest = v14 or l_EventIngest_0.new(l_EventIngestService_0), 
        _cache = {}, 
        _loadingStatusChanged = nil, 
        _layersToCache = v15 or v10(), 
        _exposureLoggingTable = {}
    };
    setmetatable(v16, v12);
    return v16;
end;
v12._getCachedVariables = function(_) --[[ Line: 86 ]] --[[ Name: _getCachedVariables ]]
    -- upvalues: v11 (copy), l_AppStorageJsonCacheUtils_0 (copy), l_LocalStorageKey_0 (copy), l_AppStorageService_0 (copy), l_HttpService_0 (copy)
    if v11 then
        local v18 = l_AppStorageJsonCacheUtils_0.default:getCachedJsonForKey(l_LocalStorageKey_0.ExperimentCache, true);
        if v18 == nil then
            return {};
        else
            return v18;
        end;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 96 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
            return l_AppStorageService_0:GetItem(l_LocalStorageKey_0.ExperimentCache);
        end);
        if l_status_0 then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 101 ]]
                -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                return l_HttpService_0:JSONDecode(l_result_0);
            end);
            if l_status_1 then
                return l_result_1;
            end;
        end;
        return {};
    end;
end;
v12._flushToCache = function(_, v24) --[[ Line: 113 ]] --[[ Name: _flushToCache ]]
    -- upvalues: l_HttpService_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    assert(type(v24) == "table", "expected table type for cache to persist");
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 117 ]]
        -- upvalues: l_HttpService_0 (ref), v24 (copy)
        return l_HttpService_0:JSONEncode(v24);
    end);
    if l_status_2 then
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 122 ]]
            -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_result_2 (copy)
            l_AppStorageService_0:SetItem(l_LocalStorageKey_0.ExperimentCache, l_result_2);
            l_AppStorageService_0:Flush();
        end);
        if not l_status_3 then
            warn(l_result_3);
        end;
    end;
end;
v12._onIXPInitialized = function(v29) --[[ Line: 133 ]] --[[ Name: _onIXPInitialized ]]
    local l_UserLayerLoadingStatus_0 = v29._ixpService:GetUserLayerLoadingStatus();
    if l_UserLayerLoadingStatus_0 ~= Enum.IXPLoadingStatus.Pending and v29._loadingStatusChanged then
        v29._loadingStatusChanged:disconnect();
        v29._loadingStatusChanged = nil;
    end;
    if l_UserLayerLoadingStatus_0 == Enum.IXPLoadingStatus.Initialized then
        local v31 = {};
        for _, v33 in ipairs(v29._layersToCache) do
            local v34 = nil;
            do
                local l_v34_0 = v34;
                pcall(function() --[[ Line: 149 ]]
                    -- upvalues: l_v34_0 (ref), v29 (copy), v33 (copy)
                    l_v34_0 = v29._ixpService:GetUserLayerVariables(v33);
                end);
                v31[v33] = l_v34_0;
            end;
        end;
        v29:_flushToCache(v31);
    end;
end;
v12._logCustomExposure = function(v36, v37) --[[ Line: 161 ]] --[[ Name: _logCustomExposure ]]
    assert(type(v37) == "string", "expected layerName to be a string");
    v36._eventIngest:setRBXEventStream("experimentCacheManager", "exposureLog", {
        layerName = v37
    });
end;
v12._containsLayer = function(v38, v39) --[[ Line: 168 ]] --[[ Name: _containsLayer ]]
    -- upvalues: l_memoize_0 (copy)
    return l_memoize_0(function(v40) --[[ Line: 169 ]]
        -- upvalues: v38 (copy)
        for _, v42 in ipairs(v38._layersToCache) do
            if v42 == v40 then
                return true;
            end;
        end;
        return false;
    end)(v39);
end;
v12.initialize = function(v43) --[[ Line: 181 ]] --[[ Name: initialize ]]
    v43._cache = v43:_getCachedVariables();
    if v43._ixpService:GetUserLayerLoadingStatus() == Enum.IXPLoadingStatus.Initialized then
        v43:_onIXPInitialized();
        return;
    else
        v43._loadingStatusChanged = v43._ixpService.OnUserLayerLoadingStatusChanged:Connect(function(v44) --[[ Line: 189 ]]
            -- upvalues: v43 (copy)
            if v44 == Enum.IXPLoadingStatus.Initialized then
                v43:_onIXPInitialized();
            end;
        end);
        return;
    end;
end;
v12.getLayerVariables = function(v45, v46, _) --[[ Line: 197 ]] --[[ Name: getLayerVariables ]]
    -- upvalues: l_mutedError_0 (copy)
    assert(type(v46) == "string", "expected layerName to be a string");
    if not v45:_containsLayer(v46) then
        l_mutedError_0("Layer " .. v46 .. " has not been configured to be cached, please add layer to `GetExperimentCacheLayers`");
    end;
    return v45._cache[v46] or nil;
end;
v12.clearCache = function(v48) --[[ Line: 212 ]] --[[ Name: clearCache ]]
    -- upvalues: l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    v48._cache = {};
    v48._exposureLoggingTable = {};
    pcall(function() --[[ Line: 216 ]]
        -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
        l_AppStorageService_0:SetItem(l_LocalStorageKey_0.ExperimentCache, "");
        l_AppStorageService_0:Flush();
    end);
end;
v12.sendCustomExposureLog = function(v49, v50) --[[ Line: 222 ]] --[[ Name: sendCustomExposureLog ]]
    if v49._exposureLoggingTable[v50] == nil then
        v49:_logCustomExposure(v50);
        v49._exposureLoggingTable[v50] = true;
    end;
end;
v12.logLayerExposure = function(v51, v52) --[[ Line: 230 ]] --[[ Name: logLayerExposure ]]
    v51._ixpService:LogUserLayerExposure(v52);
end;
v12.default = v12.new();
return v12;