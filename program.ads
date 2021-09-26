with System;
with Interfaces; use Interfaces;
with Registers; use Registers;

package Program is

	procedure Run;
	pragma Export (C, Run, "run");

	procedure Last_Chance_Handler (Msg : System.Address; Line : Integer);
	pragma Export (C, Last_Chance_Handler, "__gnat_last_chance_handler");

end Program;
