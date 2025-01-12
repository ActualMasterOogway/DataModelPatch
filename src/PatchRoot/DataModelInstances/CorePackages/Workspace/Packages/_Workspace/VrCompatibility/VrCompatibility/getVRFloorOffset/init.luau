local l_VRService_0 = game:GetService("VRService");
return function() --[[ Line: 4 ]]
    -- upvalues: l_VRService_0 (copy)
    local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Floor);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if l_CurrentCamera_0 then
        return l_l_VRService_0_UserCFrame_0.Rotation + l_l_VRService_0_UserCFrame_0.Position * l_CurrentCamera_0.HeadScale;
    else
        return CFrame.new(0, 0, 0);
    end;
end;