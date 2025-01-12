return function(v0) --[[ Line: 1 ]] --[[ Name: formatDate ]]
    local v1 = DateTime.now();
    local _ = nil;
    return ("%s AT %s"):format(v0:FormatLocalTime(v0:ToLocalTime().Year > v1:ToLocalTime().Year and "ll" or "ddd, MMM DD", "en-us"), v0:FormatLocalTime("LT", "en-us")):upper();
end;