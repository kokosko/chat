Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
  provider :google_oauth2,
           '22458083253-bgbnmlhvh0rkpou3g418ptts6d6pujoa.apps.googleusercontent.com',
           'SigwrPF-UfZaHHWiibltPmFl'
end
