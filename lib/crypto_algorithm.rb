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
    cyphertext = bn_plaintext.mod_exp(e, n)
    return cyphertext
  end
  
  def decrypt key, cyphertext
    n, d = key
    plaintext = cyphertext.mod_exp(d, n).to_s(2)
    return plaintext
  end
end

include CryptoAlgorithm
pub, pvt = generate_keys
msg = "O Toin tem cara de vasilaaao"
enc_msg = encrypt pub, msg
dec_msg = decrypt pvt, enc_msg
puts dec_msg
