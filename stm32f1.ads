pragma Restrictions (No_Elaboration_Code);

with Interfaces; use Interfaces;

package STM32F1 is

	--  Define address bases for the various system components
	 
	Peripheral_Base : constant := 16#4000_0000#; -- Peripheral base address

	APB1_Peripheral_Base : constant := Peripheral_Base;
	APB2_Peripheral_Base : constant := Peripheral_Base + 16#0001_0000#;
	AHB_Peripheral_Base  : constant := Peripheral_Base + 16#0002_0000#;

	GPIOA_Base : constant := APB2_Peripheral_Base + 16#8000#;
	GPIOB_Base : constant := APB2_Peripheral_Base + 16#C000#;
	GPIOC_Base : constant := APB2_Peripheral_Base + 16#1000#;
	GPIOD_Base : constant := APB2_Peripheral_Base + 16#1400#;
	GPIOE_Base : constant := APB2_Peripheral_Base + 16#1800#;

	-- Define registers	

	type GPIO_Register is record
		CRL  : Unsigned_32; -- port configuration register low
		CRH  : Unsigned_32; -- port configuration register high
		IDR  : Unsigned_32; -- port input data register
		ODR  : Unsigned_32; -- port output data register
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

end STM32F1;
