require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get(users_path) }
    # it 'check status' do
    #   expect(response).to have_http_status(302)
    # end

    # it 'renders correct template' do
    #   expect(response).to render_template('index')
    # end

    it 'renders correct template' do
      expect(response).to_not render_template('show')
    end
  end

  describe 'GET /show' do
    before(:example) { get('/users/365') }

    it 'renders correct template' do
      expect(response).to_not render_template('index')
    end
  end
end
