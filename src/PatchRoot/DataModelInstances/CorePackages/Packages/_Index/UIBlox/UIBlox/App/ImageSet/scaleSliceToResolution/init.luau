return function(v0, v1) --[[ Line: 10 ]]
    if v0.SliceCenter then
        local v2 = v0.SliceCenter.Min * v1;
        local v3 = v0.SliceCenter.Max * v1;
        v0.SliceCenter = Rect.new(v2, v3);
        v0.SliceScale = (v0.SliceScale or 1) / v1;
    end;
    return v0;
end;