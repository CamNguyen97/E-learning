Rails.application.config.middleware.use OmniAuth::Builder do 
provider :google_oauth2, 
  "34494446776-hft79hse6topjshq6d1sbmjhjrggc7dl.apps.googleusercontent.com",
  "Rvr627awzv-Vyo3VP1xWWv2d"
end