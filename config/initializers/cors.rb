Rails.application.config.middleware.insert_before 0, 'Rack::Cors' do
  allow do
    origins '*'

    resource '/assets/*',
      headers: :any,
      methods: [:get]
  end
end

# In older versions of Rails, you'll need to use
# 'Rack::Cors' (as a string with quotes)