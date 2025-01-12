local v0 = {
    Variant = {
        CLRv1 = "CLRv1"
    }
};
buildReport = function(v1, v2, v3, v4) --[[ Line: 7 ]] --[[ Name: buildReport ]]
    -- upvalues: v0 (copy)
    return {
        tags = {
            ENTRY_POINT = {
                valueList = {
                    {
                        data = "in-experience"
                    }
                }
            }, 
            SUBMITTER_USER_ID = {
                valueList = {
                    {
                        data = tostring(v1)
                    }
                }
            }, 
            REPORTED_ABUSE_CATEGORY = {
                valueList = {
                    {
                        data = v3
                    }
                }
            }, 
            REPORTER_COMMENT = {
                valueList = {
                    {
                        data = v4
                    }
                }
            }, 
            REPORTED_ABUSE_VECTOR = {
                valueList = {
                    {
                        data = "chat"
                    }
                }
            }, 
            REPORT_TARGET_USER_ID = {
                valueList = {
                    {
                        data = v2
                    }
                }
            }, 
            VARIANT = {
                valueList = {
                    {
                        data = v0.Variant.CLRv1
                    }
                }
            }
        }
    };
end;
return buildReport;