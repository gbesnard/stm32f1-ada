package body Program is

procedure Run is
   i   : Unsigned_32 := 0;
   foo : Unsigned_32 := 0;
begin
	foo := GPIOC.CRL;
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
