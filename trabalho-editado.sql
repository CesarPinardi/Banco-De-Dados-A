Alunos: Num_curso, RA, Nome, Data_nasc
Disciplinas: Cod, Nome, Cred
Cursos: Num, Nome

--cd é a média do aluno

create table alunos(ra number(4), nome_aluno varchar2(20), num_curso number, data_nasc date);
create table disciplinas (nome_disc varchar2(30), cod_disc number, cred number);
create table cursos (nome_curso varchar2(30), num_curso number);

create table alunos_grad (ra_g number(4),cd number(2,2), ); 
create table alunos_pos_grad (ra_p_g number(4), orientador varchar2(20)); 

alter table alunos add constraint pk_ra_aluno primary key (ra);
alter table disciplinas add constraint pk_cod_disc primary key (cod_disc);
alter table cursos add constraint pk_num_curso primary key (num_curso);

alter table alunos_grad add constraint fk_grad_aluno foreign key (ra_g) references alunos;
alter table alunos_pos_grad add constraint fk_pos_grad_aluno foreign key (ra_p_g) references alunos;

--relacionamentos

create table cursam (ra_cursam number(4), cod_disc_cursam number, freq number);
create table cursaram (ra_cursaram number(4), cod_disc_cursaram number, sem_ano date, nota number(2,2), freq number, status varchar2(1)); 
create table pre_req (cod_disc_pre number, cod_pre_req number);
create table grade (cod_disc_grade number, num_curso_grade number);

--sem_ano é chave primaria de cursaram
alter table cursaram add constraint pk_sem_cursaram primary key (sem_ano);

--cod_pre_req é chave primaria de pre requisito
alter table pre_req add constraint pk_pre_req primary key (cod_pre_req);

--adicionando chaves estrangeiras dos relacionamentos
alter table cursam add constraint fk_ra_cursam foreign key (ra) references alunos;
alter table cursam add constraint fK_cod_disc_cursam foreign key (cod_disc) references disciplinas;

alter table cursaram add constraint fk_ra_cursaram foreign key (ra) references alunos;
alter table cursaram add constraint fK_cod_disc_cursaram foreign key (cod_disc) references disciplinas;

alter table pre_req add constraint fK_cod_disc_pre foreign key (cod_disc) references disciplinas;

alter table grade add constraint fK_cod_disc_grade foreign key (cod_disc) references disciplinas;
alter table grade add constraint fk_num_curso_grade foreign key (num_curso) references cursos;

--30 alunos graduação
insert into alunos values(1000,'Alfa',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1001,'Beta',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1002,'Charlie',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1003,'Delta',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1004,'Echo',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1005,'Foxtrot',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1006,'Golf',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1007,'Hotel',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1008,'India',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1009,'Juliet',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1010,'Kilo',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1011,'Lima',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1012,'Mike',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1013,'November',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1014,'Oscar',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1015,'Papa',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1016,'Quebec',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1017,'Romeo',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1018,'Sierra',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1019,'Tango',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1020,'Uniform',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1021,'Victor',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1022,'Whiskey',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1023,'Xray',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1024,'Yankee',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1025,'Zulu',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1026,'Wojtek',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1027,'Artyom',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(1028,'Boris',10,to_date('12/06/1998','dd/mm/yyyy'));


insert into alunos_grad values(1000,7.5);
insert into alunos_grad values(1001,4.2);
insert into alunos_grad values(1002,2.3);
insert into alunos_grad values(1003,7.8);
insert into alunos_grad values(1004,8.9);
insert into alunos_grad values(1005,1.2);
insert into alunos_grad values(1006,3.3);
insert into alunos_grad values(1007,4.5);
insert into alunos_grad values(1008,7.6);
insert into alunos_grad values(1009,5.6);
insert into alunos_grad values(1010,2.3);
insert into alunos_grad values(1011,9.8);
insert into alunos_grad values(1012,9.7);
insert into alunos_grad values(1013,1.1);
insert into alunos_grad values(1014,3.3);
insert into alunos_grad values(1015,4.3);
insert into alunos_grad values(1016,5.4);
insert into alunos_grad values(1017,6.5);
insert into alunos_grad values(1018,6.6);
insert into alunos_grad values(1019,7.1);
insert into alunos_grad values(1020,8.3);
insert into alunos_grad values(1021,4.3);
insert into alunos_grad values(1022,4.9);
insert into alunos_grad values(1023,0.1);
insert into alunos_grad values(1024,0.9);
insert into alunos_grad values(1025,7.0);
insert into alunos_grad values(1026,5.0);
insert into alunos_grad values(1027,4.0);
insert into alunos_grad values(1028,10);


--10 alunos pós graduação
insert into alunos values(2000,'Hanzo',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(2001,'Genji',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(2002,'Junkrat',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(2003,'Winston',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(2004,'Zarya',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(2005,'Mercy',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(2006,'Roadhog',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(2007,'Reinhardt',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(2008,'Zenyatta',10,to_date('12/06/1998','dd/mm/yyyy'));
insert into alunos values(2009,'Tracer',10,to_date('12/06/1998','dd/mm/yyyy'));

insert into alunos_pos_grad values(2000,'Jayce');
insert into alunos_pos_grad values(2001,'Elise');
insert into alunos_pos_grad values(2002,'Zoe');
insert into alunos_pos_grad values(2003,'Braum');
insert into alunos_pos_grad values(2004,'Sylas');
insert into alunos_pos_grad values(2005,'Ezreal');
insert into alunos_pos_grad values(2006,'Pyke');
insert into alunos_pos_grad values(2007,'Syndra');
insert into alunos_pos_grad values(2008,'Varus');
insert into alunos_pos_grad values(2009,'Teemo');

--30 disciplinas
--create table disciplinas (nome_disc varchar2(30), cod_disc number, cred number);

insert into disciplinas values ('ALGORÍTMOS E PROGRAMAÇÃO DE COMPUTADORES A', 0001, 04);
insert into disciplinas values ('ALGORÍTMOS E PROGRAMAÇÃO DE COMPUTADORES B', 0002, 046;
insert into disciplinas values ('ANTROPOLOGIA TEOLÓGICA A', 0003, 02);
insert into disciplinas values ('ANTROPOLOGIA TEOLÓGICA B', 0004, 02);
insert into disciplinas values ('ANTROPOLOGIA TEOLÓGICA C', 0005, 02);
insert into disciplinas values ('ANÁLISE DE ALGORITMOS E TEORIA DOS GRAFOS', 0006, 02);
insert into disciplinas values ('ANÁLISE DE SISTEMAS', 0007, 04);
insert into disciplinas values ('ARQUITETURA DE COMPUTADORES', 0008, 06);
insert into disciplinas values ('BANCO DE DADOS', 0009, 06);
insert into disciplinas values ('CIRCUITOS ELÉTRICOS E ELETRÔNICA BÁSICA', 0010, 04);
insert into disciplinas values ('CIRCUITOS LÓGICOS', 0011, 06);
insert into disciplinas values ('CIÊNCIA DO AMBIENTE', 0012, 02);
insert into disciplinas values ('CONSTRUÇÃO DE COMPILADORES', 0013, 04);
insert into disciplinas values ('CÁLCULO DIFERENCIAL E INTEGRAL A', 0014, 04);
insert into disciplinas values ('CÁLCULO DIFERENCIAL E INTEGRAL B', 0015, 04);
insert into disciplinas values ('CÁLCULO DIFERENCIAL E INTEGRAL C', 0016, 04);
insert into disciplinas values ('CÁLCULO DIFERENCIAL E INTEGRAL D', 0017, 04);
insert into disciplinas values ('DESENHO TÉCNICO', 0018, 02);
insert into disciplinas values ('EDUCAÇÃO EM DIREITOS HUMANOS E IDENTIDADE CULTURAL', 0019, 02);
insert into disciplinas values ('EMPREENDIMENTOS EM INFORMÁTICA A', 0020, 02);
insert into disciplinas values ('ENGENHARIA DE SOFTWARE A', 0021, 04);
insert into disciplinas values ('ESTRUTURA E RECUPERAÇÃO DE DADOS A', 0022, 04);
insert into disciplinas values ('ESTRUTURA E RECUPERAÇÃO DE DADOS B', 0023, 04);
insert into disciplinas values ('FÍSICA GERAL A', 0024, 04);
insert into disciplinas values ('FÍSICA GERAL B', 0025, 04);
insert into disciplinas values ('FÍSICA GERAL C', 0026, 04);
insert into disciplinas values ('LABORATÓRIO DE FÍSICA A', 0027, 02);
insert into disciplinas values ('LABORATÓRIO DE FÍSICA B', 0028, 02);
insert into disciplinas values ('PARADIGMAS DE PROGRAMAÇÃO A', 0029, 04);
insert into disciplinas values ('PARADIGMAS DE PROGRAMAÇÃO B', 0030, 04);
    