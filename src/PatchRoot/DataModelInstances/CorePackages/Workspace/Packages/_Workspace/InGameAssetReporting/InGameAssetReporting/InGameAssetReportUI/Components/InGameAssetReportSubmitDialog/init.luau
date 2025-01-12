local l_Parent_0 = script:FindFirstAncestor("InGameAssetReporting").Parent;
local v1 = require(l_Parent_0.React);
local l_DefaultDualDropdownDialog_0 = require(l_Parent_0.GenericAbuseReporting).UXFlows.DefaultDualDropdownDialog;
return function(v3) --[[ Line: 16 ]] --[[ Name: InGameAssetReportSubmitDialog ]]
    -- upvalues: v1 (copy), l_DefaultDualDropdownDialog_0 (copy)
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.fromScale(0.5, 0.5), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        ZIndex = 10
    }, {
        SubmitReportDialog = v1.createElement(l_DefaultDualDropdownDialog_0, {
            analyticsContext = "Test", 
            localizationKeys = {
                formTitle = "Feature.ReportAbuse.Title.SelectInSceneFinishYourReport", 
                formSubmit = "Feature.ReportAbuse.Action.Submit"
            }, 
            onSubmitProps = {
                hasNextSteps = true, 
                onProceedToNextStep = v3.onSubmit
            }, 
            onCloseProps = {
                hasPreviousSteps = false, 
                onAbandon = v3.onBack
            }, 
            reportProblems = {
                {
                    localizationKey = "Feature.ReportAbuse.Problem.Bullying", 
                    value = "bullying", 
                    descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Bullying"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.Problem.Cheating", 
                    value = "exploiting", 
                    descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Cheating"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.Problem.Dating", 
                    value = "dating", 
                    descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Dating"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.Problem.Hate", 
                    value = "hate", 
                    descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Hate"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.Problem.Links", 
                    value = "offsite links", 
                    descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Links"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.Problem.Personal", 
                    value = "personal question", 
                    descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Personal"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.Problem.Scamming", 
                    value = "scamming", 
                    descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Scamming"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.Problem.Swearing", 
                    value = "swearing", 
                    descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Swearing"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.Problem.Violence", 
                    value = "violence", 
                    descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Violence"
                }
            }, 
            reportSurfaces = {
                {
                    localizationKey = "Feature.ReportAbuse.ProblemSurface.Avatar", 
                    value = "avatar"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.ProblemSurface.DrawingOrCreation", 
                    value = "drawing"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.ProblemSurface.Experience", 
                    value = "experience"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.ProblemSurface.ItemOrAsset", 
                    value = "item"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.ProblemSurface.Movement", 
                    value = "movement"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.ProblemSurface.MusicOrSoundEffect", 
                    value = "music"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.ProblemSurface.TextChat", 
                    value = "text"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.ProblemSurface.Username", 
                    value = "username"
                }, 
                {
                    localizationKey = "Feature.ReportAbuse.ProblemSurface.VoiceChat", 
                    value = "voice"
                }
            }
        })
    });
end;