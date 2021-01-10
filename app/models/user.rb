class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    validates :nickname, presence: true, length: { maximum: 6 }

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

    with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'には全角文字を使用してください'  } do
      validates :last_name, presence: true
      validates :first_name, presence: true
    end
    with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'にはカタカナを使用してください'  } do
      validates :last_name_reading, presence: true
      validates :first_name_reading, presence: true
    end
    validates :birthday, presence: true
       
end
