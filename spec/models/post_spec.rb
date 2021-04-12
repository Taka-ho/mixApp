require 'rails_helper'
RSpec.describe Post, type: :model do
  before do
      @post = FactoryBot.build(:post)
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
       
    end

    it 'もし投稿するものがimageではない場合投稿できない' do
      @post.images = "file/test.mp4"
        @post.valid?
        expect(@post.errors.full_messages).to include 
    end
  end
  end
end
