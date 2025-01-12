return {
    request = {
        body = "{\"linkType\":\"ExperienceDetails\",\"data\":\"{\\\"universeId\\\":\\\"994732206\\\"}\"}", 
        cachePolicy = Enum.HttpCachePolicy.None, 
        headers = {
            ["content-type"] = "application/json", 
            accept = "application/json"
        }, 
        method = "POST", 
        url = {
            host = "apis.roblox.com", 
            path = "/sharelinks/v1/get-or-create-link", 
            query = {}, 
            scheme = "https"
        }
    }, 
    response = {
        body = "{\"code\":\"17623523\",\"shortUrl\":\"https://roblox.com/share?code=17623523&type=ExperienceDetails\"}", 
        headers = {
            ["content-length"] = "0", 
            ["report-to"] = "{\"group\":\"network-errors\",\"max_age\":604800,\"endpoints\":[{\"url\":\"https://ncs.roblox.com/upload\"}]}", 
            ["strict-transport-security"] = "max-age=3600", 
            ["x-roblox-edge"] = "lax2", 
            ["x-roblox-region"] = "us-central", 
            date = "Thu, 14 Dec 2023 19:29:35 GMT", 
            nel = "{\"report_to\":\"network-errors\",\"max_age\":604800,\"success_fraction\":0.001,\"failure_fraction\":1}", 
            server = "Kestrel"
        }, 
        isCached = false, 
        stats = {
            durations = {
                SSLHandshake = 0, 
                connect = -4.4E-5, 
                inQueue = 2.2875000000865953E-5, 
                makeRequest = 1.67E-4, 
                nameLookup = 4.4E-5, 
                receiveResponse = 0.069409, 
                roundTripTime = 0.06984316700000015
            }, 
            retried = false
        }, 
        status = {
            code = 200, 
            message = "OK"
        }, 
        type = "internal-response"
    }
};