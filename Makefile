TOOLCHAIN_PATH = ~/opt/GNAT/2020-arm-elf/bin/

CC = $(TOOLCHAIN_PATH)/arm-eabi-gcc
LD = $(TOOLCHAIN_PATH)/arm-eabi-ld
OBJCPY = $(TOOLCHAIN_PATH)/arm-eabi-objcopy
OBJDUMP = $(TOOLCHAIN_PATH)/arm-eabi-objdump
GDB = $(TOOLCHAIN_PATH)/arm-eabi-gdb

CFLAGS = -Iruntime -mthumb -march=armv7-m -mfloat-abi=soft -g

all: program.bin program.S

program.S: program.elf
	$(OBJDUMP) -D program.elf > program.S

program.o: program.adb
	$(CC) $(CFLAGS) -c program.adb

program.elf: program.o
	$(LD) -T flash.ld -o program.elf program.o

program.bin: program.elf
	$(OBJCPY) -O binary program.elf program.bin

gdb:
	$(GDB) --tui program.elf

flash:
	st-flash write program.bin 0x8000000
	st-util

clean:
	rm -f *.ali *.o *.bin *.elf *.S
