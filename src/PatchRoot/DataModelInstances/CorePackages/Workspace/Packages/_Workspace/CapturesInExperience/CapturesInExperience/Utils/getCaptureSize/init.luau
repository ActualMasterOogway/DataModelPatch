local l_CaptureService_0 = game:GetService("CaptureService");
return function(v1) --[[ Line: 3 ]] --[[ Name: getCaptureSize ]]
    -- upvalues: l_CaptureService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 4 ]]
        -- upvalues: l_CaptureService_0 (ref), v1 (copy)
        return l_CaptureService_0:GetCaptureSizeAsync(v1);
    end);
    if not l_status_0 or l_result_0 == Vector2.new(0, 0) then
        return nil;
    else
        return l_result_0;
    end;
end;