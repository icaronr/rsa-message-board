# Trabalho Final - Segurança Computacional

Alunos: 
- Ícaro Nery Rezende - 15/0037023
- Matheus Rodrigues Guimarães - 15/0141661

## RSA Message Board

A ideia do projeto é implementar o algoritmo do RSA e aplicá-lo num quadro de mensagens, de forma que a apenas o destinatário da mensagem consiga visualizá-la corretamente

O código para o RSA implementado está no arquivo `lib/crypto_algorithm.rb`, e está dividido em 3 partes:
1. Geração de chaves
2. Encriptação da mensagem
3. Desencriptação da mensagem

O projeto está implementado em Ruby.
Para rodar o projeto completo é necessário instalar o Postgresql e o Yarn para a correta utilização do Ruby on Rails.
Após isso, entrar na pasta raiz do projeto e rodar os seguintes comandos:
1. `bundle`
2. `yarn`
2. `rails db:create db:migrate`
3. `rails s`

Com isso o servidor estará rodando e disponível em `localhost:3000`.

Caso queira rodar apenas o RSA, sem o sistema completo:
1. Descomente o exemplo no final do arquivo
2. `cd lib`
3. `ruby crypto_algorithm.rb` 
