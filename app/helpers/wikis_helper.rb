module WikisHelper
    
    def user_can_edit?(wiki)
     current_user && (current_user == wiki.user)
    end
    
    def user_can_see?(wiki)
    current_user.premium
    end
    
end
