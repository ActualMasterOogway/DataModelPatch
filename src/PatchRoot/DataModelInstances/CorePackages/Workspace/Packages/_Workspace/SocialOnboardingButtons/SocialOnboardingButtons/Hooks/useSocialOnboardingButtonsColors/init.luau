local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialOnboardingButtons");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SharedFlags).UIBlox.GetFFlagUIBloxEnableUseStyleMetadata();
local v3 = require(l_script_FirstAncestor_0.Experiments.SocialOnboardingButtonsIXP);
local v4 = require(l_script_FirstAncestor_0.Enums.ColorVariantsEnum);
local v5 = require(l_Parent_0.UIBlox);
local l_DarkTheme_0 = v5.App.Style.Themes.DarkTheme;
local l_ThemeName_0 = v5.App.Style.Constants.ThemeName;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v9 = Color3.fromHex("272930");
local v10 = Color3.fromHex("F4F4F6");
local v11 = {
    colorful = {
        lightTheme = {
            addFriends = Color3.fromHex("BFE6FF"), 
            findContacts = Color3.fromHex("B2F5D5"), 
            myQRCode = Color3.fromHex("FFD7DF"), 
            searchPeople = Color3.fromHex("EED2FF"), 
            unlockVoice = Color3.fromHex("FFF8DC"), 
            myProfile = Color3.fromHex("#A2E7E4")
        }, 
        darkTheme = {
            addFriends = Color3.fromHex("2C3E50"), 
            findContacts = Color3.fromHex("1B7740"), 
            myQRCode = Color3.fromHex("9A2B1D"), 
            searchPeople = Color3.fromHex("4D256D"), 
            unlockVoice = Color3.fromHex("B98D5F"), 
            myProfile = Color3.fromHex("#11816A")
        }
    }, 
    blackAndWhite = {
        lightTheme = {
            addFriends = v9, 
            findContacts = v9, 
            myQRCode = v9, 
            searchPeople = v9, 
            unlockVoice = v9, 
            myProfile = v9
        }, 
        darkTheme = {
            addFriends = v10, 
            findContacts = v10, 
            myQRCode = v10, 
            searchPeople = v10, 
            unlockVoice = v10, 
            myProfile = v10
        }
    }
};
return function() --[[ Line: 58 ]]
    -- upvalues: v3 (copy), l_useStyle_0 (copy), v2 (copy), v5 (copy), l_ThemeName_0 (copy), l_DarkTheme_0 (copy), v4 (copy), v11 (copy), v10 (copy), v9 (copy)
    local v12 = v3.useSocialOnboardingBtnsColor();
    local v13 = l_useStyle_0();
    local v14 = if v2 then v5.Core.Style.useStyleMetadata().ThemeName == l_ThemeName_0.Dark else v13.Theme == l_DarkTheme_0;
    local v15 = {};
    local v16 = nil;
    if v12 == v4.Colorful then
        if v14 then
            v15 = v11.colorful.darkTheme;
            v16 = v10;
        else
            v15 = v11.colorful.lightTheme;
            v16 = v9;
        end;
    elseif v12 == v4.BlackAndWhite then
        if v14 then
            v15 = v11.blackAndWhite.darkTheme;
            v16 = v9;
        else
            v15 = v11.blackAndWhite.lightTheme;
            v16 = v10;
        end;
    end;
    return v15, v16, v12;
end;