local l_script_0 = script;
local v1 = require(l_script_0.ArtifactLoader);
local v2 = require(l_script_0.RecordPlayback);
local v3 = require(l_script_0.Resolver);
return {
    createRecordPlayback = function(v4) --[[ Line: 14 ]] --[[ Name: createRecordPlayback ]]
        -- upvalues: v3 (copy), v1 (copy), v2 (copy)
        local v5 = v3.new(v4.instanceParent, v4.fileSystemPath);
        local v6 = v1.new(v5);
        return function(v7) --[[ Line: 18 ]] --[[ Name: create ]]
            -- upvalues: v2 (ref), v6 (copy)
            assert(typeof(v7) == "string", "location should be a string");
            return v2.new(v6, v7);
        end;
    end
};