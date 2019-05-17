--Alunos: Num_curso, RA, Nome, Data_nasc
--Disciplinas: Cod, Nome, Cred
--Cursos: Num, Nome

--drop tables

drop table cursam;
drop table cursaram;
drop table pre_req;
drop table grade;

drop table alunos_grad;
drop table alunos_pos_grad;
drop table cursos;
drop table disciplinas;
drop table alunos;

--cd é a média do aluno

create table alunos(ra number(4), nome_aluno varchar2(20), num_curso number, data_nasc date);
create table disciplinas (nome_disc varchar2(75), cod_disc number, cred number);
create table cursos (nome_curso varchar2(75), num_curso number);

create table alunos_grad (ra_g number(4),cd number(3,1)); 
create table alunos_pos_grad (ra_p_g number(4), orientador varchar2(20)); 

alter table alunos add constraint pk_ra_aluno primary key (ra);
alter table disciplinas add constraint pk_cod_disc primary key (cod_disc);
alter table cursos add constraint pk_num_curso primary key (num_curso);

alter table alunos_grad add constraint fk_grad_aluno foreign key (ra_g) references alunos;
alter table alunos_pos_grad add constraint fk_pos_grad_aluno foreign key (ra_p_g) references alunos;

--relacionamentos

create table cursam (ra_cursam number(4), cod_disc_cursam number, freq number);
create table cursaram (ra_cursaram number(4), cod_disc_cursaram number, sem_ano date, nota number(3,1), freq number, status varchar2(1)); 
create table pre_req (cod_disc_pre number, cod_pre_req number);
create table grade (cod_disc_grade number, num_curso_grade number);

--sem_ano é chave primaria de cursaram
alter table cursaram add constraint pk_sem_cursaram primary key (sem_ano);

--cod_pre_req é chave primaria de pre requisito
alter table pre_req add constraint pk_pre_req primary key (cod_pre_req);

--adicionando chaves estrangeiras dos relacionamentos
alter table cursam add constraint fk_ra_cursam foreign key (ra_cursam) references alunos;
alter table cursam add constraint fK_cod_disc_cursam foreign key (cod_disc_cursam) references disciplinas;

alter table cursaram add constraint fk_ra_cursaram foreign key (ra_cursaram) references alunos;
alter table cursaram add constraint fK_cod_disc_cursaram foreign key (cod_disc_cursaram) references disciplinas;

alter table pre_req add constraint fK_cod_disc_pre foreign key (cod_disc_pre) references disciplinas;

alter table grade add constraint fK_cod_disc_grade foreign key (cod_disc_grade) references disciplinas;
alter table grade add constraint fk_num_curso_grade foreign key (num_curso_grade) references cursos;

--30 alunos graduação
insert into alunos values(1000,'Alfa',10,to_date('12/08/1998','dd/mm/yyyy'));
insert into alunos values(1001,'Beta',10,to_date('21/09/1998','dd/mm/yyyy'));
insert into alunos values(1002,'Charlie',20,to_date('11/06/1998','dd/mm/yyyy'));
insert into alunos values(1003,'Delta',30,to_date('15/10/1998','dd/mm/yyyy'));
insert into alunos values(1004,'Echo',40,to_date('17/12/1998','dd/mm/yyyy'));
insert into alunos values(1005,'Foxtrot',40,to_date('19/11/1998','dd/mm/yyyy'));
insert into alunos values(1006,'Golf',40,to_date('10/02/1998','dd/mm/yyyy'));
insert into alunos values(1007,'Hotel',40,to_date('22/02/1998','dd/mm/yyyy'));
insert into alunos values(1008,'India',30,to_date('29/03/1998','dd/mm/yyyy'));
insert into alunos values(1009,'Juliet',20,to_date('11/04/1998','dd/mm/yyyy'));
insert into alunos values(1010,'Kilo',10,to_date('01/05/1998','dd/mm/yyyy'));
insert into alunos values(1011,'Lima',20,to_date('02/07/1998','dd/mm/yyyy'));
insert into alunos values(1012,'Mike',20,to_date('06/06/1998','dd/mm/yyyy'));
insert into alunos values(1013,'November',20,to_date('09/01/1998','dd/mm/yyyy'));
insert into alunos values(1014,'Oscar',30,to_date('10/01/1998','dd/mm/yyyy'));
insert into alunos values(1015,'Papa',40,to_date('04/03/1998','dd/mm/yyyy'));
insert into alunos values(1016,'Quebec',30,to_date('06/04/1998','dd/mm/yyyy'));
insert into alunos values(1017,'Romeo',20,to_date('11/05/1998','dd/mm/yyyy'));
insert into alunos values(1018,'Sierra',10,to_date('10/09/1998','dd/mm/yyyy'));
insert into alunos values(1019,'Tango',20,to_date('11/11/1998','dd/mm/yyyy'));
insert into alunos values(1020,'Uniform',40,to_date('02/12/1998','dd/mm/yyyy'));
insert into alunos values(1021,'Victor',40,to_date('04/07/1998','dd/mm/yyyy'));
insert into alunos values(1022,'Whiskey',20,to_date('08/04/1998','dd/mm/yyyy'));
insert into alunos values(1023,'Xray',20,to_date('09/03/1998','dd/mm/yyyy'));
insert into alunos values(1024,'Yankee',30,to_date('10/02/1998','dd/mm/yyyy'));
insert into alunos values(1025,'Zulu',30,to_date('11/06/1998','dd/mm/yyyy'));
insert into alunos values(1026,'Wojtek',30,to_date('10/01/1998','dd/mm/yyyy'));
insert into alunos values(1027,'Artyom',20,to_date('14/08/1998','dd/mm/yyyy'));
insert into alunos values(1028,'Boris',20,to_date('19/09/1998','dd/mm/yyyy'));

--select * from alunos where cd is 7.5;

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
insert into alunos_grad values(1028,10.0);


--10 alunos pós graduação
insert into alunos values(2000,'Hanzo',10,to_date('11/06/1998','dd/mm/yyyy'));
insert into alunos values(2001,'Genji',10,to_date('11/07/1998','dd/mm/yyyy'));
insert into alunos values(2002,'Junkrat',20,to_date('05/09/1998','dd/mm/yyyy'));
insert into alunos values(2003,'Winston',20,to_date('08/11/1998','dd/mm/yyyy'));
insert into alunos values(2004,'Zarya',30,to_date('18/01/1998','dd/mm/yyyy'));
insert into alunos values(2005,'Mercy',30,to_date('19/02/1998','dd/mm/yyyy'));
insert into alunos values(2006,'Roadhog',40,to_date('21/04/1998','dd/mm/yyyy'));
insert into alunos values(2007,'Reinhardt',40,to_date('29/09/1998','dd/mm/yyyy'));
insert into alunos values(2008,'Zenyatta',20,to_date('21/10/1998','dd/mm/yyyy'));
insert into alunos values(2009,'Tracer',10,to_date('03/12/1998','dd/mm/yyyy'));

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

--disciplinas Eng
insert into disciplinas values ('ALGORÍTMOS E PROGRAMAÇÃO DE COMPUTADORES A', 0001, 04);
insert into disciplinas values ('ALGORÍTMOS E PROGRAMAÇÃO DE COMPUTADORES B', 0002, 04);
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
--20 Disciplinas ADM
insert into disciplinas values ('FILOSOFIA', 0031, 04);
insert into disciplinas values ('ORGANIZAÇÃO, ESTRUTURAS E SISTEMAS DE GESTÃO', 0032, 02);
insert into disciplinas values ('MATEMÁTICA APLICADA', 0033, 06);
insert into disciplinas values ('ADMINISTRAÇÃO DE INFORMAÇÕES GERENCIAIS', 0034, 06);
insert into disciplinas values ('ESTATÍSTICA ECONÔMICA', 0035, 06);
insert into disciplinas values ('INTRODUÇÃO À TEORIA MICROECONÔMICA', 0036, 06);
insert into disciplinas values ('CONTABILIDADE GERAL', 0037, 04);
insert into disciplinas values ('ADMINISTRAÇÃO FINANCEIRA', 0038, 04);
insert into disciplinas values ('ÉTICA E RESPONSABILIDADE SOCIAL NAS EMPRESAS', 0039, 04);
insert into disciplinas values ('ADMINISTRAÇÃO DA PRODUÇÃO I', 0040, 06);
insert into disciplinas values ('ADMINISTRAÇÃO DA PRODUÇÃO II', 0041, 06);
insert into disciplinas values ('GERENCIAMENTO DE CUSTOS', 0042, 06);
insert into disciplinas values ('GERENCIAMENTO TRIBUTÁRIO', 0043, 06);
insert into disciplinas values ('MARKETING ESTRATÉGICO', 0044, 04);
insert into disciplinas values ('GESTÃO DO COMPOSTO DE MARKETING', 0045, 04);
insert into disciplinas values ('GESTÃO DO RELACIONAMENTO COM O CLIENTE', 0046, 04);
insert into disciplinas values ('ADMINISTRAÇÃO DE VENDAS', 0047, 04);
insert into disciplinas values ('ADMINISTRAÇÃO DA CADEIA DE SUPRIMENTOS', 0048, 04);
insert into disciplinas values ('INTELIGÊNCIA COMPETITIVA', 0049, 04);
insert into disciplinas values ('GERENCIAMENTO DE PROJETOS', 0050, 04);

--20 Disciplinas Med
insert into disciplinas values ('FISIOLOGIA I', 0051, 06);
insert into disciplinas values ('FISIOLOGIA II', 0052, 06);
insert into disciplinas values ('BIOQUÍMICA A', 0053, 06);
insert into disciplinas values ('BIOQUÍMICA B', 0054, 06);
insert into disciplinas values ('ANATOMIA A', 0055, 06);
insert into disciplinas values ('ANATOMIA B', 0056, 06);
insert into disciplinas values ('CORRELAÇÃO CLÍNICA: PSIQUIATRIA', 0057, 04);
insert into disciplinas values ('CORRELAÇÃO CLÍNICA:NEUROLOGIA', 0058, 04);
insert into disciplinas values ('ATIVIDADE INTEGRADORA A', 0059, 02);
insert into disciplinas values ('ATIVIDADE INTEGRADORA B', 0060, 02);
insert into disciplinas values ('HISTOLOGIA E EMBRIOLOGIA A', 0061, 06);
insert into disciplinas values ('HISTOLOGIA E EMBRIOLOGIA B', 0062, 06);
insert into disciplinas values ('CORRELAÇÃO CLÍNICA A', 0063, 04);
insert into disciplinas values ('PRÁTICAS DE ENFERMAGEM', 0064, 02);
insert into disciplinas values ('PATOLOGIA APLICADA À MEDICINA', 0065, 04);
insert into disciplinas values ('ANATOMIA C', 0066, 06);
insert into disciplinas values ('HISTOLOGIA E EMBRIOLOGIA C', 0067, 06);
insert into disciplinas values ('FISIOLOGIA III', 0068, 06);
insert into disciplinas values ('ANATOMIA PATOLÓGICA A', 0069, 06);
insert into disciplinas values ('ANATOMIA PATOLÓGICA B', 0070, 06);

--20 Disciplinas Direito
insert into disciplinas values ('DIREITO CIVIL I', 0071, 06);
insert into disciplinas values ('DIREITO CIVIL II', 0072, 06);
insert into disciplinas values ('DIREITO CIVIL III', 0073, 06);
insert into disciplinas values ('DIREITO PENAL I', 0074, 06);
insert into disciplinas values ('DIREITO PENAL II', 0075, 06);
insert into disciplinas values ('DIREITO PENAL III', 0076, 06);
insert into disciplinas values ('PRÁTICA JURÍDICA I', 0077, 02);
insert into disciplinas values ('PRÁTICA JURÍDICA II', 0078, 02);
insert into disciplinas values ('SOCIOLOGIA DO DIREITO', 0079, 02);
insert into disciplinas values ('FORMAÇÃO HISTÓRICA DO PENSAMENTO JURÍDICO I', 0080, 04);
insert into disciplinas values ('FORMAÇÃO HISTÓRICA DO PENSAMENTO JURÍDICO II', 0081, 04);
insert into disciplinas values ('DIREITOS HUMANOS I', 0082, 02);
insert into disciplinas values ('DIREITOS HUMANOS II', 0083, 02);
insert into disciplinas values ('PSICOLOGIA FORENSE', 0084, 02);
insert into disciplinas values ('DIREITO ADMINISTRATIVO I', 0085, 04);
insert into disciplinas values ('DIREITO ADMINISTRATIVO II', 0086, 04);
insert into disciplinas values ('DIREITO DO TRABALHO I', 0087, 04);
insert into disciplinas values ('DIREITO DO TRABALHO II', 0088, 04);
insert into disciplinas values ('DIREITO COMERCIAL I', 0089, 04);
insert into disciplinas values ('DIREITO COMERCIAL II', 0090, 04);

--create table cursos (nome_curso varchar2(30), num_curso number);
insert into cursos values ('Engenharia de Computação', 10);   
insert into cursos values ('Administração', 20);
insert into cursos values ('Medicina', 30);
insert into cursos values ('Direito', 40);
