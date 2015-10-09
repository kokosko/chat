require 'test_helper'

feature 'User' do
  describe 'Sign In' do
    before do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
    end

    it 'with Google' do
      visit '/'
      expect(page).to have_content('Sign In With Google')
    end
  end
end
