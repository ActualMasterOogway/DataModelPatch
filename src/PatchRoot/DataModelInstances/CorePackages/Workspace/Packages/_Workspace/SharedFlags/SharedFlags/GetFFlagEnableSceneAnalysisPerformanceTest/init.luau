local v0 = require(script.Parent.GetFFlagMountSceneAnalysisProvider);
game:DefineFastFlag("EnableSceneAnalysisPerformanceTest", false);
return function() --[[ Line: 5 ]]
    -- upvalues: v0 (copy)
    return game:GetFastFlag("EnableSceneAnalysisPerformanceTest") and v0();
end;