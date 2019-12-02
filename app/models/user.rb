class User < ApplicationRecord
  include CryptoAlgorithm
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :generate_key_pair

  def generate_key_pair
    pub,pvt = generate_keys
    self.pub_key = pub
    self.pvt_key = pvt

    PublicKey.create(key: pub, user_id: self.id)
    nil
  end
end
