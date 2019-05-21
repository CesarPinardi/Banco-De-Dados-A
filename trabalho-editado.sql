create or replace procedure historico_escolar (ra number) as
begin
for ra_busca in (select * from alunos)loop
	if ra = ra_busca.ra and ra < 2000 then
        for ra_busca_grad in (select * from alunos_grad)loop
            if ra = ra_busca_grad.ra_g then
                dbms_output.put_line('--------------------------------------');
                dbms_output.put_line('Nome do aluno: '|| ra_busca.nome_aluno);
                dbms_output.put_line('Media: '|| ra_busca_grad.cd);
                dbms_output.put_line('--------------------------------------');
            end if;
        end loop;
	else if ra = ra_busca.ra and ra >= 2000 then
        for ra_busca_pos_grad in (select * from alunos_pos_grad)loop
            if ra = ra_busca_pos_grad.ra_p_g then
                dbms_output.put_line('--------------------------------------');
                dbms_output.put_line('Nome do aluno: ' || ra_busca.nome_aluno);
                dbms_output.put_line('Orientador: ' || ra_busca_pos_grad.orientador);
                dbms_output.put_line('--------------------------------------');
            end if;
        end loop;
		end if;
	end if;
end loop;
end;
/

exec historico_escolar(1001);
exec historico_escolar(2001);
