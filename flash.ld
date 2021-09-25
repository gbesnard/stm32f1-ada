OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)

/* Start of FLASH: 0x08000000, length 16KB */
/* Start of RAM:   0x20000000, length 20KB */
SECTIONS
{
	/* vector table */
    .vectors 0x08000000 :
    {
        LONG(0x20001000) 	/* sp addr, stack range from 0x20001000 to 0x20004000 (end of RAM) */
        LONG(run + 1)		/* reset handler addr */
        FILL(0)
    }

	/* code */
    .text 0x08000100 :
    {
        *(.text)
    }
}
