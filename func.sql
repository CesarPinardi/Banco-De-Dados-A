
create or replace function aprov (raAluno in number, codDisc in number) 
return number is
aprovado number;
begin
		--verificar se o aluno esta no curso cuja grade tem essa disciplina
		--verificar se tem os pre requisitos
		aprovado := 0;

		--verificando se o aluno existe;
		for i in (select * from alunos where ra = raAluno) loop
			--verificando se a disciplina existe;
			for j in (select * from disciplinas where cod_disc = codDisc) loop
				--vericando se o aluno esta no curso
					for k in (select * from cursos where num_curso = i.num_curso) loop
						--verificar se a disciplina vinda do paramentro esta contida na grade do curso
						for l in (select * from grade where cod_disc_grade = codDisc) loop
							--verificar se a disciplina vinda do paramentro tem algum pre_req
							for m in (select * from pre_req where cod_disc_pre = codDisc) loop
								--verificar no cursaram se o aluno ja foi aprovado na disciplina pre_req
								for n in (select * from cursaram where cod_disc_cursaram = codDisc) loop
									if m.cod_disc_pre = n.cod_disc_cursaram then --se a disc tem pre_req
										if n.status = 'r' then --verificar se esta aprov na pre_req
											aprovado := -1; --se for reprovado, n pode ser inscrito
											else if n.status = 'a' then
											aprovado := 1;
											end if;
										end if;
									end if;
								end loop;
							end loop;
						end loop;
					end loop;
			end loop;
		end loop;
		return aprovado;
end;
/
