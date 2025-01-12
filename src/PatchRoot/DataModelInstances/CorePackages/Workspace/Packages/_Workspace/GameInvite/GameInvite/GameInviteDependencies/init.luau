local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.HttpRequest);
return {
    networkImpl = v1.config({
        requestFunction = v1.requestFunctions.HttpRbxApi
    })
};