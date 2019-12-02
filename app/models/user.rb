class User < ApplicationRecord
  require 'openssl'
  include CryptoAlgorithm
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :generate_key_pair

  def generate_key_pair
    pub,pvt = generate_keys
    self.pub_key = arruma_chave(pub)
    self.pvt_key = arruma_chave(pvt)
    self.save
    PublicKey.create(key: self.pub_key, user_id: self.id)
    nil
  end

  def my_key(key)
    k_arr = key.split(':')
    k = []
    k << eval(k_arr[0]).to_bn
    k << eval(k_arr[1]).to_bn
    return k
  end

  private
  def arruma_chave(pub)
    p arr2 = pub.map{|p| p.to_s}
    chave = ""
    arr2.each{|a| chave << a + ":"}
    p chave.delete_suffix!(':')
    return chave
  end
end
