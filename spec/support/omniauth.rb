RSpec.configure do |config|
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock :facebook, {
    provider: 'facebook',
    uid: '1234567',
    info: {
      email: 'uplay@dummy.com',
      image: 'http://dummy.url.com'
    },
    credentials: { token: 'dummy_token' },
    extra: {
      raw_info: {
        birthday: '01/30/1990',
        first_name: 'John',
        last_name: 'Doe',
        link: 'http://www.facebook.com/dummy',
      }
    }
  }

  OmniAuth.config.add_mock :facebook_limited, {
    provider: 'facebook',
    uid: '1234567',
    info: {
      email: 'uplay@dummy.com',
      image: 'http://dummy.url.com'
    },
    credentials: { token: 'dummy_token' }
  }
end
