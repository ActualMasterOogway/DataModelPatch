local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Cryo);
local _ = require(l_Parent_0.StyleTypes);
local v4 = {
    BASE_SIZE = 16, 
    FACTOR = 1.26
};
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 17 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v7 = {
        _tokens = v6
    };
    setmetatable(v7, v5);
    return v7;
end;
v5.loadFont = function(v8) --[[ Line: 25 ]] --[[ Name: loadFont ]]
    -- upvalues: v4 (copy), v2 (copy)
    local l__tokens_0 = v8._tokens;
    local l_BASE_SIZE_0 = v4.BASE_SIZE;
    local v11 = {
        BaseSize = l_BASE_SIZE_0 * v4.FACTOR, 
        HeadingLarge = {
            Font = Enum.Font.BuilderSansBold, 
            RelativeSize = l__tokens_0.Global.Size_350 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_300 / l_BASE_SIZE_0
        }, 
        HeadingSmall = {
            Font = Enum.Font.BuilderSansBold, 
            RelativeSize = l__tokens_0.Global.Size_250 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_200 / l_BASE_SIZE_0
        }, 
        TitleLarge = {
            Font = Enum.Font.BuilderSansBold, 
            RelativeSize = l__tokens_0.Global.Size_200 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0
        }, 
        BodyLarge = {
            Font = Enum.Font.BuilderSans, 
            RelativeSize = l__tokens_0.Global.Size_200 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0
        }, 
        CaptionLarge = {
            Font = Enum.Font.BuilderSansMedium, 
            RelativeSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_100 / l_BASE_SIZE_0
        }, 
        BodySmall = {
            Font = Enum.Font.BuilderSans, 
            RelativeSize = l__tokens_0.Global.Size_150 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_100 / l_BASE_SIZE_0
        }, 
        CaptionSmall = {
            Font = Enum.Font.BuilderSansMedium, 
            RelativeSize = l__tokens_0.Global.Size_125 / l_BASE_SIZE_0, 
            RelativeMinSize = l__tokens_0.Global.Size_100 / l_BASE_SIZE_0
        }
    };
    local v12 = v8:mapLegacyFont(v11, l_BASE_SIZE_0);
    return v2.Dictionary.join(v12, v11);
end;
v5.mapLegacyFont = function(_, v14, v15) --[[ Line: 78 ]] --[[ Name: mapLegacyFont ]]
    return {
        Title = {
            Font = v14.HeadingLarge.Font, 
            RelativeSize = 28 / v15, 
            RelativeMinSize = 24 / v15
        }, 
        Header1 = {
            Font = v14.HeadingSmall.Font, 
            RelativeSize = 20 / v15, 
            RelativeMinSize = 16 / v15
        }, 
        Header2 = {
            Font = v14.TitleLarge.Font, 
            RelativeSize = 16 / v15, 
            RelativeMinSize = 12 / v15
        }, 
        SubHeader1 = {
            Font = v14.TitleLarge.Font, 
            RelativeSize = 16 / v15, 
            RelativeMinSize = 12 / v15
        }, 
        Body = {
            Font = v14.BodyLarge.Font, 
            RelativeSize = 16 / v15, 
            RelativeMinSize = 12 / v15
        }, 
        CaptionHeader = {
            Font = v14.CaptionLarge.Font, 
            RelativeSize = 12 / v15, 
            RelativeMinSize = 9 / v15
        }, 
        CaptionSubHeader = {
            Font = v14.CaptionLarge.Font, 
            RelativeSize = 12 / v15, 
            RelativeMinSize = 9 / v15
        }, 
        CaptionBody = {
            Font = v14.BodySmall.Font, 
            RelativeSize = 12 / v15, 
            RelativeMinSize = 9 / v15
        }, 
        Footer = {
            Font = v14.CaptionSmall.Font, 
            RelativeSize = 10 / v15, 
            RelativeMinSize = 8 / v15
        }
    };
end;
return v5;