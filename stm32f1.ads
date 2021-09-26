pragma Restrictions (No_Elaboration_Code);

with Interfaces; use Interfaces;

package STM32F1 is

	type Word      is new Interfaces.Unsigned_32;
	type Half_Word is new Interfaces.Unsigned_16;
	type Byte      is new Interfaces.Unsigned_8;

	type Bits_1  is mod 2**1 with Size => 1;
	type Bits_2  is mod 2**2 with Size => 2;
	type Bits_4  is mod 2**4 with Size => 4;

	type Bits_32x1 is array (0 .. 31) of Bits_1 with Pack, Size => 32;
	type Bits_16x2 is array (0 .. 15) of Bits_2 with Pack, Size => 32;
	type Bits_8x4  is array (0 ..  7) of Bits_4 with Pack, Size => 32;

	--  Define address bases for the various system components
	 
	Peripheral_Base : constant := 16#4000_0000#; -- Peripheral base address

	APB1_Peripheral_Base : constant := Peripheral_Base;
	APB2_Peripheral_Base : constant := Peripheral_Base + 16#0001_0000#;
	AHB_Peripheral_Base  : constant := Peripheral_Base + 16#0002_0000#;

	RCC_Base   : constant := AHB_Peripheral_Base + 16#00001000#;

	GPIOA_Base : constant := APB2_Peripheral_Base + 16#8000#;
	GPIOB_Base : constant := APB2_Peripheral_Base + 16#C000#;
	GPIOC_Base : constant := APB2_Peripheral_Base + 16#1000#;
	GPIOD_Base : constant := APB2_Peripheral_Base + 16#1400#;
	GPIOE_Base : constant := APB2_Peripheral_Base + 16#1800#;

end STM32F1;
