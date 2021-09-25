all: program.bin program.S

program.S: program.elf
	~/opt/GNAT/2020-arm-elf/bin/arm-eabi-objdump -D program.elf > program.S

program.o: program.adb
	~/opt/GNAT/2020-arm-elf/bin/arm-eabi-gcc -c -mtune=cortex-m3 -mthumb -march=armv7-m -mfloat-abi=soft -g program.adb

program.elf: program.o
	~/opt/GNAT/2020-arm-elf/bin/arm-eabi-ld -T flash.ld -o program.elf program.o

program.bin: program.elf
	~/opt/GNAT/2020-arm-elf/bin/arm-eabi-objcopy -O binary program.elf program.bin

gdb:
	~/opt/GNAT/2020-arm-elf/bin/arm-eabi-gdb --tui program.elf

flash:
	st-flash write program.bin 0x8000000
	st-util

clean:
	rm -f *.ali *.o *.bin *.elf *.S
