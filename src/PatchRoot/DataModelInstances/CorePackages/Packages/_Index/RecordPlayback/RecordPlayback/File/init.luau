local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_try_0 = require(l_Parent_1.SharedUtils).try;
local v3 = require(l_Parent_0.tryGetService);
local _ = require(l_Parent_0.Location);
local v5 = require(l_Parent_0.PathUtils);
local l_SEPARATOR_0 = v5.SEPARATOR;
local v7 = {};
local v8 = {
    __index = v7
};
v7.new = function(v9) --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v8 (copy)
    return (setmetatable({
        _location = v9, 
        _fileSystemService = v3("FileSystemService"), 
        _fileSyncService = v3("FileSyncService"), 
        _warn = warn
    }, v8));
end;
v7.write = function(v10, v11) --[[ Line: 40 ]] --[[ Name: write ]]
    -- upvalues: l_SEPARATOR_0 (copy)
    if v10._fileSystemService then
        local v12 = v10._location:resolvePath();
        assert(v12:sub(-1) ~= l_SEPARATOR_0, ("File location `%s` cannot end with `%s`"):format(v12, l_SEPARATOR_0));
        v10:_ensureParentDirectoryExists(v12);
        v10._fileSystemService:WriteFile(v12, v11);
        return;
    else
        local v13 = "Attempting to write file in an environment where FileSystemService is " .. "inaccessible.\n\n" .. "Instead, the file content has been written to a ModuleScript instance in the DataModel. ";
        if v10._fileSyncService then
            v10._warn(v13 .. "Since FileSyncService is available, the new ModuleScript should sync back " .. "to the file system.");
        else
            v10._warn("!!! " .. v13 .. "Since FileSyncService is not available, the new ModuleScript will only live " .. "in the current DataModel");
        end;
        v10._location:getOrCreateInstance("ModuleScript").Source = v11;
        return;
    end;
end;
v7._ensureParentDirectoryExists = function(v14, v15) --[[ Line: 74 ]] --[[ Name: _ensureParentDirectoryExists ]]
    -- upvalues: v5 (copy), l_try_0 (copy)
    local v16 = v5.parent(v15);
    if v16 == nil then
        return;
    else
        local v18, v19 = l_try_0(function() --[[ Line: 81 ]]
            -- upvalues: v14 (copy), v16 (copy)
            local l__fileSystemService_0 = v14._fileSystemService;
            if not l__fileSystemService_0:Exists(v16) then
                l__fileSystemService_0:CreateDirectories(v16);
            end;
        end);
        if v18 then
            return;
        else
            if string.find(v19.message, "Error(13): Access Denied. Path is outside of sandbox.", 1, true) then
                v19.message = "Access Denied. Path is outside of sandbox: " .. v15 .. "\n\nProvided file system path is invalid: you likely need to provide a different" .. " argument to --fs.readwrite.\nYou may need to pass in `--fs.readwrite=$PWD`";
            end;
            error(v19);
            return;
        end;
    end;
end;
return v7;