ActionMailer::Base.smtp_settings = {
        :address              => "smtp.gmail.com",
        :port                 => 587,
        :domain               => "gmail.com",
        :user_name            => "senthilexample@gmail.com",
        :password             => "123456789abcd",
        :authentication       => "plain",
        :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost"