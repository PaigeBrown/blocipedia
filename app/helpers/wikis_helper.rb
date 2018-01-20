module WikisHelper
    
    def user_can_edit?(wiki)
     current_user && (current_user == wiki.user)
    end
end
