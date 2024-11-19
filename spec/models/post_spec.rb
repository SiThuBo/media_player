require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(email: 'test@example.com', password: 'password')
    post = Post.new(title: 'Sample Post', media: File.open('spec/fixtures/sample.jpg'), user: user, media_type: 'image')
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    post = Post.new(title: nil)
    expect(post).not_to be_valid
  end
end
