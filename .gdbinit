echo Executing GDB with .gdbinit.\n

break Run

# Connect
target remote localhost:4242
# Reset the target and call its init script
monitor reset init
# Halt the target. The init script should halt the target, but just in case
monitor halt
