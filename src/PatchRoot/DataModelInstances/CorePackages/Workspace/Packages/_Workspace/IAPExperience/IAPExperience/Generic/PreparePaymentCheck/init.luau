local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v5 = require(l_Parent_1.Enums.PaymentPlatform);
local l_Url_0 = require(l_Parent_2.Http).Url;
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_IsVRAppBuild_0 = require(l_Parent_2.AppCommonLib).IsVRAppBuild;
local v10 = require(l_Parent_1.Flags.getBlockingConsolePreparePaymentCheck);
local l_default_0 = require(l_Parent_2.LoggingProtocol).default;
local v12 = require(l_Parent_0.Events.PreparePaymentCheckCounter);
GetPaymentMethod = function(v13) --[[ Line: 15 ]] --[[ Name: GetPaymentMethod ]]
    -- upvalues: v5 (copy)
    if v13 == Enum.Platform.PS4 then
        return "PlaystationStore";
    elseif v13 == v5.Maquettes then
        return "QuestStore";
    elseif v13 == Enum.Platform.XBoxOne then
        return "XboxStore";
    else
        return "";
    end;
end;
IsPreparePaymentSuccessful = function(v14, v15) --[[ Line: 26 ]] --[[ Name: IsPreparePaymentSuccessful ]]
    -- upvalues: l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), l_Url_0 (copy), l_default_0 (copy), v12 (copy)
    local v16 = l_HttpService_0:JSONEncode({
        paymentMethod = v14, 
        providerProductId = v15
    });
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 33 ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), l_Url_0 (ref), v16 (copy)
        return l_HttpRbxApiService_0:PostAsyncFullUrl(l_Url_0.APIS_URL .. "payments-gateway/v1/prepare-payment", v16);
    end);
    if not l_status_0 then
        l_default_0:logRobloxTelemetryCounter(v12, 1, {
            paymentMethod = v14, 
            result = "Error"
        });
        return true;
    elseif l_HttpService_0:JSONDecode(l_result_0).isSuccess then
        l_default_0:logRobloxTelemetryCounter(v12, 1, {
            paymentMethod = v14, 
            result = "Success"
        });
        return true;
    else
        l_default_0:logRobloxTelemetryCounter(v12, 1, {
            paymentMethod = v14, 
            result = "Failed"
        });
        return false;
    end;
end;
ConsolePreparePaymentCheck = function(v19) --[[ Line: 61 ]] --[[ Name: ConsolePreparePaymentCheck ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v21 = GetPaymentMethod(l_l_UserInputService_0_Platform_0);
    if v21 == "" or l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne then
        return true;
    else
        return IsPreparePaymentSuccessful(v21, v19);
    end;
end;
return function(v22) --[[ Line: 74 ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), l_GuiService_0 (copy), v10 (copy)
    if l_IsVRAppBuild_0() or l_GuiService_0:IsTenFootInterface() then
        local v23 = ConsolePreparePaymentCheck(v22);
        if not v10() then
            v23 = true;
        end;
        return v23;
    else
        return true;
    end;
end;