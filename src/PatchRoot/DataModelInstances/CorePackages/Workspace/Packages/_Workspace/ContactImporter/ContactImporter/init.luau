return {
    ContactImporterManager = require(script.ContactImporterManager), 
    Actions = require(script.Actions), 
    ContactsList = require(script.ContactsList.Components.ContactsList), 
    ContactsRevokedAccessDialog = require(script.ContactsList.Components.ContactsRevokedAccessDialog), 
    installReducer = require(script.installReducer), 
    ShowContactImporterParams = require(script.installReducer.ShowContactImporterParams), 
    FindFriendsModal = require(script.FindFriendsModal), 
    Networking = require(script.Networking), 
    Navigator = require(script.CINavigator), 
    RoduxKey = require(script.Common.Constants).RODUX_KEY, 
    Constants = require(script.Common.Constants), 
    TextKeys = require(script.Common.TextKeys), 
    Utils = require(script.Utils), 
    Flags = require(script.Flags), 
    dependencies = require(script.dependencies), 
    ["jest.config"] = script["jest.config"]
};