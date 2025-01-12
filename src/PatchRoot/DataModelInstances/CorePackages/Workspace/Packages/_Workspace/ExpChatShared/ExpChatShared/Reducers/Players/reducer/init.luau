local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
return require(l_Parent_0.Rodux).combineReducers({
    byUserId = require(script.Parent.byUserId), 
    byDisplayName = require(script.Parent.byDisplayName), 
    byUsername = require(script.Parent.byUsername), 
    charactersByUserId = require(script.Parent.charactersByUserId)
});