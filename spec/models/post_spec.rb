# frozen_string_literal: true

require 'rails_helper'

describe 'アソシエーションのテスト' do
  context 'Userモデルとの関係' do
    it 'UserとN:1となっている' do
      expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
    end
  end
end