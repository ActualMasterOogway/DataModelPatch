local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Core_0 = l_Parent_2.Core;
local v5 = require(l_Parent_3.Foundation);
local l_ButtonVariant_0 = v5.Enums.ButtonVariant;
local l_ButtonSize_0 = v5.Enums.ButtonSize;
local v8 = require(l_Parent_0.Enum.ButtonType);
local v9 = require(l_Core_0.Button.Enum.StandardButtonSize);
local v10 = require(l_Parent_1.ImageSet.ImagesInverse);
local v11 = {
    [v8.Alert] = l_ButtonVariant_0.Alert, 
    [v8.PrimaryContextual] = l_ButtonVariant_0.Emphasis, 
    [v8.PrimarySystem] = l_ButtonVariant_0.SubEmphasis, 
    [v8.Secondary] = l_ButtonVariant_0.Subtle
};
local v12 = {
    [v9.Regular] = l_ButtonSize_0.Medium, 
    [v9.Small] = l_ButtonSize_0.Small, 
    [v9.XSmall] = l_ButtonSize_0.XSmall
};
return {
    buttonMapping = v11, 
    sizeMapping = v12, 
    findIcon = function(v13) --[[ Line: 29 ]] --[[ Name: findIcon ]]
        -- upvalues: v10 (copy)
        if not v13 then
            return nil;
        else
            local v14 = v10[v13];
            if v14 == nil then
                warn("Icon not found");
            end;
            return v14;
        end;
    end, 
    getSizeMapping = function(v15, v16, v17) --[[ Line: 40 ]] --[[ Name: getSizeMapping ]]
        -- upvalues: v12 (copy), l_ButtonSize_0 (copy)
        if v15 then
            return v12[v15];
        elseif v16 then
            if v16.Y.Offset >= v17.Size.Size_1000 then
                return l_ButtonSize_0.Medium;
            elseif v16.Y.Offset >= v17.Size.Size_800 then
                return l_ButtonSize_0.Small;
            else
                return l_ButtonSize_0.XSmall;
            end;
        else
            return nil;
        end;
    end, 
    getWidth = function(v18, v19) --[[ Line: 55 ]] --[[ Name: getWidth ]]
        if v18 then
            return v18.X;
        elseif v19 then
            return nil;
        else
            return UDim.new(1, 0);
        end;
    end, 
    getTestId = function(v20) --[[ Line: 65 ]] --[[ Name: getTestId ]]
        if not v20 or #v20 == 0 then
            return nil;
        else
            return v20:match("data%-testid=([^%s]+)");
        end;
    end
};