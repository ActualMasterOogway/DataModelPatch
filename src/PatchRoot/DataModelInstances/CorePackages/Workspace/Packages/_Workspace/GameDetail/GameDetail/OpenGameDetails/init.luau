local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameDetail");
local v1 = require(l_script_FirstAncestor_0.PeekView.SetGameDetailsPeekViewState);
local v2 = require(l_script_FirstAncestor_0.PeekView.UseGameDetailsPeekView);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_PeekViewState_0 = require(l_Parent_0.PeekView).PeekViewState;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v9 = game:DefineFastFlag("LuaAppGameDetailLockState", false);
return function(v10, v11, v12) --[[ Line: 14 ]]
    -- upvalues: v9 (copy), l_FormFactor_0 (copy), v2 (copy), l_AppPage_0 (copy), l_PeekViewState_0 (copy), v4 (copy), v1 (copy), l_NavigateDown_0 (copy)
    return function(v13) --[[ Line: 15 ]]
        -- upvalues: v9 (ref), l_FormFactor_0 (ref), v2 (ref), l_AppPage_0 (ref), v10 (copy), v12 (copy), l_PeekViewState_0 (ref), v4 (ref), v1 (ref), v11 (copy), l_NavigateDown_0 (ref)
        local v14 = v13:getState();
        local l_FormFactor_1 = v14.FormFactor;
        local l_viewState_0 = v14.GameDetailsPeekView.viewState;
        if v9 and v14.Navigation.lockNavigationActions then
            return;
        else
            local v17 = nil;
            if l_FormFactor_1 == l_FormFactor_0.COMPACT and v2() then
                v17 = {
                    name = l_AppPage_0.GameDetail, 
                    detail = tostring(v10), 
                    extraProps = v12
                };
                if l_viewState_0 == l_PeekViewState_0.Full or l_viewState_0 == l_PeekViewState_0.Extended or v12 and v12.mountAsFullView then
                    v17 = v4.Dictionary.join(v17, {
                        extraProps = v4.Dictionary.join(v17.extraProps or {}, {
                            mountAsFullView = true
                        })
                    });
                else
                    v13:dispatch(v1(l_PeekViewState_0.Closed));
                    v11.clearAppScreens({
                        l_AppPage_0.GameDetail, 
                        l_AppPage_0.ProfilePeekView
                    });
                end;
            else
                v17 = {
                    name = l_AppPage_0.ExperienceDetail, 
                    detail = tostring(v10), 
                    extraProps = v12
                };
            end;
            v13:dispatch(l_NavigateDown_0(v17));
            return;
        end;
    end;
end;