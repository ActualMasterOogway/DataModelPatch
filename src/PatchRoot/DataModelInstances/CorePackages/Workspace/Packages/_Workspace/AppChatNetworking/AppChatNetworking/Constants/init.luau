return {
    PageSize = {
        GET_NEW_MESSAGES = 4, 
        GET_CONVERSATIONS = game:DefineFastInt("ChatGetConversationsPageSize", 20)
    }, 
    ResponseStatus = {
        SUCCESS = "success", 
        MODERATED = "moderated"
    }, 
    UnfilteredThreadsModalSequence = "unfiltered_threads_ftux", 
    UnfilteredThreadsConversationBannerModalSequence = "unfiltered_threads_conversation_banner", 
    UnfilteredThreadsConversationBanner = {
        PHONE_VERIFICATION_GROUP = "conversation_banner_group_phone_verification", 
        DUPLICATE_UPGRADE = "conversation_banner_group_duplicate_upgrade", 
        LEARN_MORE = "conversation_banner_learn_more", 
        PHONE_VERIFICATION_ONE_TO_ONE = "conversation_banner_one_to_one_phone_verification"
    }
};