################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Middlewares/ST/STM32_USB_Device_Library/Core/Src/subdir.mk
-include Drivers/STM32F7xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
I2S\ to\ USB\ FS\ bridge.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
I2S\ to\ USB\ FS\ bridge.list \

OBJCOPY_BIN += \
I2S\ to\ USB\ FS\ bridge.bin \


# All Target
all: I2S\ to\ USB\ FS\ bridge.elf secondary-outputs

# Tool invocations
I2S\ to\ USB\ FS\ bridge.elf: $(OBJS) $(USER_OBJS) C:\Users\Mark\repos\electronics-adc\firmware\I2S\ to\ USB\ FS\ bridge\STM32F730R8TX_FLASH.ld
	arm-none-eabi-gcc -o "I2S to USB FS bridge.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m7 -T"C:\Users\Mark\repos\electronics-adc\firmware\I2S to USB FS bridge\STM32F730R8TX_FLASH.ld" --specs=nosys.specs -Wl,-Map="I2S to USB FS bridge.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

I2S\ to\ USB\ FS\ bridge.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "I2S to USB FS bridge.list"
	@echo 'Finished building: $@'
	@echo ' '

I2S\ to\ USB\ FS\ bridge.bin: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "I2S to USB FS bridge.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
