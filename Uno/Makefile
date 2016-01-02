BUILD = build/

SOURCE = source/

OBJECTS := $(patsubst $(SOURCE)%.S,$(BUILD)%.o,$(wildcard $(SOURCE)*.S)) 

TARGET = output.hex

MCU = atmega328p

CONF = config/avrdude.conf

PORT = /dev/ttyACM0

MAINFILE = main


all: $(TARGET)

rebuild: all

$(TARGET): $(BUILD)output.elf
	avr-objcopy --output-target=ihex $(BUILD)output.elf $@


$(BUILD)output.elf : $(OBJECTS)
	@echo Building target: $@
	avr-ld -o $@ $(BUILD)$(MAINFILE).o
	@echo Finished building target: $@

$(BUILD)%.o: $(SOURCE)%.S $(BUILD)
	@echo Building file: $< 
	avr-as -mmcu=$(MCU) -I "./def" -o $@ "$<"
	

$(BUILD):
	mkdir $@

install:
	avrdude -C $(CONF) -v -p $(MCU) -carduino -P $(PORT) -b115200 -D -Uflash:w:$(TARGET):i 


clean :
	-rm -rf $(BUILD)
