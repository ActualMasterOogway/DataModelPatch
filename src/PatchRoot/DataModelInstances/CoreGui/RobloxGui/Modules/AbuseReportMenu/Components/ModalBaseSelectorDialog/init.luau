local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_script_FirstAncestor_0.Components.Constants);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.React);
local l_ScrollingListTable_0 = v3.App.Table.ScrollingListTable;
local l_CellHeadDetail_0 = v3.App.Table.CellHeadDetail;
local l_Cell_0 = v3.App.Table.Cell;
local l_CellTailDescription_0 = v3.App.Table.CellTailDescription;
local l_ModalWindow_0 = v3.App.Dialog.Modal.ModalWindow;
local v10 = require(l_CorePackages_0.Packages.Dash);
local v11 = require(l_CorePackages_0.Packages.Cryo);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.ImageSet.Enum.IconSize;
local l_OpenTypeSupport_0 = v3.Utility.OpenTypeSupport;
local l_Images_0 = v3.App.ImageSet.Images;
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v18 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigationCoreScriptsWrapper_0 = v18.FocusNavigationCoreScriptsWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v18.FocusNavigableSurfaceIdentifierEnum;
local v21 = require(l_script_FirstAncestor_0.Flags.GetFFlagModalSelectorCloseButton);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local function v32(v23) --[[ Line: 51 ]] --[[ Name: ModalBaseSelectorDialog ]]
    -- upvalues: l_useStyle_0 (copy), v4 (copy), v21 (copy), v11 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_ScrollingListTable_0 (copy), v10 (copy), l_Cell_0 (copy), l_CellHeadDetail_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), l_CellTailDescription_0 (copy), l_ModalWindow_0 (copy)
    local v24 = l_useStyle_0();
    local l_Theme_0 = v24.Theme;
    local v26 = math.min(#v23.cellData * 40, v23.viewportHeight - 80 - 24);
    local v27 = v26 + 24;
    local v28 = 0;
    local v29 = 0;
    local v30 = {
        Paddings = v4.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 12), 
            PaddingRight = UDim.new(0, 12)
        })
    };
    if v21() then
        v27 = v26 + 48 + 40;
        v28 = 12;
        v29 = -36;
        v30 = v11.Dictionary.join(v30, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = 0
            }), 
            Header = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 40), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                Layout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right
                }), 
                CloseButton = v4.createElement(l_IconButton_0, {
                    size = UDim2.fromOffset(0, 0), 
                    iconSize = l_IconSize_0.Medium, 
                    icon = l_Images_0["icons/navigation/close"], 
                    onActivated = function() --[[ Line: 94 ]] --[[ Name: onActivated ]]
                        -- upvalues: v23 (copy)
                        v23.onClose();
                    end
                })
            }), 
            Divider = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = v24.Theme.Divider.Transparency, 
                BackgroundColor3 = v24.Theme.Divider.Color, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            })
        });
    end;
    v30 = v11.Dictionary.join(v30, {
        SelectorFrame = v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, v29), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            Paddings = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v28)
            }), 
            ModalSelector = v4.createElement(l_ScrollingListTable_0, {
                selectable = false, 
                size = UDim2.new(1, 0, 1, 0), 
                cells = v10.map(v23.cellData, function(v31) --[[ Line: 123 ]]
                    -- upvalues: v4 (ref), l_Cell_0 (ref), l_CellHeadDetail_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref), l_CellTailDescription_0 (ref), v23 (copy)
                    return v4.createElement(l_Cell_0, {
                        head = v4.createElement(l_CellHeadDetail_0, {
                            labelText = v31.label, 
                            subLabelText = v31.subLabel, 
                            openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
                        }), 
                        tail = v4.createElement(l_CellTailDescription_0, {
                            text = "", 
                            showArrow = false
                        }), 
                        background = v4.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.fromScale(1, 1)
                        }), 
                        size = UDim2.new(1, 0, 0, 40), 
                        userInteractionEnabled = true, 
                        onActivated = function() --[[ Line: 142 ]] --[[ Name: onActivated ]]
                            -- upvalues: v23 (ref), v31 (copy)
                            v23.onSelect(v31.label, v31.subLabel, v31.identifier);
                            v23.onClose();
                        end
                    });
                end)
            })
        })
    });
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0)
    }, {
        Overlay = if v23.isShown then v4.createElement("TextButton", {
            Selectable = false, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Overlay.Color, 
            BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 10, 
            Text = "", 
            [v4.Event.Activated] = function() --[[ Line: 169 ]]
                -- upvalues: v23 (copy)
                v23.onClose();
            end
        }, {
            Modal = v4.createElement(l_ModalWindow_0, {
                isFullHeight = false, 
                screenSize = Vector2.new(v23.viewportWidth, v23.viewportHeight)
            }, {
                ModalContent = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v27), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 20)
                }, v30)
            })
        }) else nil
    });
end;
DialogWrapper = function(v33) --[[ Line: 190 ]] --[[ Name: DialogWrapper ]]
    -- upvalues: v4 (copy), l_CoreScriptsRootProvider_0 (copy), l_FocusNavigationCoreScriptsWrapper_0 (copy), v2 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v32 (copy)
    return v4.createElement(l_CoreScriptsRootProvider_0, {}, {
        FocusNavigationCoreScriptsWrapper = v4.createElement(l_FocusNavigationCoreScriptsWrapper_0, {
            selectionGroupName = v2.ModalBaseSelectorDialogRootName, 
            focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
        }, {
            DialogContainer = v4.createElement(v32, v33)
        })
    });
end;
return DialogWrapper;