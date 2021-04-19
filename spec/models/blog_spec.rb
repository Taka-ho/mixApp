require 'rails_helper'
RSpec.describe Blog, type: :model do
  before do
    @blog = FactoryBot.build(:blog)
  end
  describe Blog do
    describe 'ツイート投稿' do
      context 'ツイートの投稿ができるとき' do
          it 'すべてを入力したら投稿できる' do
            @blog.title = 'aaaaaaaa'
            @blog.body = fixture_file_upload("files/test_image.jpg")
          end
      end
          context 'ブログの投稿ができないとき' do
            it 'titleがない場合は投稿できないこと' do
              @blog.body = ''
              @blog.valid?
        
            end
            
          end
        end
      end