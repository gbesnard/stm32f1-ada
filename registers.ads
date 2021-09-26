with System;
with STM32F1; use STM32F1;
with STM32F1.Reset_Clock_Control; use STM32F1.Reset_Clock_Control;
with STM32F1.GPIO; use STM32F1.GPIO;

package Registers is

	-- Registers declaration

	RCC : RCC_Register with
	Volatile,
	Address => System'To_Address (RCC_Base);

	GPIOC : GPIO_Register with
	Volatile,
	Address => System'To_Address (GPIOC_Base);
	pragma Import (Ada, GPIOC);

end Registers;
