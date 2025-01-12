local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.SettingsService);
local v3 = require(l_Parent_0.FieldRow);
local v4 = require(l_Parent_1.React);
local l_View_0 = require(l_Parent_1.Foundation).View;
return function(v6) --[[ Line: 38 ]] --[[ Name: _createPageView ]]
    -- upvalues: v4 (copy), v3 (copy), l_View_0 (copy)
    local v7 = v6.service:getPageById(v6.pageId);
    local function v11() --[[ Line: 42 ]] --[[ Name: getFields ]]
        -- upvalues: v7 (copy), v4 (ref), v3 (ref)
        local v8 = {};
        for v9, v10 in ipairs(v7.settingsFields) do
            v8[v9] = v4.createElement(v3, v10);
        end;
        return v8;
    end;
    local v12, v13 = v4.useBinding(v7.visibility:get());
    v7.visibility:connect(v13);
    return v4.createElement(l_View_0, {
        tag = "margin-x-medium align-x-center align-y-top margin-small col size-full auto-y gui-object-defaults", 
        Visible = v12
    }, {
        (v11())
    });
end;