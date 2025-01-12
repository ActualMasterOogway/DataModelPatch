local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactRoblox);
local v2 = require(l_Parent_0.React);
local l_getFFlagUseCoreGuiGetService_0 = require(l_Parent_0.SharedFlags).getFFlagUseCoreGuiGetService;
local v4 = require(script.Parent.Components.NotificationModalBase);
local v5 = nil;
local v6 = {};
local function _(v7) --[[ Line: 14 ]] --[[ Name: UpdateRoot ]]
    -- upvalues: v6 (ref), v5 (ref), v2 (copy), v4 (copy)
    if v6 and v6.ModalKey ~= v7.ModalKey and v6.Params and v6.Params.CloseCallback then
        v6.Params.CloseCallback();
    end;
    v6 = v7;
    v5:render(v2.createElement(v4, v7));
end;
local function v11(v9) --[[ Line: 23 ]]
    -- upvalues: v5 (ref), v6 (ref), v2 (copy), v4 (copy)
    if v5 and v9 == v6.ModalKey then
        local v10 = {};
        if v6 and v6.ModalKey ~= v10.ModalKey and v6.Params and v6.Params.CloseCallback then
            v6.Params.CloseCallback();
        end;
        v6 = v10;
        v5:render(v2.createElement(v4, v10));
    end;
end;
return {
    OpenModal = function(v12, v13, v14) --[[ Line: 29 ]]
        -- upvalues: v5 (ref), l_getFFlagUseCoreGuiGetService_0 (copy), v1 (copy), v6 (ref), v2 (copy), v4 (copy)
        if not v5 then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "NotificationModals";
            l_Folder_0.Parent = if l_getFFlagUseCoreGuiGetService_0() then game:GetService("CoreGui") else game.CoreGui;
            v5 = v1.createRoot(l_Folder_0);
        end;
        local v18 = {
            ModalKey = v12, 
            Component = v13, 
            Params = v14, 
            CloseModal = function() --[[ Line: 41 ]] --[[ Name: CloseModal ]]
                -- upvalues: v12 (copy), v5 (ref), v6 (ref), v2 (ref), v4 (ref)
                local l_v12_0 = v12;
                if v5 and l_v12_0 == v6.ModalKey then
                    local v17 = {};
                    if v6 and v6.ModalKey ~= v17.ModalKey and v6.Params and v6.Params.CloseCallback then
                        v6.Params.CloseCallback();
                    end;
                    v6 = v17;
                    v5:render(v2.createElement(v4, v17));
                end;
            end
        };
        if v6 and v6.ModalKey ~= v18.ModalKey and v6.Params and v6.Params.CloseCallback then
            v6.Params.CloseCallback();
        end;
        v6 = v18;
        v5:render(v2.createElement(v4, v18));
        return true;
    end, 
    CloseModal = v11
};