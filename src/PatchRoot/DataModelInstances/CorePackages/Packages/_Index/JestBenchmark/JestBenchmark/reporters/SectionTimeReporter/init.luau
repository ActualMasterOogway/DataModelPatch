local v0 = {};
local l_initializeReporter_0 = require(script.Parent.Reporter).initializeReporter;
local function v3(v2) --[[ Line: 24 ]] --[[ Name: sectionTime ]]
    if #v2 == 0 then
        return 0;
    else
        return v2[#v2] - v2[1];
    end;
end;
v0.initializeSectionTimeReporter = function() --[[ Line: 32 ]] --[[ Name: initializeSectionTimeReporter ]]
    -- upvalues: l_initializeReporter_0 (copy), v3 (copy)
    local v4 = l_initializeReporter_0("SectionTime", v3);
    return {
        start = function(v5) --[[ Line: 35 ]] --[[ Name: start ]]
            -- upvalues: v4 (copy)
            v4.start(v5);
            v4.report(os.clock());
        end, 
        stop = function() --[[ Line: 40 ]] --[[ Name: stop ]]
            -- upvalues: v4 (copy)
            v4.report(os.clock());
            v4.stop();
        end, 
        finish = v4.finish, 
        report = function(_) --[[ Line: 49 ]] --[[ Name: report ]]
            error("Attempted to call SectionTimeReporter.report. This reporter handles reporting internally.");
        end
    };
end;
return v0;