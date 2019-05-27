
create or replace function aprov (raAluno in number, codDisc in number) 
return number is
aprovado number;
begin
	aprovado := 0;
	--verificar se a disciplina tem pre_req

	for i in (select * from pre_req where cod_disc_pre = codDisc) loop
		for a in (select * from cursaram where ra_cursaram = raAluno and cod_disc_cursaram = i.cod_pre_req) loop --verifica ra
				if a.nota >= 5.0 and a.freq >= 75 and a.status = 'a' then 
					aprovado := 1;
					return aprovado;
				else 
					aprovado := -1;
					
				end if;
		end loop;		
	end loop;
	return aprovado;
end;
/

select aprov(1003, 2) from dual;
