local l_TextChatService_0 = game:GetService("TextChatService");
local l_HttpService_0 = game:GetService("HttpService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.Common.Url);
local l_GameSettings_0 = UserSettings().GameSettings;
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v9 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v10 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v11 = game:DefineFastFlag("FixChatLanguageSwitcherLabel", false);
local v12 = require(l_RobloxGui_0.Modules.Flags.GetFStringChatTranslationEnabledLocales);
local l_game_EngineFeature_0 = game:GetEngineFeature("TextChatServiceSettingsSaved");
local v14 = require(l_RobloxGui_0.Modules.Flags.FFlagInExperienceSettingsRefactorAnalytics);
return function(v15, v16, v17) --[[ Line: 27 ]]
    -- upvalues: v5 (copy), l_Players_0 (copy), l_HttpService_0 (copy), v10 (copy), v11 (copy), v9 (copy), l_GameSettings_0 (copy), l_LocalPlayer_0 (copy), l_TextChatService_0 (copy), v14 (copy), l_game_EngineFeature_0 (copy), v12 (copy)
    local v18 = {
        [1] = "en_us"
    };
    local v19 = {
        en_us = 1
    };
    local v20 = {
        "English"
    };
    local v21 = v5.LOCALE_URL .. string.format("v1/locales?displayValueLocale=%s", l_Players_0.LocalPlayer.LocaleId:gsub("-", "_"));
    local v22 = l_HttpService_0:RequestInternal({
        Url = v21, 
        Method = "GET"
    });
    local function v74(v23, v24) --[[ Line: 51 ]] --[[ Name: localeCodeToLanguageCodeMappingCallback ]]
        -- upvalues: v10 (ref), v11 (ref), v15 (copy), v9 (ref), v16 (copy), l_GameSettings_0 (ref), v18 (copy), l_LocalPlayer_0 (ref), l_TextChatService_0 (ref), v20 (copy), v14 (ref), v17 (copy), l_game_EngineFeature_0 (ref)
        if not v23 then
            if v24 == nil then
                v24 = "Locales call did not set error message to non-nil value";
            end;
            v10:warning("GameSettings chat language selector initialization failed to get all required information; defaulting to unavailable for the remainder of this session. Error message: " .. v24);
            if v11 then
                local l_v15_0 = v15;
                local l_v15_1 = v15;
                local l_v15_2 = v15;
                local v28, v29, v30 = v9:AddNewRow(v15, "Chat Translation Language", "DropDown", {
                    "Unavailable"
                }, 1);
                l_v15_0.ChatLanguageSelectorFrame = v28;
                l_v15_1.ChatLanguageSelectorLabel = v29;
                l_v15_2.ChatLanguageSelectorMode = v30;
            else
                local l_v15_3 = v15;
                local l_v15_4 = v15;
                local l_v15_5 = v15;
                local v34, v35, v36 = v9:AddNewRow(v15, "Chat Language", "DropDown", {
                    "Unavailable"
                }, 1);
                l_v15_3.ChatLanguageSelectorFrame = v34;
                l_v15_4.ChatLanguageSelectorLabel = v35;
                l_v15_5.ChatLanguageSelectorMode = v36;
            end;
            v15.ChatLanguageSelectorFrame.LayoutOrder = v16.ChatLanguageSelectorFrame;
        end;
        local v37 = nil;
        local l_ChatTranslationLocale_0 = l_GameSettings_0.ChatTranslationLocale;
        if l_ChatTranslationLocale_0 ~= "" then
            for v39, v40 in v18 do
                if v40 == l_ChatTranslationLocale_0 then
                    v37 = v39;
                end;
            end;
        end;
        if l_ChatTranslationLocale_0 == "" or v37 == nil then
            for v41, v42 in v18 do
                if v42 == l_LocalPlayer_0.LocaleId:gsub("-", "_") then
                    v37 = v41;
                    l_TextChatService_0.ChatTranslationEnabled = true;
                end;
            end;
        end;
        if v37 == nil then
            l_TextChatService_0.ChatTranslationEnabled = false;
            v37 = 1;
        else
            l_GameSettings_0.ChatTranslationLocale = v18[v37];
        end;
        l_LocalPlayer_0:SetChatTranslationSettingsLocaleId(v18[v37]);
        local v43 = v18[v37];
        if v11 then
            local l_v15_6 = v15;
            local l_v15_7 = v15;
            local l_v15_8 = v15;
            local v47, v48, v49 = v9:AddNewRow(v15, "Chat Translation Language", "DropDown", v20, v37);
            l_v15_6.ChatLanguageSelectorFrame = v47;
            l_v15_7.ChatLanguageSelectorLabel = v48;
            l_v15_8.ChatLanguageSelectorMode = v49;
        else
            local l_v15_9 = v15;
            local l_v15_10 = v15;
            local l_v15_11 = v15;
            local v53, v54, v55 = v9:AddNewRow(v15, "Chat Language", "DropDown", v20, v37);
            l_v15_9.ChatLanguageSelectorFrame = v53;
            l_v15_10.ChatLanguageSelectorLabel = v54;
            l_v15_11.ChatLanguageSelectorMode = v55;
        end;
        v15.ChatLanguageSelectorFrame.LayoutOrder = v16.ChatLanguageSelectorFrame;
        local function v59(v56) --[[ Line: 126 ]] --[[ Name: onChatSelectionIndexUpdated ]]
            -- upvalues: v14 (ref), l_GameSettings_0 (ref), v18 (ref), l_LocalPlayer_0 (ref), v43 (ref), v17 (ref)
            if v14 then
                local l_ChatTranslationLocale_1 = l_GameSettings_0.ChatTranslationLocale;
                local v58 = v18[v56];
                l_GameSettings_0.ChatTranslationLocale = v58;
                l_LocalPlayer_0:SetChatTranslationSettingsLocaleId(v58);
                v43 = v58;
                v17("chat_translation_locale", l_ChatTranslationLocale_1, v58);
                return;
            else
                l_GameSettings_0.ChatTranslationLocale = v18[v56];
                l_LocalPlayer_0:SetChatTranslationSettingsLocaleId(v18[v56]);
                v43 = v18[v56];
                return;
            end;
        end;
        v15.ChatLanguageSelectorMode.IndexChanged:connect(v59);
        local v60 = l_TextChatService_0.ChatTranslationToggleEnabled and 1 or 2;
        local l_v15_12 = v15;
        local l_v15_13 = v15;
        local l_v15_14 = v15;
        local v64, v65, v66 = v9:AddNewRow(v15, "Option to View Untranslated Message", "Selector", {
            "On", 
            "Off"
        }, v60);
        l_v15_12.ChatTranslationToggleFrame = v64;
        l_v15_13.ChatTranslationToggleLabel = v65;
        l_v15_14.ChatTranslationToggleEnabler = v66;
        v15.ChatTranslationToggleFrame.LayoutOrder = v16.ChatTranslationToggleFrame;
        v15.ChatTranslationToggleEnabler.IndexChanged:connect(function(v67) --[[ Line: 154 ]]
            -- upvalues: l_TextChatService_0 (ref), l_game_EngineFeature_0 (ref), l_GameSettings_0 (ref), v17 (ref), v43 (ref)
            local v68 = v67 == 1;
            local l_ChatTranslationToggleEnabled_0 = l_TextChatService_0.ChatTranslationToggleEnabled;
            if v68 ~= l_ChatTranslationToggleEnabled_0 then
                if l_game_EngineFeature_0 then
                    l_GameSettings_0.ChatTranslationToggleEnabled = v68;
                else
                    l_TextChatService_0.ChatTranslationToggleEnabled = v68;
                end;
                v17("chat_translation_toggle", l_ChatTranslationToggleEnabled_0, v68, {
                    locale_id = v43
                });
            end;
        end);
        l_v15_12 = l_TextChatService_0.ChatTranslationEnabled and 1 or 2;
        if l_v15_12 == 2 then
            v15.ChatLanguageSelectorFrame.Visible = false;
            v15.ChatTranslationToggleFrame.Visible = false;
        end;
        l_v15_13 = v15;
        l_v15_14 = v15;
        v64 = v15;
        local v70;
        v65, v66, v70 = v9:AddNewRow(v15, "Automatic Chat Translation", "Selector", {
            "On", 
            "Off"
        }, l_v15_12);
        l_v15_13.ChatTranslationFrame = v65;
        l_v15_14.ChatTranslationLabel = v66;
        v64.ChatTranslationEnabler = v70;
        v15.ChatTranslationFrame.LayoutOrder = v16.ChatTranslationFrame;
        v15.ChatTranslationEnabler.IndexChanged:connect(function(v71) --[[ Line: 185 ]]
            -- upvalues: l_TextChatService_0 (ref), l_game_EngineFeature_0 (ref), l_GameSettings_0 (ref), v17 (ref), l_LocalPlayer_0 (ref), v15 (ref)
            local v72 = v71 == 1;
            local l_ChatTranslationEnabled_0 = l_TextChatService_0.ChatTranslationEnabled;
            if l_game_EngineFeature_0 then
                l_GameSettings_0.ChatTranslationEnabled = v72;
            else
                l_TextChatService_0.ChatTranslationEnabled = v72;
            end;
            v17("chat_translation", l_ChatTranslationEnabled_0, v72, {
                locale_id = l_LocalPlayer_0.LocaleId
            });
            if v71 == 1 then
                v15.ChatLanguageSelectorFrame.Visible = true;
                v15.ChatTranslationToggleFrame.Visible = true;
                return;
            else
                v15.ChatLanguageSelectorFrame.Visible = false;
                v15.ChatTranslationToggleFrame.Visible = false;
                return;
            end;
        end);
    end;
    v22:Start(function(v75, v76) --[[ Line: 210 ]]
        -- upvalues: l_HttpService_0 (ref), v12 (ref), v20 (copy), v18 (copy), v19 (copy), v10 (ref), v21 (copy), v74 (copy)
        local v77 = false;
        local v78 = nil;
        if not v75 then
            v78 = "Locale Code to Language Code Mapping Request: Connection error";
        elseif v76.StatusCode == 401 then
            v78 = "Locale Code to Language Code Mapping Request: Unauthorized";
        elseif v76.StatusCode < 200 or v76.StatusCode >= 400 then
            v78 = "Locale Code to Language Code Mapping Request Status code: " .. v76.StatusCode;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 221 ]]
                -- upvalues: l_HttpService_0 (ref), v76 (copy), v12 (ref), v20 (ref), v18 (ref), v19 (ref)
                local v79 = false;
                local v80 = l_HttpService_0:JSONDecode(v76.Body);
                local v81 = v12():gmatch("([^,]+)");
                local v82 = {};
                for v83 in v81 do
                    table.insert(v82, v83);
                end;
                local _ = function(v84) --[[ Line: 231 ]] --[[ Name: shouldAddLocaleAsChatTranslationOption ]]
                    -- upvalues: v82 (copy)
                    for _, v86 in v82 do
                        if v86 == v84 then
                            return true;
                        end;
                    end;
                    return false;
                end;
                local v88 = 2;
                for _, v90 in pairs(v80.data) do
                    local l_locale_0 = v90.locale.locale;
                    local l_name_0 = v90.locale.language.name;
                    if l_locale_0 == "en_us" then
                        v20[1] = l_name_0;
                    else
                        local v93;
                        for _, v95 in v82 do
                            if v95 == l_locale_0 then
                                v93 = true;
                                v79 = true;
                            end;
                            if v79 then
                                break;
                            end;
                        end;
                        if not v79 then
                            v93 = false;
                        end;
                        v79 = false;
                        if v93 then
                            table.insert(v20, l_name_0);
                            v18[v88] = l_locale_0;
                            v19[l_locale_0] = v88;
                            v88 = v88 + 1;
                        end;
                    end;
                end;
            end);
            v77 = l_status_0;
            v78 = l_result_0;
        end;
        if not v77 then
            v10:warning("GameSettings chat language selector initialization: Failed to get response from Localization API for " .. v21 .. " with error message: " .. v78);
        end;
        v74(v77, v78);
    end);
end;