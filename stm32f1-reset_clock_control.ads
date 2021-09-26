pragma Restrictions (No_Elaboration_Code);

package STM32F1.Reset_Clock_Control is

   type RCC_Register is record
    	CR       : Unsigned_32; -- RCC clock control register
    	CFGR     : Unsigned_32; -- RCC clock configuration register
    	CIR      : Unsigned_32; -- RCC clock interrupt register
		APB2RSTR : Unsigned_32; -- RCC APB2 peripheral reset register
    	APB1RSTR : Unsigned_32; -- RCC APB1 peripheral reset register
    	AHBENR   : Unsigned_32; -- RCC AHB peripheral clock register
    	APB2ENR  : Unsigned_32; -- RCC APB2 peripheral clock enable register
		APB1ENR  : Unsigned_32; -- RCC APB1 peripheral clock enable register
		BDCR     : Unsigned_32; -- RCC Backup domain control register
		CSR      : Unsigned_32; -- RCC clock control/status register
   end record;

   for RCC_Register use record
		CR       at 0   range 0 .. 31;
		CFGR     at 4   range 0 .. 31;
		CIR      at 8   range 0 .. 31;
		APB2RSTR at 12  range 0 .. 31;
		APB1RSTR at 16  range 0 .. 31;
		AHBENR   at 20  range 0 .. 31;
		APB2ENR  at 24  range 0 .. 31;
		APB1ENR  at 28  range 0 .. 31;
		BDCR     at 32  range 0 .. 31;
		CSR      at 36  range 0 .. 31;
   end record;

end STM32F1.Reset_Clock_Control;
