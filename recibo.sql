create database recibo_salarial;
use recibo_salarial;
create table empresa
(
	CNPJ bigint unsigned not null,
    nome_empresa varchar(50) not null,
    endereco varchar(50) not null,
    data_abertura date not null,
    primary key(CNPJ)
);
create table recibo
(
	ID_recibo int unsigned not null auto_increment,
    valor_total decimal not null default '0',
    data_recibo date not null,
    banco varchar(20) not null,
    CNPJ_empresa bigint unsigned not null,
    primary key (ID_recibo),
    constraint fk_CNPJ_empresa foreign key (CNPJ_empresa) references empresa(CNPJ)
);
create table descontos
(
	ID_descontos int unsigned not null auto_increment,
    INSS decimal (10) not null,
    IRRF decimal (10) not null,
    contrato_sindical decimal (10) not null,
    assistencia_medica decimal(10)not null,
    vale_refeicao decimal (10) not null,
    primary key (ID_descontos)
);
create table recibo_descontos
(
	ID_recibo int unsigned not null,
    ID_descontos int unsigned not null,
    constraint fk_ID_recibo_descontos foreign key (ID_recibo) references recibo(ID_recibo),
    constraint fk_ID_descontos foreign key (ID_descontos) references descontos(ID_descontos)
);
create table vencimentos
(
	ID_vencimentos int unsigned not null auto_increment,
    hora_extra decimal(10) not null,
    adicional_noturno decimal(10) not null,
    salario decimal(10) not null default '0',
    primary key(ID_vencimentos)
);
create table rebibo_vencimentos
(
	ID_vencimentos int unsigned not null auto_increment,
    ID_recibo int unsigned not null,
    constraint fk_ID_vencimentos foreign key(ID_vencimentos) references vencimentos(ID_vencimentos),
    constraint fk_ID_recibo_vencimento foreign key(ID_recibo) references recibo(ID_recibo)
);
create table funcionarios
(
	matricula int unsigned not null,
    tel_funcionario bigint not null,
    nome_funcionario varchar(50) not null,
    cargo varchar(30) not null,
    data_admissao date not null,
    primary key (matricula)
);
create table recibo_funcionario
(
	matricula int unsigned not null,
    ID_recibo int unsigned not null auto_increment,
    constraint fk_ID_matricula foreign key(matricula) references funcionarios(matricula),
    constraint fk_ID_recibo_funcionario foreign key(ID_recibo) references recibo(ID_recibo)
);
