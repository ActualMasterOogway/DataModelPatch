local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.getCaptureUploadData);
local _ = require(l_Parent_0.Types);
local v3 = game:DefineFastFlag("AllowDeveloperCapturePosting", false);
local v4 = game:DefineFastFlag("AllowVisibleGuisCapturePosting", false);
local v5 = require(l_Parent_0.Flags.FIntCapturesMinimumPostableSigningAlgorithmVersion);
return function(v6) --[[ Line: 11 ]] --[[ Name: getIsCapturePostable ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v5 (copy)
    local v7 = v1(v6);
    if not v7 then
        return false;
    elseif not v3 and v7.isDeveloperCapture then
        return false;
    elseif not v4 and not v7.areGuisHidden then
        return false;
    elseif v7.signingAlgorithmVersion < v5 then
        return false;
    else
        return true;
    end;
end;