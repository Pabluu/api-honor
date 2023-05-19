# App

Honor

## RFs (Requisitos funcionais)

- [ ] Deve ser possível se cadastrar;
- [ ] Deve ser possível se autenticar;
- [ ] Deve ser possível obter o perfil de um usuário logado;
- [ ] Deve ser possível cadastrar clientes;
- [ ] Deve ser possível o usuário buscar por clientes;
- [ ] Deve ser possível o usuário gerar novos recibos de acordo com a data requerida;
- [ ] Deve ser possível confirmar o pagamento do cliente manualmente ou QRCode;
- [ ] Deve ser possível colocar um valor como "Crédito" caso o valor pago seja maior que o devido;
- [ ] Deve ser possível o usuário obter o histórico de pagamentos dos clientes;
- [ ] Deve ser possível gerar um relatório de pagamentos;

## RNs (Regras de negócios)

- [ ] O usuário ou o cliente não deve poder se cadastrar com um e-mail duplicado;
- [ ] Os clientes só pode ser cadastrada pelo ADMIN;
- [ ] Os recibos devem ser gerados somente pelo ADMIN

## RNFs (Requisitos não-funcionais)

- [ ] A senha do usuário precisa estar criptografada;
- [ ] Os dados da aplicação precisam estar persistidos em um banco de dados PostgreSQL;
- [ ] Todas listas de dados precisam estar paginados com 20 itens por página;
- [ ] O usuário deve ser identificado por um JWT(JSON Web Token);
