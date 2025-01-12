local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Enums.PaymentPlatform);
local v2 = require(l_Parent_0.Flags.GetFFlagEnablePalisadesPaymentsPlatform);
return function(v3, v4, v5, v6) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v3 == Enum.Platform.XBoxOne then
        return v1.Xbox;
    elseif v3 == Enum.Platform.IOS then
        if v4 then
            return v1.Midas;
        else
            return v1.Apple;
        end;
    elseif v3 == Enum.Platform.Windows or v3 == Enum.Platform.OSX or v3 == Enum.Platform.Linux then
        return v1.Web;
    elseif v3 == Enum.Platform.Android then
        if v4 then
            return v1.Midas;
        elseif v5 then
            return v1.Amazon;
        elseif v6 then
            return v1.Maquettes;
        else
            return v1.Google;
        end;
    elseif v3 == Enum.Platform.UWP then
        return v1.UWP;
    elseif v2() and v3 == Enum.Platform.PS4 then
        return v1.Palisades;
    else
        return v1.None;
    end;
end;