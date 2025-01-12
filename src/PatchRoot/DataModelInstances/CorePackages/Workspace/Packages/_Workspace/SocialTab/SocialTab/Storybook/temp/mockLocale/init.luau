local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Mock_0 = v1.Mock;
local l_LocalizationProvider_0 = v1.LocalizationProvider;
local l_Roact_0 = v1.Roact;
local v5 = l_Mock_0.MagicMock.new({
    name = "Localization"
});
v5.Format = function(_, v7, _) --[[ Line: 9 ]]
    return v7;
end;
return function(v9) --[[ Line: 13 ]]
    -- upvalues: l_Roact_0 (copy), l_LocalizationProvider_0 (copy), v5 (copy)
    return l_Roact_0.createElement(l_LocalizationProvider_0, {
        localization = v5
    }, {
        TestElement1 = v9
    });
end;