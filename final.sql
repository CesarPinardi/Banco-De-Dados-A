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
drop table disciplinas;
drop table alunos;
drop table cursos;

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
--alter table cursaram add constraint pk_sem_cursaram primary key (sem_ano);

--cod_pre_req é chave primaria de pre requisito
alter table pre_req add constraint pk_pre_req primary key (cod_pre_req);

--adicionando chaves estrangeiras dos relacionamentos
alter table alunos add constraint fk_num_curso foreign key (num_curso) references cursos;

alter table cursam add constraint pk_ra_cursam primary key (ra_cursam);
alter table cursam add constraint fk_ra_cursam foreign key (ra_cursam) references alunos;
alter table cursam add constraint fK_cod_disc_cursam foreign key (cod_disc_cursam) references disciplinas;

--alter table cursaram add constraint pk_ra_cursaram primary key (ra_cursaram);
alter table cursaram add constraint fk_ra_cursaram foreign key (ra_cursaram) references alunos;
alter table cursaram add constraint fK_cod_disc_cursaram foreign key (cod_disc_cursaram) references disciplinas;

alter table pre_req add constraint fK_cod_disc_pre foreign key (cod_disc_pre) references disciplinas;
alter table pre_req add constraint fK_pre_req foreign key (cod_pre_req) references disciplinas;

alter table grade add constraint pk_cod_disc_grade primary key (cod_disc_grade);
alter table grade add constraint fK_cod_disc_grade foreign key (cod_disc_grade) references disciplinas;
alter table grade add constraint fk_num_curso_grade foreign key (num_curso_grade) references cursos;

--(nome_curso varchar2(30), num_curso number);
insert into cursos values ('Engenharia de Computação', 10);   
insert into cursos values ('Administração', 20);
insert into cursos values ('Medicina', 30);
insert into cursos values ('Direito', 40);

--(nome_disc varchar2(75), cod_disc number, cred number);
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
insert into disciplinas values ('CORRELAÇÃO CLÍNICA: NEUROLOGIA', 0058, 04);
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

--(ra number(4), nome_aluno varchar2(20), num_curso number, data_nasc date);
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


--(ra_g number(4),cd number(3,1)); 
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
insert into alunos values(2010,'aaa',10,to_date('03/12/1998','dd/mm/yyyy'));
 
--(ra_p_g number(4), orientador varchar2(20)); 
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
insert into alunos_pos_grad values(2010,'Danke');

insert into cursam values (1001,0002,80);
insert into cursam values (1002,0002,75);
insert into cursam values (1003,0003,90);
insert into cursam values (1004,0004,95);
insert into cursam values (1005,0005,25);
insert into cursam values (1006,0009,80);

insert into cursam values (1007,0031,75);--adm
insert into cursam values (1008,0035,90);
insert into cursam values (1009,0044,95);
insert into cursam values (1010,0045,25);

insert into cursam values (1011,0051,95);--med
insert into cursam values (1012,0052,25);
insert into cursam values (1013,0060,95);

insert into cursam values (1014,0071,25);--dir
insert into cursam values (1015,0072,25);


--pos
insert into cursam values (2001,0020,80);
insert into cursam values (2002,0020,90);

insert into cursam values (2003,0049,90);

insert into cursam values (2004,0063,32);

insert into cursam values (2005,0081,65);


insert into cursaram values (1001,0001,to_date('03/2018','dd/yyyy'),9.1,100,'a');
insert into cursaram values (1002,0001,to_date('04/2018','dd/yyyy'),6.5,85,'a');
insert into cursaram values (1003,0001,to_date('02/2018','dd/yyyy'),4.2,45,'r');
insert into cursaram values (1004,0003,to_date('01/2018','dd/yyyy'),1.1,22,'r');
insert into cursaram values (1005,0003,to_date('01/2018','dd/yyyy'),7.5,75,'a');
insert into cursaram values (1005,0004,to_date('01/2018','dd/yyyy'),8.0,80,'a');
insert into cursaram values (1005,0003,to_date('03/2018','dd/yyyy'),10.0,95,'a');
insert into cursaram values (1006,0022,to_date('01/2018','dd/yyyy'),8.5,90,'a');
insert into cursaram values (1006,0023,to_date('01/2018','dd/yyyy'),9.1,100,'a');

insert into cursaram values (2001,0001,to_date('03/2016','dd/yyyy'),7.6,100,'a');
insert into cursaram values (2002,0001,to_date('04/2016','dd/yyyy'),6.6,90,'a');
insert into cursaram values (2003,0001,to_date('02/2016','dd/yyyy'),8.9,44,'a');
insert into cursaram values (2004,0002,to_date('01/2016','dd/yyyy'),5.4,50,'a');
insert into cursaram values (2005,0003,to_date('03/2016','dd/yyyy'),9.2,55,'a');

insert into pre_req values (0002,0001);
insert into pre_req values (0004,0003);
insert into pre_req values (0005,0004);
insert into pre_req values (0006,0002);
insert into pre_req values (0007,0002);
insert into pre_req values (0008,0011);
insert into pre_req values (0009,0023);
insert into pre_req values (0011,0010);
insert into pre_req values (0013,0008);
insert into pre_req values (0015,0014);
insert into pre_req values (0016,0015);
insert into pre_req values (0017,0016);
insert into pre_req values (0022,0002);
insert into pre_req values (0023,0022);
insert into pre_req values (0025,0024);
insert into pre_req values (0026,0025);
insert into pre_req values (0028,0027);
insert into pre_req values (0029,0002);
insert into pre_req values (0030,0029);
--adm
insert into pre_req values (0035,0033);
insert into pre_req values (0037,0033);
insert into pre_req values (0039,0031);
insert into pre_req values (0041,0040);
insert into pre_req values (0045,0044);
insert into pre_req values (0046,0039);
insert into pre_req values (0047,0038);
--med
insert into pre_req values (0052,0051);
insert into pre_req values (0054,0053);
insert into pre_req values (0056,0055);
insert into pre_req values (0060,0059);
insert into pre_req values (0062,0061);
insert into pre_req values (0066,0056);
insert into pre_req values (0068,0052);
insert into pre_req values (0070,0069);
--direito
insert into pre_req values (0072,0071);
insert into pre_req values (0073,0072);
insert into pre_req values (0075,0074);
insert into pre_req values (0076,0075);
insert into pre_req values (0078,0077);
insert into pre_req values (0081,0080);
insert into pre_req values (0083,0082);
insert into pre_req values (0086,0085);
insert into pre_req values (0088,0087);
insert into pre_req values (0090,0089);


insert into grade values (0001,10);
insert into grade values (0002,10);
insert into grade values (0003,10);
insert into grade values (0004,10);
insert into grade values (0005,10);
insert into grade values (0006,10);
insert into grade values (0007,10);
insert into grade values (0008,10);
insert into grade values (0009,10);
insert into grade values (0010,10);
insert into grade values (0011,10);
insert into grade values (0012,10);
insert into grade values (0013,10);
insert into grade values (0014,10);
insert into grade values (0015,10);
insert into grade values (0016,10);
insert into grade values (0017,10);
insert into grade values (0018,10);
insert into grade values (0019,10);
insert into grade values (0020,10);
insert into grade values (0021,10);
insert into grade values (0022,10);
insert into grade values (0023,10);
insert into grade values (0024,10);
insert into grade values (0025,10);
insert into grade values (0026,10);
insert into grade values (0027,10);
insert into grade values (0028,10);
insert into grade values (0029,10);
insert into grade values (0030,10);

--adm
insert into grade values (0031,20);
insert into grade values (0032,20);
insert into grade values (0033,20);
insert into grade values (0034,20);
insert into grade values (0035,20);
insert into grade values (0036,20);
insert into grade values (0037,20);
insert into grade values (0038,20);
insert into grade values (0039,20);
insert into grade values (0040,20);
insert into grade values (0041,20);
insert into grade values (0042,20);
insert into grade values (0043,20);
insert into grade values (0044,20);
insert into grade values (0045,20);
insert into grade values (0046,20);
insert into grade values (0047,20);
insert into grade values (0048,20);
insert into grade values (0049,20);
insert into grade values (0050,20);

--med
insert into grade values (0051,30);
insert into grade values (0052,30);
insert into grade values (0053,30);
insert into grade values (0054,30);
insert into grade values (0055,30);
insert into grade values (0056,30);
insert into grade values (0057,30);
insert into grade values (0058,30);
insert into grade values (0059,30);
insert into grade values (0060,30);
insert into grade values (0061,30);
insert into grade values (0062,30);
insert into grade values (0063,30);
insert into grade values (0064,30);
insert into grade values (0065,30);
insert into grade values (0066,30);
insert into grade values (0067,30);
insert into grade values (0068,30);
insert into grade values (0069,30);
insert into grade values (0070,30);

--direito
insert into grade values (0071,40);
insert into grade values (0072,40);
insert into grade values (0073,40);
insert into grade values (0074,40);
insert into grade values (0075,40);
insert into grade values (0076,40);
insert into grade values (0077,40);
insert into grade values (0078,40);
insert into grade values (0079,40);
insert into grade values (0080,40);
insert into grade values (0081,40);
insert into grade values (0082,40);
insert into grade values (0083,40);
insert into grade values (0084,40);
insert into grade values (0085,40);
insert into grade values (0086,40);
insert into grade values (0087,40);
insert into grade values (0088,40);
insert into grade values (0089,40);
insert into grade values (0090,40);

set serveroutput on;

create or replace procedure historico_escolar (ra_in number) as 
begin
	for grad in (select * from alunos where ra_in = ra and ra_in < 2000) loop
		dbms_output.put_line('Nome do Aluno: '||grad.nome_aluno);
		dbms_output.put_line('RA do aluno: ' ||grad.ra);
		dbms_output.put_line('Data de nascimento: '||grad.data_nasc);
		for grad2 in (select * from alunos_grad where ra_in = ra_g) loop
			dbms_output.put_line('CD do aluno: '||grad2.cd);
			for c_cursam in (select * from cursam where ra_in = ra_cursam) loop
				for disc in (select * from disciplinas where c_cursam.cod_disc_cursam = cod_disc) loop
					dbms_output.put_line('Disciplina em curso: '||disc.nome_disc);
					dbms_output.put_line('Frequencia atual: '||c_cursam.freq);
				end loop;
			end loop;
			for c_cursaram in (select * from cursaram where ra_in = ra_cursaram) loop
				for disc1 in (select * from disciplinas where c_cursaram.cod_disc_cursaram = cod_disc) loop
					dbms_output.put_line('Disciplina cursada: '||disc1.nome_disc);
					dbms_output.put_line('Nota da disicplina cursada: '||c_cursaram.nota);
					dbms_output.put_line('Frequencia da disciplina cursada '||c_cursaram.freq);
					dbms_output.put_line('Status (a=aprovado / r=reprovado): '||c_cursaram.status);
				end loop;
			end loop;
		end loop;
	end loop;

	for grad3 in (select * from alunos where ra_in = ra and ra_in >= 2000) loop
		dbms_output.put_line('Nome do Aluno: '||grad3.nome_aluno);
		dbms_output.put_line('RA do aluno: ' ||grad3.ra);
		dbms_output.put_line('Data de nascimento: '||grad3.data_nasc);
		for grad4 in (select * from alunos_pos_grad where ra_in = ra_p_g) loop
			dbms_output.put_line('Orientador do aluno: '||grad4.orientador);
			for c_cursam in (select * from cursam where ra_in = ra_cursam) loop
				for disc in (select * from disciplinas where c_cursam.cod_disc_cursam = cod_disc) loop
					dbms_output.put_line('Disciplina em curso: '||disc.nome_disc);
					dbms_output.put_line('Frequencia atual: '||c_cursam.freq);
				end loop;
			end loop;
			for c_cursaram in (select * from cursaram where ra_in = ra_cursaram) loop
				for disc1 in (select * from disciplinas where c_cursaram.cod_disc_cursaram = cod_disc) loop
					dbms_output.put_line('Disciplina cursada: '||disc1.nome_disc);
					dbms_output.put_line('Nota da disicplina cursada: '||c_cursaram.nota);
					dbms_output.put_line('Frequencia da disciplina cursada '||c_cursaram.freq);
					dbms_output.put_line('Status (a=aprovado / r=reprovado): '||c_cursaram.status);
				end loop;
			end loop;
		end loop;
	end loop;
    
    for var_al in (select * from alunos where ra_in = ra) loop
        for var_gr in (select * from grade where num_curso_grade = var_al.num_curso) loop
                for var_cursam in (select * from cursam where ra_in = ra_cursam) loop
                  if var_gr.cod_disc_grade = var_cursam.cod_disc_cursam then
                    dbms_output.put_line('');      --disciplina está na grade atual
                  else
                  for var_cursaram in (select * from cursaram where ra_in = ra_cursaram) loop
                        if var_gr.cod_disc_grade = var_cursaram.cod_disc_cursaram then
                             dbms_output.put_line('');      
                        else

                            for print in (select * from disciplinas where cod_disc = var_gr.cod_disc_grade) loop
                            dbms_output.put_line('Disciplina a ser cursada: '|| print.nome_disc);    
                            end loop;
                            
                        end if;
                  end loop;
                  end if;
                end loop;
        end loop;
    end loop;
end;
/

create or replace function aprov (raAluno in number, codDisc in number) 
return varchar2 is
aprovado number;
begin
	--verificar se a disciplina tem pre_req
	for i in (select * from pre_req where cod_disc_pre = codDisc) loop
		for a in (select * from cursaram where ra_cursaram = raAluno and cod_disc_cursaram = i.cod_pre_req) loop --verifica ra     
            if a.nota >= 5.0 and a.freq >= 75 and a.status = 'a' then 
                return 'positivo';
            else 
                return 'negativo';                
            end if;        
		end loop;		
	end loop;
end;
/

create or replace trigger apto before insert on cursam for each row
begin
	for a_cursaram in (select * from cursaram where :new.ra_cursam = ra_cursaram) loop
		for a_pre_req in (select * from pre_req where :new.cod_disc_cursam = cod_disc_pre) loop
			if (a_cursaram.cod_disc_cursaram = a_pre_req.cod_pre_req and a_cursaram.freq >= 75 and a_cursaram.status = 'a') then
				a_cursaram.cod_disc_cursaram := a_cursaram.cod_disc_cursaram;
			else
				raise_application_error(-20000, 'Aluno não apto a realizar disciplina');
			end if;
		end loop;
	end loop;
end;
/


create or replace trigger retira before insert on cursaram for each row
begin
	for c_atual in (select * from cursam where :new.cod_disc_cursaram = cod_disc_cursam and :new.ra_cursaram = ra_cursam) loop
		if :new.cod_disc_cursaram = c_atual.cod_disc_cursam and :new.ra_cursaram = c_atual.ra_cursam then
			delete from cursam where cod_disc_cursam = :new.cod_disc_cursaram and ra_cursam = :new.ra_cursaram;
		else
			raise_application_error(-20000, 'Aluno não fez curso');
		end if;
	end loop;
end;
/

create or replace trigger update_cd before insert on cursaram for each row
declare
qtd number;
div number;
begin
div := 0;
qtd := 1;
	div := :new.nota;
	for cd_cursaram in (select * from cursaram where :new.ra_cursaram = ra_cursaram) loop
		div := div + cd_cursaram.nota;
		qtd := qtd + 1;
	end loop;
	update alunos_grad set 
		cd = div/qtd
		where ra_g = :new.ra_cursaram;
	end;
/

