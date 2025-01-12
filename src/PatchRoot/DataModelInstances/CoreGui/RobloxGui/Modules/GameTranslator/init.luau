local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("CoreGui");
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local function v8() --[[ Line: 12 ]] --[[ Name: handlePlayerOrLocaleChanged ]]
    -- upvalues: v4 (ref), v5 (ref), l_BindableEvent_0 (copy)
    if v4 and v4.LocaleId ~= v5 then
        v5 = v4.LocaleId;
        l_BindableEvent_0:Fire(v5);
    end;
end;
local function _() --[[ Line: 19 ]] --[[ Name: reset ]]
    -- upvalues: v3 (ref), v4 (ref), v6 (ref)
    v3 = nil;
    v4 = nil;
    if v6 then
        v6:Disconnect();
        v6 = nil;
    end;
end;
local function _() --[[ Line: 29 ]] --[[ Name: getTranslator ]]
    -- upvalues: v3 (ref), v4 (ref), l_Players_0 (copy), l_LocalizationService_0 (copy), v5 (ref), l_BindableEvent_0 (copy), v6 (ref), v8 (copy)
    if not v3 then
        v4 = l_Players_0.LocalPlayer;
        if v4 then
            v3 = l_LocalizationService_0:GetTranslatorForPlayer(v4);
            if v4 and v4.LocaleId ~= v5 then
                v5 = v4.LocaleId;
                l_BindableEvent_0:Fire(v5);
            end;
            v6 = v4:GetPropertyChangedSignal("LocaleId"):Connect(v8);
        end;
    end;
    return v3;
end;
local v11 = {};
local function _(v12) --[[ Line: 44 ]] --[[ Name: unregisterGui ]]
    -- upvalues: v11 (copy)
    local v13 = v11[v12];
    if not v13 then
        return;
    else
        v13.connection:Disconnect();
        v11[v12] = nil;
        return;
    end;
end;
local _ = function(v15, v16) --[[ Line: 53 ]] --[[ Name: makeAncestryChangedHandler ]]
    -- upvalues: v11 (copy)
    return function(_, _) --[[ Line: 54 ]]
        -- upvalues: v15 (copy), v16 (copy), v11 (ref)
        if not game:IsAncestorOf(v15) then
            if v16.hasBeenAdded then
                local l_v15_0 = v15;
                local v20 = v11[l_v15_0];
                if not v20 then
                    return;
                else
                    v20.connection:Disconnect();
                    v11[l_v15_0] = nil;
                    return;
                end;
            end;
        else
            v16.hasBeenAdded = true;
        end;
    end;
end;
local function _(v22, v23, v24) --[[ Line: 65 ]] --[[ Name: updateRegistryInfo ]]
    v22.context = v23;
    v22.text = v24;
end;
local function v34(v26, v27, v28) --[[ Line: 70 ]] --[[ Name: makeRegistryInfo ]]
    -- upvalues: v11 (copy)
    local v29 = {
        hasBeenAdded = game:IsAncestorOf(v26), 
        context = v27, 
        text = v28
    };
    v29.connection = v26.AncestryChanged:Connect(function(_, _) --[[ Line: 54 ]]
        -- upvalues: v26 (copy), v29 (copy), v11 (ref)
        if not game:IsAncestorOf(v26) then
            if v29.hasBeenAdded then
                local l_v26_0 = v26;
                local v33 = v11[l_v26_0];
                if not v33 then
                    return;
                else
                    v33.connection:Disconnect();
                    v11[l_v26_0] = nil;
                    return;
                end;
            end;
        else
            v29.hasBeenAdded = true;
        end;
    end);
    return v29;
end;
local function _(v35, v36, v37) --[[ Line: 78 ]] --[[ Name: registerGui ]]
    -- upvalues: v11 (copy), v34 (copy)
    if v11[v35] == nil then
        v11[v35] = v34(v35, v36, v37);
        return;
    else
        local v38 = v11[v35];
        v38.context = v36;
        v38.text = v37;
        return;
    end;
end;
l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 86 ]]
    -- upvalues: v3 (ref), v4 (ref), v6 (ref), l_Players_0 (copy), l_LocalizationService_0 (copy), v5 (ref), l_BindableEvent_0 (copy), v8 (copy)
    v3 = nil;
    v4 = nil;
    if v6 then
        v6:Disconnect();
        v6 = nil;
    end;
    if not v3 then
        v4 = l_Players_0.LocalPlayer;
        if v4 then
            v3 = l_LocalizationService_0:GetTranslatorForPlayer(v4);
            if v4 and v4.LocaleId ~= v5 then
                v5 = v4.LocaleId;
                l_BindableEvent_0:Fire(v5);
            end;
            v6 = v4:GetPropertyChangedSignal("LocaleId"):Connect(v8);
        end;
    end;
end);
local v44 = {
    LocaleChanged = l_BindableEvent_0.Event, 
    TranslateGameText = function(_, v41, v42) --[[ Line: 102 ]] --[[ Name: TranslateGameText ]]
        -- upvalues: v3 (ref), v4 (ref), l_Players_0 (copy), l_LocalizationService_0 (copy), v5 (ref), l_BindableEvent_0 (copy), v6 (ref), v8 (copy)
        if not v3 then
            v4 = l_Players_0.LocalPlayer;
            if v4 then
                v3 = l_LocalizationService_0:GetTranslatorForPlayer(v4);
                if v4 and v4.LocaleId ~= v5 then
                    v5 = v4.LocaleId;
                    l_BindableEvent_0:Fire(v5);
                end;
                v6 = v4:GetPropertyChangedSignal("LocaleId"):Connect(v8);
            end;
        end;
        local l_v3_0 = v3;
        if l_v3_0 then
            return l_v3_0:RobloxOnlyTranslate(v41, v42);
        else
            return v42;
        end;
    end
};
l_LocalizationService_0.AutoTranslateWillRun:Connect(function() --[[ Line: 111 ]] --[[ Name: retranslateAll ]]
    -- upvalues: v11 (copy), v44 (copy)
    for v45, v46 in pairs(v11) do
        v45.Text = v44:TranslateGameText(v46.context, v46.text);
    end;
end);
v44.TranslateAndRegister = function(v47, v48, v49, v50) --[[ Line: 119 ]] --[[ Name: TranslateAndRegister ]]
    -- upvalues: v11 (copy), v34 (copy)
    v48.Text = v47:TranslateGameText(v49, v50);
    if v11[v48] == nil then
        v11[v48] = v34(v48, v49, v50);
        return v50;
    else
        local v51 = v11[v48];
        v51.context = v49;
        v51.text = v50;
        return v50;
    end;
end;
return v44;