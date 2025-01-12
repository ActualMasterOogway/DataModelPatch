local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Parent.CaptureManager);
local v3 = require(script.Parent.Captures);
local v4 = require(script.Parent.Carousel);
local v5 = require(script.Parent.Composer);
local v6 = require(script.Parent.IsActive);
local v7 = require(script.Parent.IsCapturesCoreGuiEnabled);
local v8 = require(script.Parent.IsMenuOpen);
local v9 = require(script.Parent.IsOverlayActive);
local v10 = require(script.Parent.IsOverlayFlashActive);
local v11 = require(script.Parent.Prompts);
local v12 = require(script.Parent.Toast);
return function() --[[ Line: 32 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
    return v1.combineReducers({
        CaptureManager = v2, 
        Captures = v3, 
        Carousel = v4, 
        Composer = v5, 
        IsActive = v6, 
        IsCapturesCoreGuiEnabled = v7, 
        IsMenuOpen = v8, 
        IsOverlayActive = v9, 
        IsOverlayFlashActive = v10, 
        Prompts = v11, 
        Toast = v12
    });
end;