local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_script_FirstAncestor_0.Components.Constants);
local v6 = require(l_script_FirstAncestor_0.Components.ModalBaseSelectorDialog);
local l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagAbuseReportMenuConsoleSupportRefactor;
local v8 = {
    modalSelectorHandle = nil, 
    modalSelectorFrame = nil, 
    modalSelectorScreenGui = nil
};
return {
    mountModalSelector = function(v9, v10, v11, v12, v13) --[[ Line: 33 ]] --[[ Name: mountModalSelector ]]
        -- upvalues: l_GuiService_0 (copy), v8 (copy), l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0 (copy), l_CoreGui_0 (copy), v5 (copy), v4 (copy), v6 (copy)
        local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
        if not v8.modalSelectorScreenGui then
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Name = "ModalSelectorDialogGui";
            l_ScreenGui_0.DisplayOrder = 7;
            l_ScreenGui_0.Enabled = true;
            l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            l_ScreenGui_0.Parent = if l_GetFFlagAbuseReportMenuConsoleSupportRefactor_0() then l_CoreGui_0:FindFirstChild(v5.AbuseReportMenuPlaceholderFrame, true) else l_CoreGui_0:FindFirstChild(v5.AbuseReportMenuRootName, true);
            v8.modalSelectorScreenGui = l_ScreenGui_0;
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.Position = UDim2.new(0, 0, 0, -l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_0.Size = UDim2.new(1, 0, 1, l_l_GuiService_0_GuiInset_0.Y);
            l_Frame_0.Parent = v8.modalSelectorScreenGui;
            v8.modalSelectorFrame = l_Frame_0;
        end;
        local v18 = v4.createElement(v6, {
            isShown = true, 
            cellData = v11, 
            viewportHeight = v9, 
            viewportWidth = v10, 
            onSelect = v12, 
            onClose = v13
        });
        v8.modalSelectorHandle = v4.mount(v18, v8.modalSelectorFrame, "ModalSelectorDialog");
    end, 
    unmountModalSelector = function() --[[ Line: 21 ]] --[[ Name: unmountModalSelector ]]
        -- upvalues: v8 (copy), v4 (copy)
        if v8.modalSelectorHandle ~= nil then
            v4.unmount(v8.modalSelectorHandle);
            v8.modalSelectorHandle = nil;
        end;
        if v8.modalSelectorScreenGui ~= nil then
            v8.modalSelectorFrame.Parent = nil;
            v8.modalSelectorFrame = nil;
            v8.modalSelectorScreenGui = nil;
        end;
    end
};