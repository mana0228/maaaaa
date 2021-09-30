module UsersHelper
     def set_image(user)
        if user.image.present?
            user.image_url
        else
             "place-holder.png"
        end
    end
end
