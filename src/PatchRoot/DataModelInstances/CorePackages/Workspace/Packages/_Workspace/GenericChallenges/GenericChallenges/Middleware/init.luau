return {
    ChallengeHeaders = require(script.ChallengeHeaders), 
    IsChallengeHttpResponse = require(script.IsChallengeHttpResponse), 
    BuildChallengeWebViewUrl = require(script.BuildChallengeWebViewUrl), 
    ChallengeWebView = require(script.ChallengeWebView), 
    InterceptChallenge = require(script.InterceptChallenge), 
    ChallengeError = require(script.ChallengeError), 
    ChallengeRequestWrapper = require(script.ChallengeRequestWrapper), 
    RenderChallenge = require(script.RenderChallenge), 
    Challenges = require(script.Challenges), 
    InitExperienceChallengeInterceptor = require(script.InitExperienceChallengeInterceptor)
};