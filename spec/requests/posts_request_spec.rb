require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get('/users/365/posts') }
    it 'check status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template('index')
    end

    it 'renders correct template' do
      expect(response).to_not render_template('show')
    end

    it 'check for placeholder text' do
      expect(response.body).to include('Post of User')
    end
  end

  describe 'GET /show' do
    before(:example) { get('/users/365/posts/10') }
    it 'check status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template('show')
    end

    it 'renders correct template' do
      expect(response).to_not render_template('index')
    end

    it 'check for placeholder text' do
      expect(response.body).to include('Post 10 by User')
    end
  end
end
