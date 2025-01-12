local l_CaptureService_0 = game:GetService("CaptureService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
formatBytes = function(v3) --[[ Line: 7 ]] --[[ Name: formatBytes ]]
    local v4 = {
        "Bytes", 
        "KB", 
        "MB", 
        "GB", 
        "TB"
    };
    local v5 = math.floor(math.log(v3) / 6.931471805599453);
    local v6 = v3 / math.pow(1024, v5);
    local v7 = "%.2f%s";
    if v5 <= 2 then
        v6 = math.round(v6);
        v7 = "%d%s";
    end;
    return string.format(v7, v6, v4[v5 + 1]);
end;
return function(v8) --[[ Line: 21 ]] --[[ Name: getCaptureStorageUsage ]]
    -- upvalues: l_CaptureService_0 (copy)
    if #v8 == 0 then
        return;
    else
        local v9 = {};
        for _, v11 in ipairs(v8) do
            table.insert(v9, v11.filePath);
        end;
        local _, l_result_0 = pcall(function() --[[ Line: 31 ]]
            -- upvalues: l_CaptureService_0 (ref), v9 (copy)
            return l_CaptureService_0:GetCaptureStorageSizeAsync(v9);
        end);
        return formatBytes(l_result_0);
    end;
end;