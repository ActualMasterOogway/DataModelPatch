return {
    Common = {
        Flags = require(script.Common.Flags)
    }, 
    Components = {
        ReportCompleteDialog = require(script.Dialogs.ReportCompleteDialog), 
        ReportFailedDialog = require(script.Dialogs.ReportFailedDialog)
    }, 
    UXFlows = {
        DefaultTwoStepReportFlow = require(script.UXFlow.ReportWithReasonAndComment.AREntrypoint), 
        DefaultReportDialog = require(script.UXFlow.ReportWithReasonAndComment.ReportWithReasonAndComment), 
        DefaultDualDropdownDialog = require(script.UXFlow.DualDropdownReport.DualDropdownReport), 
        TreeReport = require(script.UXFlow.TreeReport.TreeReportContainer)
    }, 
    ["jest.config"] = script["jest.config"]
};