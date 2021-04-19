require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep(2)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができるとき' do
      it 'すべてを入力したら保存できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができるとき' do
        it 'nicknameが空では登録できない' do
            @user.nickname = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "Nicknameを入力してください"
        end

        it 'emailが空では登録できない' do
            @user.email = ''
            @user.valid?
            expect(@user.errors.full_messages).to include 'Eメールを入力してください'
        end
    
        it 'emailは@が含まれていないと登録ができない' do
            @user.email = '12266666asadasan1gmail.com'
            @user.valid?
            expect(@user.errors.full_messages).to include "Eメールは不正な値です"
        end
    
        it 'passwordが空では登録できない' do
            @user.password = ''
            @user.valid?
            expect(@user.errors.full_messages).to include "パスワードを入力してください"
        end
    
        it 'passwordが6文字以下では登録できない' do
            @user.password = '1a1'
            @user.valid?
            expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
        end

        it 'passwordとpassword_confirmationが一致していないと登録できない' do
            @user.password = 'aa11bb'
            @user.password_confirmation = 'aa22bb'
            @user.valid?
            expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
        end

        it 'enjoy_pointがからの場合は登録できない' do
          @user.enjoy_point = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
        end

        it 'mania_histryが数字ではない場合は保存できない' do
            @user.mania_histry ='asdf'
            @user.valid?
            expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
        end
      end
    end
end