with System;
with STM32F1; use STM32F1;

package Registers is

	-- Registers declaration
	GPIOC : GPIO_Register with
	Volatile,
	Address => System'To_Address (GPIOC_Base);
	pragma Import (Ada, GPIOC);

end Registers;
