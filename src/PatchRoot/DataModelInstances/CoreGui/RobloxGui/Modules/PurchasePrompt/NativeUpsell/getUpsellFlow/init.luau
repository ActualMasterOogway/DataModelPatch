local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.UpsellFlow);
local v2 = require(l_Parent_0.Flags.GetFFlagEnablePalisadesPaymentsPlatform);
return function(v3) --[[ Line: 6 ]] --[[ Name: getUpsellFlow ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v3 == Enum.Platform.Windows or v3 == Enum.Platform.OSX or v3 == Enum.Platform.Linux then
        return v1.Web;
    elseif v3 == Enum.Platform.IOS or v3 == Enum.Platform.Android or v3 == Enum.Platform.UWP then
        return v1.Mobile;
    elseif v3 == Enum.Platform.XBoxOne then
        return v1.Xbox;
    elseif v2() and v3 == Enum.Platform.PS4 then
        return v1.Mobile;
    else
        return v1.None;
    end;
end;