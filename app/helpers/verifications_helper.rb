module VerificationsHelper
    def get_user_verification(user)
        if Verification.find_by(user_id: user.id)
            Verification.find_by(user_id: user.id)
        else
            Verification.new
        end
    end
end
