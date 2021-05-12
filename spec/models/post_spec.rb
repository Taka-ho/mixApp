require 'rails_helper'
RSpec.describe Post, type: :model do
    before do
      @post = FactoryBot.create(:post)
      @post.images = fixture_file_upload("files/test_image.jpg")
    end

    describe Post do
        describe 'ツイート投稿' do
          context 'ツイートの投稿ができるとき' do
                it 'すべてを入力したら投稿できる' do
                  @post.content = 'aaaaaaaa'
                  @post.images = fixture_file_upload("files/test_image.jpg")

                end

                it '画像の投稿がなくても投稿できる' do
                  @post.content = 'aaaaaaaa'
                  @post.images = ''
                end 
            end
              context 'ツイートの投稿ができないとき' do
                it 'contentがない場合は投稿できないこと' do
                  @post.content = ''
                  @post.valid?
                end

                it '画像があっても本文がないと投稿できない' do
                  @post.content = ''
                  @post.images = fixture_file_upload("files/test_image.jpg")
                end

                it 'もし投稿するものがimageではない場合投稿できない' do
                  images = 'files/test.mp4'
                  @post.valid?
                  except(@user.notice).to include 'asdfadsfadfs'
                end

                it 'もしcontentが141字以上だったら投稿されない' do
                  @post.content = ''
                  @post.valid?
                  except(@user.notice).to include "Email can't be blank"
                end    
              end
            end
        end
end
