require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
      @post = FactoryBot.build(:post)
      # @post.images = "/files/test.mp4"
  end
describe Post do
  describe 'ツイート投稿' do
    context 'ツイートの投稿ができるとき' do
        it 'すべてを入力したら保存できる' do
          expect(@post).to be_valid
        end
        it '画像が抜けていても登録できること' do
          @post.images = ''
          expect(@post).to be_valid
        end
    end

    it 'contentがない場合は投稿できないこと' do
      @post.content = ''
      @post.valid?
      expect(@post.errors.full_messages).to include 
'User translation missing: ja.activerecord.errors.models.post.attributes.user.required', 'Content translation missing: ja.activerecord.errors.models.post.attributes.content.blank'
    end

    it 'もし投稿するものがではない場合投稿できない' do
      @post.images
        @post.valid?
        expect(@post.errors.full_messages).to include 
'User translation missing: ja.activerecord.errors.models.post.attributes.user.required', 'Content translation missing: ja.activerecord.errors.models.post.attributes.content.blank'
    end
  end
end
end
