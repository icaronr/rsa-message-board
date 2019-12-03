module CryptoAlgorithm
  require 'openssl'

  # Crypto Algorythm Based in RSA
  # https://www.lambda3.com.br/2012/12/entendendo-de-verdade-a-criptografia-rsa-parte-ii/
  def generate_keys
    one = 1.to_bn
    # Gera os 2 numeros primos aleatorios
    p = OpenSSL::BN.generate_prime(512, safe=true)
    q = OpenSSL::BN.generate_prime(512, safe=true)
    # gera n
    n = p * q
    # Computa a função totiente phi(n) = (p -1) (q -1)
    phi_n = (p - one) * (q - one)
    # pega o valor de e (pega um primo aleatorio menor que que phi n e testa se é co-primo com phi(n))
    e = OpenSSL::BN.generate_prime(256, safe=true)
    while(phi_n.gcd(e) > one) do
      e = e + one
    end
    # calcula d, o inverso multiplicativo de e
    d = e.to_bn.mod_inverse(phi_n)
    pub_key = [n, e]
    pvt_key = [n, d]
    return [pub_key, pvt_key]
  end

  def encrypt key, plaintext
    n, e = key
    bn_plaintext = OpenSSL::BN.new(plaintext, 2)   
    ciphertext = bn_plaintext.mod_exp(e, n)
    return ciphertext
  end
  
  def decrypt key, ciphertext
    n, d = key
    plaintext = ciphertext.mod_exp(d, n).to_s(2)
    return plaintext
  end
end

# include CryptoAlgorithm
# require 'openssl'

# pub1, pvt1 = generate_keys
# pub2, pvt2 = generate_keys

# msg = "Quero ver se essa mensagem chega mesmo"

# enc_msg = encrypt pub1, msg
# enc_msg = encrypt pvt2, enc_msg.to_s(2)

# dec_msg = decrypt pub2, enc_msg
# dec_msg = decrypt pvt1, OpenSSL::BN.new(dec_msg, 2)

# puts dec_msg
