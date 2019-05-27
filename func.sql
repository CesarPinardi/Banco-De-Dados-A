--nao tem as verificacoes
create or replace function aprov (raAluno in number, codDisc in number) 
return number is
aprovado number;
begin
	aprovado := 0;
	--verificar se a disciplina tem pre_req
	for i in (select * from pre_req where cod_disc_pre = codDisc) loop
		for a in (select * from cursaram where ra_cursaram = raAluno) loop --verifica ra
			for j in (select * from cursaram where i.cod_pre_req = a.cod_disc_cursaram) loop --
				if j.status = 'r' then 
					return aprovado;
				else 
					aprovado := 1;
				end if;
			end loop;
		end loop;		
	end loop;
	return aprovado;
end;
