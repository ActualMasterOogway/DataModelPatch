local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
require(l_CorePackages_0.Packages.UIBlox).init({});
local v2 = require(l_CorePackages_0.Workspace.Packages.GraphQL);
local function v3(v4, v5) --[[ Line: 12 ]] --[[ Name: recursiveToString ]]
    -- upvalues: v3 (copy)
    if type(v4) == "function" then
        error("Can't convert function to string");
        return;
    elseif type(v4) == "table" then
        local v6 = "" .. "{";
        local v7 = 0;
        for _, _ in pairs(v4) do
            v7 = v7 + 1;
        end;
        if v7 > 1 then
            v6 = v6 .. "\n";
        end;
        for v10, v11 in pairs(v4) do
            if type(v10) == "string" then
                v6 = v6 .. "  " .. v5 .. tostring(v10) .. " = " .. v3(v11, "  " .. v5) .. ",\n";
            end;
            if type(v10) == "number" then
                v6 = v6 .. "  " .. v5 .. v3(v11, "  " .. v5) .. ",\n";
            end;
        end;
        if v7 > 0 then
            return v6 .. v5 .. "}";
        else
            return v6 .. "}";
        end;
    elseif type(v4) == "string" then
        return "\"" .. tostring(v4) .. "\"";
    else
        return (tostring(v4));
    end;
end;
if game:GetService("ProcessService"):GetCommandLineArgs()[1] == "individual" then
    local v12 = l_HttpService_0:JSONDecode(require(l_CorePackages_0.Workspace.Packages.GraphQLCompile).gqlCompileData());
    for _, v14 in v12 do
        v14.compiled = v3(v2.parse(v14.content, {
            noLocation = true
        }), "");
    end;
    local v15 = l_HttpService_0:JSONEncode(v12);
    print(v15);
else
    local v16 = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
    print(v3(v2.parse(v16.generateTypeDefs(), {
        noLocation = true
    }), ""));
end;
return {};