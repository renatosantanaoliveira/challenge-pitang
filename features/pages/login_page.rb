class LogIn < SitePrism::Page
    set_url "/login"

    element :form_page, '#userForm'
    element :username, '#userName'
    element :password, '#password'
    element :btn_login, '#login'
    element :btn_newuser, '#newUser'
    element :message_error, '#name'
    element :first_name, '#firstname'
    element :last_name, '#lastname'
    element :captcha, :xpath, 'div.recaptcha-checkbox-border'

    def wait_page_load
        wait_until_form_page_visible
        wait_until_username_visible
        wait_until_password_visible
        wait_until_btn_login_visible
        wait_until_btn_newuser_visible
    end

    def set_username(_username)
        wait_until_username_visible
        username.set _username
    end

    def set_password(_password)
        wait_until_password_visible
        password.set _password
    end

    def set_first_name(_name)
        wait_until_first_name_visible
        first_name.set _name
    end

    def set_last_name(_name)
        wait_until_last_name_visible
        last_name.set _name
    end

    def wait_message_error
        wait_until_message_error_visible
    end

    def click_in_captcha
        wait_until_captcha_visible
        captcha.click
    end

end