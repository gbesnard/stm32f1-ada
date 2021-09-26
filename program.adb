with Interfaces; use Interfaces;
with Registers; use Registers;
with STM32F1; use STM32F1;
with STM32F1.GPIO; use STM32F1.GPIO;
with STM32F1.Reset_Clock_Control; use STM32F1.Reset_Clock_Control;

package body Program is

procedure Run is
	i                  : Unsigned_32 := 0;
	on_off             : Bits_1 := 0;
	RCC_APB2ENR_IOPCEN : constant Unsigned_32 := 16#00000010#;	
	PC13_CONFIGURATION : constant Unsigned_32 := 2#00000000_00010000_00000000_00000000#;	
begin
	--  Enable clock for GPIO C
	RCC.APB2ENR := RCC.APB2ENR or RCC_APB2ENR_IOPCEN;  

	-- Configure PC13 (green LED)	
	GPIOC.CRH := PC13_CONFIGURATION;

	-- Green LED ON
	GPIOC.ODR(13) := 1;

	loop
		i := i + 1;

		-- We do not have a proper timer yet
		if i mod 100000 = 0 then
			-- Toggle between ON/OFF
			on_off := on_off + 1;
		end if;

		-- Apply output to LED.
		GPIOC.ODR(13) := on_off;
	end loop;
end Run;

procedure Last_Chance_Handler (Msg : System.Address; Line : Integer) is
begin
	loop
		null;
	end loop;
end Last_Chance_Handler;

end Program;
