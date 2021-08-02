CREATE TABLE corretor (
cpf number(11) NOT NULL,
nome varchar2(40) NOT NULL,
sexo char(1) NOT NULL,
dataNascimento date NOT NULL,
email varchar2(40) NOT NULL,
dataContratacao date NOT NULL,
salario number(7,2) NOT NULL,
bonus number(3,2) default 0,
endBairro varchar2(40),
endRua varchar2(40),
endNum number(5),
cep number(8) NOT NULL,
agencia number(6) NOT NULL,
conta number(9) NOT NULL,
PRIMARY KEY (cpf));

CREATE TABLE proprietario (
cpf number(11) NOT NULL,
nome varchar2(40) NOT NULL,
sexo char(1) NOT NULL,
dataNascimento date NOT NULL,
email varchar2(40) NOT NULL,
endBairro varchar2(40),
endRua varchar2(40),
endNum number(5),
cep number(8) NOT NULL,
agencia number(6) NOT NULL,
conta number(9) NOT NULL,
PRIMARY KEY (cpf));

CREATE TABLE cliente (
cpf number(11) NOT NULL,
nome varchar2(40) NOT NULL,
sexo char(1) NOT NULL,
dataNascimento date NOT NULL,
email varchar2(40) NOT NULL,
estadoCivil varchar2(40)  NOT NULL,
salario number(7,2) NOT NULL,
profissao varchar2(40)  NOT NULL,
dataCadastro date default sysdate,
endBairro varchar2(40),
endRua varchar2(40),
endNum number(5),
cep number(8) NOT NULL,
PRIMARY KEY (cpf));

CREATE TABLE imovel (
codigo number(6) NOT NULL,
tamanho number(5,2) NOT NULL,
alugado number(2) default 0, 
tipo varchar2(40) NOT NULL,
endBairro varchar2(40),
endRua varchar2(40),
endNum number(5),
cep number(8) NOT NULL,
PRIMARY KEY (codigo));

CREATE TABLE contrato (
codigo number(6) NOT NULL,
dataVencimento date NOT NULL,
dataInicio date NOT NULL,
dataFinal date NOT NULL,
valorAluguel number(7,2) NOT NULL,
formaPagamento varchar2(40) NOT NULL,
avaliacao number(1,1) NOT NULL,
PRIMARY KEY (codigo, dataInicio, dataFinal));

CREATE TABLE telefoneCorretor (
cpfCorretor number(11),
numero number(12),
PRIMARY KEY (cpfCorretor, numero));

CREATE TABLE telefoneCliente (
cpfCliente number(11),
numero number(12),
PRIMARY KEY (cpfCliente, numero));

CREATE TABLE telefoneProprietario (
cpfProprietario number(11),
numero number(12),
PRIMARY KEY (cpfProprietario, numero));

CREATE TABLE agencia_bancariaCorretor (
banco varchar2(40) NOT NULL,
agenciaCorretor number(6) NOT NULL,
contaCorretor number(9) NOT NULL,
PRIMARY KEY(agenciaCorretor, contaCorretor));

CREATE TABLE agencia_bancariaProprietario (
banco varchar2(40) NOT NULL,
agenciaProprietario number(6) NOT NULL,
contaProprietario number(9) NOT NULL,
PRIMARY KEY(agenciaProprietario, contaProprietario));

CREATE TABLE CEP_CidadeCorretor (
cep number(8) NOT NULL,
cidade varchar2(40) NOT NULL,
PRIMARY KEY (cep));

CREATE TABLE CEP_CidadeCliente (
cep number(8) NOT NULL,
cidade varchar2(40) NOT NULL,
PRIMARY KEY (cep));

CREATE TABLE CEP_CidadeProprietario (
cep number(8) NOT NULL,
cidade varchar2(40) NOT NULL,
PRIMARY KEY (cep));

CREATE TABLE CEP_CidadeImovel (
cep number(8) NOT NULL,
cidade varchar2(40) NOT NULL,
PRIMARY KEY (cep));

CREATE TABLE gerencia (
codImovel number(6) NOT NULL,
cpfCorretor number(11) NOT NULL,
PRIMARY KEY (codImovel, cpfCorretor));

ALTER TABLE telefoneCorretor ADD CONSTRAINT FK_cpfCorretor FOREIGN KEY (cpfCorretor) references corretor(cpf);

ALTER TABLE telefoneCliente ADD CONSTRAINT FK_cpfCliente FOREIGN KEY (cpfCliente) references cliente(cpf);

ALTER TABLE telefoneProprietario ADD CONSTRAINT FK_cpfProprietario FOREIGN KEY (cpfProprietario) references proprietario(cpf);


ALTER TABLE corretor ADD CONSTRAINT FK_cidadeCorretor FOREIGN KEY(cep) REFERENCES CEP_CidadeCorretor(cep);

ALTER TABLE cliente ADD CONSTRAINT FK_cidadeCliente FOREIGN KEY(cep) REFERENCES CEP_CidadeCliente(cep);

ALTER TABLE proprietario ADD CONSTRAINT FK_cidadeProprietario FOREIGN KEY(cep) REFERENCES CEP_CidadeProprietario(cep);

ALTER TABLE imovel ADD CONSTRAINT FK_cidadeImovel FOREIGN KEY(cep) REFERENCES CEP_CidadeImovel(cep);


ALTER TABLE corretor ADD CONSTRAINT FK_agenciaCorretor FOREIGN KEY(agencia, conta) REFERENCES agencia_bancariaCorretor(agenciaCorretor, contaCorretor);

ALTER TABLE proprietario ADD CONSTRAINT FK_agenciaProprietario FOREIGN KEY(agencia, conta) REFERENCES agencia_bancariaProprietario(agenciaProprietario, contaProprietario);

ALTER TABLE imovel ADD cpfProprietario number(11) NOT NULL;
ALTER TABLE imovel ADD CONSTRAINT FK_cpfProprietarioImovel FOREIGN KEY(cpfProprietario) REFERENCES proprietario(cpf);

ALTER TABLE gerencia ADD CONSTRAINT FK_cpfCorretorGerencia
FOREIGN KEY(cpfCorretor) REFERENCES corretor(cpf);

ALTER TABLE gerencia ADD CONSTRAINT FK_codImovelGerencia
FOREIGN KEY(codImovel) REFERENCES imovel(codigo);

ALTER TABLE contrato ADD cpfCliente number(11) NOT NULL;
ALTER TABLE contrato ADD CONSTRAINT FK_cpfClienteContrato
FOREIGN KEY(cpfCliente) REFERENCES cliente(cpf);

ALTER TABLE contrato ADD cpfProprietario number(11) NOT NULL;
ALTER TABLE contrato ADD CONSTRAINT FK_cpfProprietarioContrato
FOREIGN KEY(cpfProprietario) REFERENCES proprietario(cpf);

ALTER TABLE contrato ADD cpfCorretor number(11) NOT NULL;
ALTER TABLE contrato ADD CONSTRAINT FK_cpfCorretorContrato
FOREIGN KEY(cpfCorretor) REFERENCES corretor(cpf);

ALTER TABLE contrato ADD codigoImovel number(6) NOT NULL;
ALTER TABLE contrato ADD CONSTRAINT FK_codigoImovelContrato
FOREIGN KEY(codigoImovel) REFERENCES imovel(codigo);

create or replace trigger AtualizaBonus
AFTER INSERT ON contrato 
FOR EACH ROW 
BEGIN 
UPDATE corretor SET corretor.salario = corretor.salario+corretor.salario*corretor.bonus WHERE corretor.cpf = :new.cpfCorretor;
END;

CREATE or replace trigger AtualizaAlugadoExclusao 
AFTER DELETE ON contrato
FOR EACH ROW 
BEGIN
UPDATE imovel SET imovel.alugado = 0 WHERE imovel.codigo = :old.codigoImovel;
END;

CREATE or replace trigger AtualizaAlugadoInsercao
AFTER INSERT ON contrato
FOR EACH ROW
BEGIN
UPDATE imovel SET imovel.alugado = 1 WHERE imovel.codigo = :new.codigoImovel;
END;

INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (17058943, 'Bauru');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (18524782, 'Sorocaba');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (17052987, 'Bauru');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (14036587, 'Campinas');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (19256846, 'São Paulo');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (15698532, 'São José dos Campos');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (17340000, 'Bauru');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (13026892, 'Marília');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (13968245, 'Marília');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (14259784, 'Campinas');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (12036987, 'Assis');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (17598643, 'Bauru');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (14985675, 'Campinas');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (11036987, 'Araraquara');
INSERT INTO CEP_CidadeCorretor (cep, cidade) VALUES (16235698, 'São Carlos');


INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (17024843, 'Bauru');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (14984567, 'Campinas');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (17890345, 'Bauru');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (13840237, 'Marília');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (17879654, 'Bauru');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (13459456, 'Marília');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (11450694, 'Araraquara');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (11395763, 'Araraquara');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (17834675, 'Bauru');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (17098987, 'Bauru');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (17462881, 'Bauru');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (17545533, 'Bauru');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (14299457, 'Campinas');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (13445674, 'Marília');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (14200989, 'Campinas');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (14237786, 'Campinas');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (11764434, 'Araraquara');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (14098887, 'Campinas');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (16733745, 'São Carlos');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (17598450, 'Bauru');
INSERT INTO CEP_CidadeCliente (cep, cidade) VALUES (11202009, 'Araraquara');


INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (17045986, 'Bauru');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (17598635, 'Bauru');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (14025998, 'Campinas');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (12058947, 'Assis');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (16859746, 'São Carlos');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (13789542, 'Marília');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (17598649, 'Bauru');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (14582658, 'Campinas');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (17025698, 'Bauru');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (17025689, 'Bauru');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (6985249, 'São Carlos');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (13698547, 'Marília');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (14203548, 'Campinas');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (6058749, 'São Carlos');
INSERT INTO CEP_CidadeProprietario (cep, cidade) VALUES (14256872, 'Campinas');

INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Santander', 698569,125669874);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Banco do Brasil', 236589, 236598745);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Caixa Econômica', 585452, 226684759);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Banco do Brasil', 566998, 574875965);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Banco do Brasil', 102301, 106895245);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Santander', 200125, 136588954);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Caixa Econômica', 569876, 256987459);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Santander', 256987, 202369241);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Banco do Brasil', 475892, 121415697);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Banco do Brasil', 236987, 111256698);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Santander', 879586, 458975697);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Santander', 236986, 455698997);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Banco do Brasil', 336985, 122336985);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Caixa Econômica', 656891, 575984625);
INSERT INTO agencia_bancariaCorretor ( banco, agenciaCorretor, contaCorretor) VALUES ('Caixa Econômica', 985687, 556698742);


INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Banco do Brasil', 233659, 122323651);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Caixa Econômica', 110023,332549789);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Santander', 256987,252624825);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Banco do Brasil', 596895,122336542);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Banco do Brasil', 585698,989596245);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Santander', 202123, 589562125);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Caixa Econômica', 114478,659521523);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Santander', 235874,579845254);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Banco do Brasil', 252648,745895623);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Caixa Econômica', 235985,215498568);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Santander', 121214,568748952);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Banco do Brasil', 471598,525889465);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Santander', 878952,325487952);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Banco do Brasil', 235689, 256896549);
INSERT INTO agencia_bancariaProprietario (banco, agenciaProprietario, contaProprietario) VALUES ('Caixa Econômica', 214785, 251659859);

 


INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (23569874521, 'Alice Ribeiro', 'F',  to_date('15-05-1988','dd/mm/yyyy'), 'aliceribeiro@gmail.com', to_date('17-08-2000','dd/mm/yyyy'), 2500.50, 0.2, 'Vila São Paulo', 'Fernando Figeiras', 178, 17058943, 698569, 125669874);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (35985628745, 'Alberto Neves', 'M', to_date('23-12-1992','dd/mm/yyyy'), 'albertonesves@hotmail.com', to_date('14-07-2018','dd/mm/yyyy'), 1590.20, 0, 'Vila Universitária', 'Cerejeiras', 245, 1852478, 236589, 236598745);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (45896859685, 'Camila Rodrigues', 'F', to_date('18-08-1977','dd/mm/yyyy'), 'camilarodrigues@gmail.com', to_date('28-07-2003','dd/mm/yyyy'), 3200.70, 0, 'Jardim Cerejeiras', 'Fabio Fernandes', 560, 17052987, 585452, 226684759);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (19989854888, 'Danilo Castro', 'M', to_date('20-09-1976','dd/mm/yyyy'), 'danilocastro@gmail.com', to_date('09-11-2000','dd/mm/yyyy'), 2900.50, 0, 'Jardim Figueiras', 'Getúlio Vargas', 267, 14036587, 566998, 574875965);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (25369857485, 'Eduarda Costa', 'F', to_date('19-09-1969','dd/mm/yyyy'), 'eduardacosta@gmail.com', to_date('17-04-1997','dd/mm/yyyy'), 3460.15, 0, 'Redentor', 'Dario Castro', 547, 19256846, 102301, 106895245);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (58695765212, 'Carlos Rodrigo', 'M', to_date('30-06-1972','dd/mm/yyyy'), 'carlosrodrigo@gmail.com', to_date('12-12-2001','dd/mm/yyyy'), 2580.10, 0, 'Vila Guedes', 'Nações Unidades', 140, 15698532, 200125, 136588954);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (25636985621, 'Flavia Vargas', 'F', to_date('07-07-1968','dd/mm/yyyy'), 'flaviavargas@gmail.com', to_date('03-12-2000','dd/mm/yyyy'), 3000.50, 0, 'Vila Medeiros', 'São José', 125, 17340000, 569876, 256987459);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (12332562102, 'Giovana Andrade', 'F', to_date('15-09-1982','dd/mm/yyyy'), 'giovanaandrade@gmail.com', to_date('18-06-1999','dd/mm/yyyy'), 3210.50, 0, 'Jardim Nações', 'Santo Antônio', 145, 1302689, 256987, 202369241);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (25698741256, 'Júlio Mesquita', 'M', to_date('22-02-1977','dd/mm/yyyy'), 'juliomesquita@gmail.com', to_date('14-06-2001','dd/mm/yyyy'), 2900.50, 0, 'Centro', 'Avenida Brasil', 255, 13968245, 475892, 121415697);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (25369874585, 'Helena Messias', 'F', to_date('30-10-1974','dd/mm/yyyy'), 'helenamessias@gmail.com', to_date('19-02-2002','dd/mm/yyyy'), 3520.50, 0, 'Cidade Nova Heliópolis', 'Quinte de Novembro', 144, 14259784, 236987, 111256698);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (12336987451, 'Sandro Souza', 'M', to_date('01-03-1969','dd/mm/yyyy'), 'sandrosouza@gmail.com', to_date('29-08-1998','dd/mm/yyyy'), 2900.70, 0, 'Jardim Brasil', 'Tiradentes', 269, 12036987, 879586, 458975697);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (25253535248, 'Silvana Pereira', 'F', to_date('18-11-1976','dd/mm/yyyy'), 'silvanapereira@gmail.com', to_date('21-02-2003','dd/mm/yyyy'), 2800.20, 0, 'Vila Lago Sul', 'Sete de Setembro', 555, 1759864, 236986, 455698997);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (23659588781, 'Ricardo Silva', 'M', to_date('11-11-1978','dd/mm/yyyy'), 'ricardosilva@gmail.com', to_date('04-07-1999','dd/mm/yyyy'), 2650.70, 0, 'Vila Natal', 'Amazonas', 999, 14985675, 336985, 122336985);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (25256666854, 'Vitória Bueno', 'F', to_date('13-12-1975','dd/mm/yyyy'), 'vitoriabueno@gmail.com', to_date('16-01-2000','dd/mm/yyyy'), 3010.90, 0, 'Centro', 'Bela Vista', 623, 11036987, 656891, 575984625);
INSERT INTO corretor (cpf, nome, sexo, dataNascimento, email,  dataContratacao, salario, bonus, endBairro, endRua, endNum, cep, agencia, conta) VALUES (47899484505, 'Marcelo Prado', 'M', to_date('25-04-1973','dd/mm/yyyy'), 'marceloprado@gmail.com', to_date('03-03-1998','dd/mm/yyyy'), 2560.10, 0, 'Jardim Caravelas', 'Santa Luzia', 745, 16235698, 985687, 556698742);


 
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (23569896571, 'André Pereira', 'M', to_date('14/08/1991', 'dd/mm/yyyy'), 'andrepereira@gmail.com', 'Jardim Nações', 'Getulio Vargas', 125, 17045986, 233659, 122323651);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (12365987452, 'Márcia Genis', 'F', to_date('02/08/1987', 'dd/mm/yyyy'), 'marciagenis@gmail.com', 'Vila Universitária', 'Rodigues Alves', 1407, 17598635, 110023, 332549789);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (12598795629, 'Bianca Freire', 'F', to_date('28/05/2000', 'dd/mm/yyyy'), 'biancafreire@gmail.com', 'Vila Natal', 'Rua Sete de Setembro', 458, 14025998, 256987, 252624825);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (25265489625, 'Daniel Silva', 'M', to_date('18/04/1998', 'dd/mm/yyyy'), 'danielsilva@gmail.com', 'Jardim Brasil', 'Fernandes Alberto', 578, 12058947, 596895, 122336542);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (56895742136, 'Lucas Lima', 'M', to_date('20/03/1985', 'dd/mm/yyyy'), 'lima@gmail.com', 'Jardim Caravelas', 'Avenida Nações', 587, 16859746, 585698, 989596245);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (58964753256, 'Lilian Andrade', 'F', to_date('07/03/1992', 'dd/mm/yyyy'), 'andrade@gmail.com', 'Centro', 'Rio Branco', 1545, 13789542, 202123, 589562125);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (58589620220, 'Julia Jean', 'F', to_date('10/05/1977', 'dd/mm/yyyy'), 'juliajenis@gmail.com', 'Vila Lago Sul', 'Tiradentes', 568, 17598649, 114478, 659521523);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (23569865252, 'Marcos Sousa', 'M', to_date('11/12/1994', 'dd/mm/yyyy'), 'marcossousa@gmail.com', 'Cidade Nova Heliópolis', 'Julio Mesquita', 458, 14582658, 235874, 579845254);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (58936512985, 'Bruno Silva', 'M', to_date('15/10/1995', 'dd/mm/yyyy'), 'brunosilva@hotmail.com', 'Vila São Paulo', 'Doze de Novembro', 587, 17025698, 252648, 745895623);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (25222314598, 'Pamela Castro', 'F', to_date('28/07/1988','dd/mm/yyyy'), 'pamelacastro@hotmail.com', 'Jardim Cerejeiras', 'Rio Doce', 1522, 17025689, 235985, 215498568);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (12230045987, 'Letícia Bueno', 'F', to_date('18/06/1992', 'dd/mm/yyyy’'), 'leticiabueno@hotmail.com', 'Jardim das Flores', 'Avenida Brasil', 259, 16985249, 121214, 568748952);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (11145879962, 'Raissa Assis', 'F', to_date('15/09/1987', 'dd/mm/yyyy'), 'assisraissa@hotmail.com', 'Vila Boa Vista', 'Nações Unidas', 147, 13698547, 471598, 525889465);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (33659874562, 'Clarisse Vieira', 'F', to_date('31/12/1999', 'dd/mm/yyyy'), 'clarissevieira@hotmail.com', 'Vila Pequi', 'Manaus', 541, 14203548, 878952, 325487952);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (24598199156, 'Paulo Mineiro', 'M', to_date('01/10/1989', 'dd/mm/yyyy'), 'paulomineiro@hotmail.com', 'Vila Bauru', 'Luana Beiramar', 1478, 16058749, 235689, 256896549);
INSERT INTO proprietario (cpf, nome, sexo, dataNascimento, email, endBairro, endRua, endNum, cep, agencia, conta) VALUES (14598568795, 'Olivia Silvani', 'F',to_date('14/02/2000', 'dd/mm/yyyy', 'oliviasilvani@gmail.com', 'Jardim Kiara', 'Alberto Alves', 574, 14256872, 214785, 251659859);
 
 

INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email,  estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (25495625236, 'Angelica Duarte', 'F', to_date('14/04/1998', 'dd/mm/yyyy'), 'angelicaduarte@gmail.com', 'Solteiro(a)', 2500.50, 'Enfermeira', to_date('06/05/2021', 'dd/mm/yyyy'), 'Jardim Brasil', 'Bahia', 514, 17024843);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (25968952012, 'Breno Figueiredo', 'M', to_date('04/06/1996', 'dd/mm/yyyy'), 'brunofigueiredo@gmail.com', 'Casado(a)', 5600.00, 'Engenheiro Elétrico', to_date('03/02/2020', 'dd/mm/yyyy'), 'Jardim São Paulo', 'Cerejeiras', 123, 14984567);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (58975984662, 'Juliano Assis', 'M', to_date('17/09/1988', 'dd/mm/yyyy'), 'julianoassis@gmail.com', 'Casado(a)', 4500.00, 'Professor', to_date('12/06/2020', 'dd/mm/yyyy'), 'Jardim Margarida', 'Antônio Alves', 4567, 17890345);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (69859841595, 'Aparecido Silva', 'M', to_date('05/10/1987', 'dd/mm/yyyy'), 'aparecidosilva@gmail.com', 'Viúvo(a)', 5780.90, 'Empresário', to_date('07/12/2019', 'dd/mm/yyyy'), 'Jardim Melancia', 'São Pedro', 456, 13840237);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (25689945985, 'Hugo Camargo', 'M', to_date('24/08/1986', 'dd/mm/yyyy'), 'hugocamargo@gmail.com', 'Solteiro(a)', 2300.50, 'Técnico em Eletrônica', to_date('31/01/2020', 'dd/mm/yyyy'), 'Jardim Dourado', 'Avenida Brasil', 456, 17879654);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (98595845154, 'Yasmin Marques', 'F', to_date('25/03/2021', 'dd/mm/yyyy'), 'yasminmarques@gmail.com', 'Casado(a)', 7680.00, 'Médica', to_date('04/07/2020', 'dd/mm/yyyy'), 'Nùcleo Jabuti', 'Américas', 674, 13459456);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (98584848484, 'Flavio Boa Vista', 'M', to_date('28/07/1998', 'dd/mm/yyyy'), 'favioboavista@gmail.com', 'Solteiro(a)', 3000.00, 'Enfermeiro', to_date('18/04/2020', 'dd/mm/yyyy'), 'Vila Abreu', 'Rio Branco', 870, 11450694);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (48884848498, 'Sabrina Maia', 'F', to_date('07/05/1991', 'dd/mm/yyyy'), 'sabrinamaia@gmail.com', 'Casado(a)', 3500.80, 'Dentista', to_date('02/06/2021', 'dd/mm/yyyy'), 'Vila Pantanal', 'Avenida Augustas', 265, 11395763);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (28945848959, 'Edgar Smith', 'M', to_date('25/09/1994', 'dd/mm/yyyy'), 'edgarsmith@gmail.com', 'Casado(a)', 4500.00, 'Engenheiro Civil', to_date('05/06/2019', 'dd/mm/yyyy'), 'Jardim Nelson', 'Sete de Outubro', 456, 17834675);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (52648484851, 'Claudia Pereira', 'F', to_date('07/05/1990', 'dd/mm/yyyy'), 'claudiapereira@gmail.com', 'Solteiro(a)', 4560.90, 'Escritora', to_date('12/12/2020', 'dd/mm/yyyy'), 'Vila industrial', 'Jaboticabal', 379, 17098987);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (59859595182, 'Thiago Raia', 'M', to_date('06/02/1978', 'dd/mm/yyyy'), 'thiagoraia@gmail.com', 'Casado(a)', 2500.00, 'Jornalista', to_date('26/05/2020', 'dd/mm/yyyy'), 'Jardim Venusta', 'Vargas Filho', 234, 17462881);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (84848484812, 'Nadia Malik', 'F', to_date('03/05/1992', 'dd/mm/yyyy'), 'nadiamalik@gmail.com', 'Solteiro(a)', 3400.00, 'Esteticista', to_date('04/07/2021', 'dd/mm/yyyy'), 'Núcleo Solange', 'Isaac Newton', 456, 17545533);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (98756484112, 'Cristiane Oliveira', 'F', to_date('20/07/1996', 'dd/mm/yyyy'), 'crisoliveira@gmail.com', 'Divorciado()', 3500.00, 'Pianista', to_date('31/07/2020', 'dd/mm/yyyy'), 'Jardim Angico', 'Flavio Ricardo', 345, 14299457);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (12484841654, 'Fernando Rodrigues', 'M', to_date('24/10/2000', 'dd/mm/yyyy'), 'fernandorodrigues@gmail.com', 'Solteiro(a)', 5500.00, 'Engenheiro Mecânico', to_date('23/07/2021', 'dd/mm/yyyy'), 'Jardim Ipê', 'Cataratas', 112, 13445674);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (12438523987, 'Aline Fernandes', 'F', to_date('11/10/1990', 'dd/mm/yyyy'), 'alinefernandes@gmail. com', 'Casado(a)', 2900.00, 'Professora de Dança', to_date('11/10/2019', 'dd/mm/yyyy'), 'Jardim São João', 'Rio Branco', 111, 14200989);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (23589742589, 'Vitor Aparecido', 'M', to_date('21/09/1988', 'dd/mm/yyyy'), 'vitoraparecido@gmail.com', 'Divorciado(a)', 3000.00, 'Motorista Particular', to_date('30/05/2019', 'dd/mm/yyyy'), 'Vila Bauru', 'Vania Maria', 1465, 14237786);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (41257569887, 'Fernanda Carvalho', 'F', to_date('21/03/1974', 'dd/mm/yyyy'), 'fercarvalho@gmail.com', 'Divorciado(a)', 2010.00, 'Pintora', to_date('19/03/2020', 'dd/mm/yyyy'), 'Vila Abreu', 'Dionísio Albuquerque', 320, 11764434);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (78632597258, 'Luana Santana', 'F', to_date('23/04/1991', 'dd/mm/yyyy'), 'luanasantana@gmail.com', 'Casado(a)', 2000.00, 'Secretária', to_date('08/06/2019', 'dd/mm/yyyy'), 'Vila Natal', 'Avenida João Ribeiro', 344, 14098887);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (25974259855, 'Victor Lacerda', 'M', to_date('14/12/1972', 'dd/mm/yyyy'), 'victorlacerda@gmail.com', 'Divorciado(a)', 2300.00, 'Personal Trainer', to_date('04/04/2021', 'dd/mm/yyyy'), 'Jardim Caravelas', 'Sete de Setembro', 776, 16733745);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (78942265223, 'Eliana Juarez', 'F', to_date('31/06/1977', 'dd/mm/yyyy'), 'elianajuarez@gmail.com', 'Divorciado(a)', 6800.00, 'Dermatologista', to_date('14/10/2020', 'dd/mm/yyyy'), 'Vila Industrial', 'Filgueiras', 145, 17598450);
INSERT INTO cliente (cpf, nome, sexo, dataNascimento, email, estadoCivil, salario, profissao, dataCadastro, endBairro, endRua, endNum, cep ) VALUES (25986957592, 'Luciana Nunes', 'F', to_date('21/07/2000', 'dd/mm/yyyy'), 'luciananunes@gmail.com', 'Solteiro(a)', 2450.00, 'Professora de Natação', to_date('30/07/2021', 'dd/mm/yyyy'), 'Jardim Bela Vista', 'Nuno de Assis', 909, 11202009);

INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (17987601, 'Bauru');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (13243548, 'Marília');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (14569876, 'Campinas');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (11057378, 'Araraquara');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (14905632, 'Campinas');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (17653294, 'Bauru');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (17453287, 'Bauru');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (17906589, 'Bauru');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (14296734, 'Campinas');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (11835629, 'Araraquara');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (11783462, 'Araraquara');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (11907651, 'Araraquara');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (13094782, 'Marília');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (11563207, 'Araraquara');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (13209387, 'Marília');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (14034719, 'Campinas');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (17927471, 'Bauru');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (17390176, 'Bauru');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (11924781, 'Araraquara');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (13622211, 'Marília');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (13096677, 'Marília');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (17854422, 'Bauru');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (17885433, 'Bauru');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (11099954, 'Araraquara');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (17893350, 'Bauru');
INSERT INTO CEP_CidadeImovel (cep, cidade) VALUES (11787741, 'Araraquara');

INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum,  cep, cpfProprietario) VALUES (1, 53.34, 0, 'Kitnet', 'Vila Industrial', 'Cerejeiras', 123, 17987601, 23569896571);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (2, 100.40, 1, 'Casa', 'Jardim Ipê', 'Pedro Pêra', 456, 13243548, 23569896571);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (3, 87.60, 0, 'Apartamento', 'Jardim Angico', 'Manuel Silva', 098, 14569876, 12365987452);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (4, 67.54, 0, 'Apartamento', 'Vila Pequi', 'Francisco Antunes', 649, 11057378, 12598795629);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (5, 98.70, 0, 'Casa', 'Jardim São João', 'Pau Brasil', 657, 14905632, 12598795629);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro , endRua,  endNum, cep, cpfProprietario) VALUES (6, 76.34, 1, 'Apartamento', 'Núcleo Solange','Aparecida de Jesus', 342, 17653294, 12598795629);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (7, 53.97, 1, 'Edícula', 'Jardim Kiara', 'Onofre Castro', 435, 'Residencial Pitanga', 17453287,  25265489625);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (8, 74.29, 0, 'Casa', 'Jardim Venusta', 'Tangarás', 529,17906589, 25265489625);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (9, 82.32, 0, 'Casa', 'Vila Bauru', 'Alves da Silva', 312, 14296734, 56895742136);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (10, 61.12, 1, 'Kitnet', 'Jardim das Flores', 'Maria Silva', 511, 11835629, 56895742136);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (11, 91.34, 1, 'Casa', 'Vila Abreu', 'Manaus', 312, 11783462, 58964753256);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (12, 54.12, 0, 'Apartamento', 'Vila Boa Vista','Cuiabá', 213, 11907651, 58589620220);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (13, 81.36, 0, 'Casa', 'Jardim Brachiaria', 'Gramado',216, 13094782, 23569865252);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (14, 100.65, 0, 'Casa', 'Vila Andrade', 'Vinicius deMoraes', 515, 11563207, 58936512985);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (15, 71.89, 1, 'Apartamento', 'Núcleo Jabuti','Amora', 813, 13209387, 58936512985);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (16, 65.89, 0, 'Kitnet', 'Vila dos Abacates', 'João Bonfim', 678, 14034719, 25222314598);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (17, 74.90, 0, 'Edícula', 'Jardim Dourado', 'Osmar Santos', 451, 17927471, 12230045987);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (18, 66.80, 0, 'Casa', 'Jardim Cerrado', 'Ricardo Sanchez', 112, 17390176, 11145879962);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (19, 87.66, 0, 'Edícula', 'Vila Pantanal', 'Limoeiro', 996, 11924781, 33659874562);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (20, 77.98, 0, 'Kitnet', 'Vila Sapateiro', 'Acerola', 223,13622211, 24598199156);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (21, 61.22, 1, 'Casa', 'Jardim Melancia', 'Neusa Silva', 445, 13096677, 24598199156);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (22, 79.12, 0, 'Edícula', 'Vila Redentor', 'Mesquita Vargas', 886, 17854422, 14598568795);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (23, 67.02, 1, 'Kitnet', 'Jardim Nelson', 'Roberto Carlos', 435, 17885433, 11145879962);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (24, 99.67, 0, 'Apartamento', 'Vila Salgueiro','Mamutes', 768, 11099954, 58964753256);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (25, 61.80, 1, 'Edícula', 'Jardim Margarida', 'Helena Frederica', 331, 17893350, 12365987452);
INSERT INTO imovel (codigo, tamanho, alugado, tipo, endBairro, endRua,  endNum, cep, cpfProprietario) VALUES (26, 79.56, 0, 'Kitnet', 'Vila Madalena', 'Alecrim', 229, 11787741, 12365987452);


INSERT INTO contrato (codigo, dataVencimento, dataInicio, dataFinal, valorAluguel,  formaPagamento,avaliacao, cpfCliente, cpfProprietario, cpfCorretor, codigoImovel) VALUES (1, to_date('12/09/2020', 'dd/mm/yyyy'), to_date('12/08/2020', 'dd/mm/yyyy'), to_date('12/08/2021', 'dd/mm/yyyy'), 1300.00, 'Débito em Conta', 4.8, 69859841595, 23569896571 , 23569874521 , 2);
INSERT INTO contrato (codigo, dataVencimento, dataInicio, dataFinal, valorAluguel,  formaPagamento,avaliacao, cpfCliente, cpfProprietario, cpfCorretor, codigoImovel) VALUES (2, to_date('10/10/2020', 'dd/mm/yyyy'), to_date('10/09/2020', 'dd/mm/yyyy'), to_date('10/09/2021', 'dd/mm/yyyy'), 1000.00, 'Boleto Bancário', 5.0, 25689945985, 12598795629 , 19989854888 , 6);
INSERT INTO contrato (codigo, dataVencimento, dataInicio, dataFinal, valorAluguel,  formaPagamento,avaliacao, cpfCliente, cpfProprietario, cpfCorretor, codigoImovel) VALUES (3, to_date('20/04/2021', 'dd/mm/yyyy'), to_date('20/03/2021', 'dd/mm/yyyy'), to_date('20/03/2022', 'dd/mm/yyyy'), 1200.00, 'Boleto Bancário', 5, 98595845154, 25265489625, 25369857485, 7);
INSERT INTO contrato (codigo, dataVencimento, dataInicio, dataFinal, valorAluguel,  formaPagamento,avaliacao, cpfCliente, cpfProprietario, cpfCorretor, codigoImovel) VALUES (4, to_date('15/06/2020', 'dd/mm/yyyy'), to_date('15/05/2020', 'dd/mm/yyyy'), to_date('15/05/2021', 'dd/mm/yyyy'), 950.00, 'Boleto Bancário', 4.9, 98584848484, 56895742136, 25636985621, 10);
INSERT INTO contrato (codigo, dataVencimento, dataInicio, dataFinal, valorAluguel,  formaPagamento,avaliacao, cpfCliente, cpfProprietario, cpfCorretor, codigoImovel) VALUES (5, to_date('20/08/2021', 'dd/mm/yyyy'), to_date('30/07/2021', 'dd/mm/yyyy'), to_date('30/07/2022', 'dd/mm/yyyy'), 1100.00, 'Débito em Conta', 5, 48884848498, 58964753256, 12332562102 , 11);
INSERT INTO contrato (codigo, dataVencimento, dataInicio, dataFinal, valorAluguel,  formaPagamento,avaliacao, cpfCliente, cpfProprietario, cpfCorretor, codigoImovel) VALUES (6, to_date('10/02/2021', 'dd/mm/yyyy'), to_date('10/01/2021', 'dd/mm/yyyy'), to_date('10/01/2022', 'dd/mm/yyyy'), 1050.00, 'Débito em Conta', 4.8, 28945848959, 58936512985, 12336987451 , 15);
INSERT INTO contrato (codigo, dataVencimento, dataInicio, dataFinal, valorAluguel,  formaPagamento,avaliacao, cpfCliente, cpfProprietario, cpfCorretor, codigoImovel) VALUES (7, to_date('15/10/2020', 'dd/mm/yyyy'), to_date('15/09/2020', 'dd/mm/yyyy'), to_date('15/09/2021', 'dd/mm/yyyy'), 850.00, 'Cartão de Crédito', 4.7, 52648484851, 24598199156, 47899484505, 21);
INSERT INTO contrato (codigo, dataVencimento, dataInicio, dataFinal, valorAluguel,  formaPagamento,avaliacao, cpfCliente, cpfProprietario, cpfCorretor, codigoImovel) VALUES (8, to_date('05/12/2020', 'dd/mm/yyyy'), to_date('05/11/2020', 'dd/mm/yyyy'), to_date('05/11/2021', 'dd/mm/yyyy'), 1250.00, 'Débito em Conta', 5, 59859595182, 11145879962, 35985628745, 23);
INSERT INTO contrato (codigo, dataVencimento, dataInicio, dataFinal, valorAluguel,  formaPagamento,avaliacao, cpfCliente, cpfProprietario, cpfCorretor, codigoImovel) VALUES (9, to_date('15/03/2021', 'dd/mm/yyyy'), to_date('15/02/2021', 'dd/mm/yyyy'), to_date('15/02/2022', 'dd/mm/yyyy'), 1000.00, 'Cartão de Crédito', 5, 84848484812, 12365987452, 58695765212, 25);


INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (11995869523, 23569874521);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (14994562176, 35985628745);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (11986543891, 35985628745);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (12974432178, 45896859685);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (17976554098, 19989854888);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (14988762344, 25369857485);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (16987223571, 25369857485);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (14901763398, 58695765212);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (13965422349, 25636985621);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (14944398765, 25636985621);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (14933176554, 25636985621);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (15933581704, 12332562102);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (14964311298, 12332562102);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (12981763646, 25698741256);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (13983716382, 25369874585);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (14910988456, 12336987451);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (11901223781, 25253535248);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (11955468765, 25253535248);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (12976481234, 23659588781);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (12965330981, 23659588781);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (14912245339, 25256666854);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (14974833650, 25256666854);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (15917367701, 47899484505);
INSERT INTO telefoneCorretor (numero, cpfCorretor) VALUES (16963920191, 47899484505);
 

 
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (14982762847, 23569896571);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (13983716526, 23569896571);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (11973716653, 12365987452);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (14981777642, 12598795629);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (14983321872, 12598795629);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (14955628172, 12598795629);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (16937725661, 25265489625);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (15937771839, 25265489625);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (15918273177, 56895742136);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (14920192817, 58964753256);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (14933182091, 58589620220);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (16944320192, 58589620220);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (14926726333, 23569865252);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (15973610293, 23569865252);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (13955401827, 58936512985);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (15900341562, 25222314598);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (14991726172, 12230045987);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (16981724531, 11145879962);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (11944511009, 11145879962);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (14965675190, 33659874562);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (11992837445, 33659874562);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (12944110287, 24598199156);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (14938277611, 24598199156);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (13954661249, 14598568795);
INSERT INTO telefoneProprietario (numero,cpfProprietario) VALUES (12991836718, 14598568795);
 

 
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (14937462913, 25495625236);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (12946773819, 25495625236);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (13937712243, 25968952012);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (12993234736, 25968952012);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (14991768371, 25968952012);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (11900233765, 58975984662);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (12937765102, 69859841595);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (14955412321, 69859841595);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (14928234671, 25689945985);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (11991663451, 25689945985);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (12912238716, 98595845154);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (13981726354, 98584848484);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (16910293847, 48884848498);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (14965473829, 28945848959);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (11912314263, 28945848959);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (11938471839, 28945848959);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (16987367192, 52648484851);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (15982736455, 52648484851);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (12936519384, 59859595182);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (16967501823, 84848484812);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (14943769183, 84848484812);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (14933997361, 98756484112);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (15944529384, 98756484112);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (12982221923, 98756484112);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (14906519283, 12484841654);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (17937162536, 12484841654);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (16967541028, 12438523987);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (15971540391, 12438523987);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (14992846573, 23589742589);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (14981726453, 23589742589);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (13992346752, 41257569887);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (12937615534, 78632597258);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (16937465512, 78632597258);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (15955466381, 25986957592);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (15937163562, 25974259855);
INSERT INTO telefoneCliente (numero, cpfCliente) VALUES (15938765563, 78942265223);

INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (23569874521, 1);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (23569874521, 2);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (35985628745, 3);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (45896859685, 4);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (45896859685, 5);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (19989854888, 6);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (25369857485, 7);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (25369857485, 8);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (58695765212, 9);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (25636985621, 10);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (12332562102, 11);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (12332562102, 12);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (25698741256, 13);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (25369874585, 14);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (12336987451, 15);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (25253535248, 16);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (23659588781, 17);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (23659588781, 18);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (25256666854, 19);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (25256666854, 20);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (47899484505, 21);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (25636985621, 22);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (35985628745, 23);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (58695765212, 24);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (58695765212, 25);
INSERT INTO gerencia (cpfCorretor, codImovel) VALUES (47899484505, 26);
