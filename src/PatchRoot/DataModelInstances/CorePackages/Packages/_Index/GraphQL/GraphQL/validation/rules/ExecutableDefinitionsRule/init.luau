local l_Parent_0 = script.Parent.Parent.Parent;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local l_language_0 = l_Parent_0.language;
local l_Kind_0 = require(l_language_0.kinds).Kind;
local l_isExecutableDefinitionNode_0 = require(l_language_0.predicates).isExecutableDefinitionNode;
return {
    ExecutableDefinitionsRule = function(v5) --[[ Line: 23 ]]
        -- upvalues: l_isExecutableDefinitionNode_0 (copy), l_Kind_0 (copy), l_GraphQLError_0 (copy)
        return {
            Document = function(_, v7) --[[ Line: 25 ]] --[[ Name: Document ]]
                -- upvalues: l_isExecutableDefinitionNode_0 (ref), l_Kind_0 (ref), v5 (copy), l_GraphQLError_0 (ref)
                for _, v9 in ipairs(v7.definitions) do
                    if not l_isExecutableDefinitionNode_0(v9) then
                        local v10 = nil;
                        v10 = (not (v9.kind ~= l_Kind_0.SCHEMA_DEFINITION) or v9.kind == l_Kind_0.SCHEMA_EXTENSION) and "schema" or "\"" .. v9.name.value .. "\"";
                        v5:reportError(l_GraphQLError_0.new(("The %s definition is not executable."):format(v10), v9));
                    end;
                end;
                return false;
            end
        };
    end
};