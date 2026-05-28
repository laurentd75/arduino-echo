# Programmer parameters
avrType=atmega328p
programmerType=arduino
programmerDev=/dev/ttyUSB0

# Compiler parameters
avrFreq=16000000 # 16 Mhz
cflags=-DF_CPU=$(avrFreq) -mmcu=$(avrType) -Wall -Werror -Wextra -Os

objects=$(patsubst %.c,%.o,$(wildcard *.c))

.PHONY: clean flash

all: main.hex

uart.o: uart.c uart.h

%.o: %.c
	avr-gcc $(cflags) -c $< -o $@

main.elf: $(objects)
	avr-gcc $(cflags) -o $@ $^

main.hex: main.elf
	avr-objcopy -j .text -j .data -O ihex $^ $@

flash: main.hex
	avrdude -v \
		-p $(avrType) \
		-c $(programmerType) \
		-P $(programmerDev) \
		-U flash:w:$<

clean:
	rm -f main.hex main.elf $(objects)
