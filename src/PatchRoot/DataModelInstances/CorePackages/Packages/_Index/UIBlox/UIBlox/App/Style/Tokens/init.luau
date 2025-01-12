local v0 = require(script.dependencies);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v3 = require(l_Parent_1.t);
local l_GetTokenGenerators_0 = v0.GetTokenGenerators;
local l_Validators_0 = v0.SchemaPackage.Validators;
local l_GetFoundationTokens_0 = v0.GetFoundationTokens;
local v7 = require(script.Types);
local v8 = require(script.Parent.Constants);
local v9 = require(l_Parent_0.Parent.Parent.UIBloxConfig);
local function _(v10) --[[ Line: 20 ]] --[[ Name: getPlatformScale ]]
    -- upvalues: v9 (copy), v8 (copy)
    if not v9.disableTokenScalingForConsole and v10 == v8.DeviceType.Console then
        return 1.5;
    else
        return 1;
    end;
end;
return {
    getTokens = function(v12, v13) --[[ Line: 31 ]] --[[ Name: getTokens ]]
        -- upvalues: l_GetTokenGenerators_0 (copy), v8 (copy), v9 (copy)
        local v14 = l_GetTokenGenerators_0(v13) or l_GetTokenGenerators_0(v8.DefaultThemeName);
        local v15 = not v9.disableTokenScalingForConsole and v12 == v8.DeviceType.Console and 1.5 or 1;
        return {
            Global = require(v14.Global)(v15), 
            Semantic = require(v14.Semantic)(v15), 
            Component = require(v14.Component)(v15)
        };
    end, 
    validateTokens = v3.strictInterface({
        Global = v3.strictInterface(l_Validators_0.Global), 
        Semantic = v3.strictInterface(l_Validators_0.Semantic), 
        Component = v3.strictInterface(l_Validators_0.Component)
    }), 
    Types = v7, 
    getFoundationTokens = function(v16, v17) --[[ Line: 47 ]] --[[ Name: getFoundationTokens ]]
        -- upvalues: l_GetFoundationTokens_0 (copy), v8 (copy), v9 (copy)
        return (l_GetFoundationTokens_0(v17) or l_GetFoundationTokens_0(v8.DefaultThemeName))(not v9.disableTokenScalingForConsole and v16 == v8.DeviceType.Console and 1.5 or 1);
    end, 
    getFoundationTokensDefaultScale = function(v18) --[[ Line: 53 ]] --[[ Name: getFoundationTokensDefaultScale ]]
        -- upvalues: l_GetFoundationTokens_0 (copy), v8 (copy)
        return (l_GetFoundationTokens_0(v18) or l_GetFoundationTokens_0(v8.DefaultThemeName))(1);
    end, 
    Mappers = require(script.mappers)
};