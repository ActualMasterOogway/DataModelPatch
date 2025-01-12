local v0 = require(script.ExternalEventConnection);
local v1 = require(script.validatePropsWithForwardRef);
local v2 = require(script.isGamepadInput);
local v3 = require(script.wasLastInputGamepad);
local v4 = require(script.withIsGamepadInput);
local v5 = require(script.Components);
local v6 = require(script.Hooks);
local _ = require(script.types);
return {
    Components = v5, 
    Hooks = v6, 
    ExternalEventConnection = v0, 
    validatePropsWithForwardRef = v1, 
    isGamepadInput = v2, 
    wasLastInputGamepad = v3, 
    withIsGamepadInput = v4
};