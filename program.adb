package body Program is

procedure Run is
   i : Integer := 0;
begin
	loop
		i := i + 1;
	end loop;
end Run;

procedure Last_Chance_Handler (Msg : System.Address; Line : Integer) is
begin
	loop
		null;
	end loop;
end Last_Chance_Handler;

end Program;
