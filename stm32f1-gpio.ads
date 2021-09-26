pragma Restrictions (No_Elaboration_Code);

package STM32F1.GPIO is

	-- CRH constants   
	MODE_IN     : constant Unsigned_32 := 16#00000000#;  --Input Floating Mode
	MODE_OUT_PP : constant Unsigned_32 := 16#00000001#;  --Output Push Pull Mode
	MODE_OUT_OD : constant Unsigned_32 := 16#00000011#;  --Output Open Drain Mode 
	MODE_AF_PP  : constant Unsigned_32 := 16#00000002#;  --Alternate Function Push Pull Mode
	MODE_AF_OD  : constant Unsigned_32 := 16#00000012#;  --Alternate Function Open Drain Mode
	MODE_AF_IN  : constant Unsigned_32 := 16#00000000#;  --Alternate Function Input Mode

   	-- Define registers	

	type GPIO_Register is record
		CRL  : Unsigned_32; -- port configuration register low
		CRH  : Unsigned_32; -- port configuration register high
		IDR  : Unsigned_32; -- port input data register
		ODR  : Bits_32x1;   -- port output data register
		BSRR : Unsigned_32; -- port bit set/reset register
		BRR  : Unsigned_32; -- port bit reset register
		LCKR : Unsigned_32; -- port configuration lock register
	end record;

	for GPIO_Register use record
		CRL  at 0  range 0 .. 31;
		CRH  at 4  range 0 .. 31;
		IDR  at 8  range 0 .. 31;
		ODR  at 12 range 0 .. 31;
		BSRR at 16 range 0 .. 31;
		BRR  at 20 range 0 .. 31;
		LCKR at 24 range 0 .. 31;
	end record;

end STM32F1.GPIO;
