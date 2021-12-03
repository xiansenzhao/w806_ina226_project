##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=W806_SDK
ConfigurationName      :=BuildSet
WorkspacePath          :=../
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=zhaoxiansen
Date                   :=03/12/2021
CDKPath                :=../../../C-Sky/CDK
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=W806
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=W806_SDK.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck804ef  -mhard-float  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/gcc_csky.ld"
LinkOtherFlagsOption   :=-Wl,-zmax-page-size=1024 -mhard-float
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch)../../../C-Sky/CDK/CSKY/MinGW/csky-abiv2-elf-toolchain/csky-elfabiv2/include $(IncludeSwitch). $(IncludeSwitch)../Include $(IncludeSwitch)../Include/arch/xt804 $(IncludeSwitch)../Include/arch/xt804/csi_core $(IncludeSwitch)../Include/arch/xt804/csi_dsp $(IncludeSwitch)../Include/driver $(IncludeSwitch)../Libraries/component/FreeRTOS/include $(IncludeSwitch)../Libraries/component/FreeRTOS/portable/xt804 $(IncludeSwitch)inc  
IncludeAPath           := $(IncludeSwitch)../../../C-Sky/CDK/CSKY/csi/csi_core/csi_cdk/ $(IncludeSwitch)../../../C-Sky/CDK/CSKY/csi/csi_core/include/ $(IncludeSwitch)../../../C-Sky/CDK/CSKY/csi/csi_driver/include/ $(IncludeSwitch). $(IncludeSwitch)../Include $(IncludeSwitch)../Include/arch/xt804 $(IncludeSwitch)../Include/arch/xt804/csi_core $(IncludeSwitch)../Include/arch/xt804/csi_dsp $(IncludeSwitch)../Libraries/component/FreeRTOS/include  
Libs                   := -Wl,--start-group  -Wl,--end-group $(LibrarySwitch)dsp $(LibrarySwitch)m  
ArLibs                 := "dsp m" 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch).  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck804ef  -mhard-float   $(PreprocessorSwitch)GCC_COMPILE=1  $(PreprocessorSwitch)TLS_CONFIG_CPU_XT804=1   -O2  -g3  -Wall  -ffunction-sections -fdata-sections -c 
CFLAGS   := -mcpu=ck804ef  -mhard-float   $(PreprocessorSwitch)GCC_COMPILE=1  $(PreprocessorSwitch)TLS_CONFIG_CPU_XT804=1   -O2  -g3  -Wall  -ffunction-sections -fdata-sections -c 
ASFLAGS  := -mcpu=ck804ef  -mhard-float    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/src_main$(ObjectSuffix) $(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix) $(IntermediateDirectory)/src_wm_it$(ObjectSuffix) $(IntermediateDirectory)/src_adc$(ObjectSuffix) $(IntermediateDirectory)/src_gpio$(ObjectSuffix) $(IntermediateDirectory)/src_pwm$(ObjectSuffix) $(IntermediateDirectory)/src_timer$(ObjectSuffix) $(IntermediateDirectory)/src_iic$(ObjectSuffix) $(IntermediateDirectory)/src_oled$(ObjectSuffix) $(IntermediateDirectory)/src_ina226$(ObjectSuffix) \
	$(IntermediateDirectory)/src_spi$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) \
	$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_lcd$(ObjectSuffix) $(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) $(IntermediateDirectory)/bsp_startup$(ObjectSuffix) $(IntermediateDirectory)/bsp_system$(ObjectSuffix) $(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) \
	$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) $(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_stream_buffer$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix) $(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix) $(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix) \
	$(IntermediateDirectory)/xt804_port$(ObjectSuffix) $(IntermediateDirectory)/MemMang_heap_5$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) $(LinkOtherFlagsOption)  -Wl,--ckmap=$(ProjectPath)/Lst/$(OutputFile).map  @$(ObjectsFileList)  $(LinkOptions) $(LibPath) $(Libs)
	@mv $(ProjectPath)/Lst/$(OutputFile).map $(ProjectPath)/Lst/$(OutputFile).temp && $(READELF) $(ElfInfoSwitch) $(ProjectPath)/Obj/$(OutputFile)$(ExeSuffix) > $(ProjectPath)/Lst/$(OutputFile).map && echo ====================================================================== >> $(ProjectPath)/Lst/$(OutputFile).map && cat $(ProjectPath)/Lst/$(OutputFile).temp >> $(ProjectPath)/Lst/$(OutputFile).map && rm -rf $(ProjectPath)/Lst/$(OutputFile).temp
	$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/src_main$(ObjectSuffix): src/main.c  
	$(CC) $(SourceSwitch) src/main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_main$(ObjectSuffix) -MF$(IntermediateDirectory)/src_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_main$(PreprocessSuffix): src/main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_main$(PreprocessSuffix) src/main.c

$(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix): src/wm_hal_msp.c  
	$(CC) $(SourceSwitch) src/wm_hal_msp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_wm_hal_msp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_wm_hal_msp$(PreprocessSuffix): src/wm_hal_msp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_wm_hal_msp$(PreprocessSuffix) src/wm_hal_msp.c

$(IntermediateDirectory)/src_wm_it$(ObjectSuffix): src/wm_it.c  
	$(CC) $(SourceSwitch) src/wm_it.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_wm_it$(ObjectSuffix) -MF$(IntermediateDirectory)/src_wm_it$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_wm_it$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_wm_it$(PreprocessSuffix): src/wm_it.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_wm_it$(PreprocessSuffix) src/wm_it.c

$(IntermediateDirectory)/src_adc$(ObjectSuffix): src/adc.c  
	$(CC) $(SourceSwitch) src/adc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/src_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_adc$(PreprocessSuffix): src/adc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_adc$(PreprocessSuffix) src/adc.c

$(IntermediateDirectory)/src_gpio$(ObjectSuffix): src/gpio.c  
	$(CC) $(SourceSwitch) src/gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/src_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_gpio$(PreprocessSuffix): src/gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_gpio$(PreprocessSuffix) src/gpio.c

$(IntermediateDirectory)/src_pwm$(ObjectSuffix): src/pwm.c  
	$(CC) $(SourceSwitch) src/pwm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/src_pwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_pwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_pwm$(PreprocessSuffix): src/pwm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_pwm$(PreprocessSuffix) src/pwm.c

$(IntermediateDirectory)/src_timer$(ObjectSuffix): src/timer.c  
	$(CC) $(SourceSwitch) src/timer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_timer$(ObjectSuffix) -MF$(IntermediateDirectory)/src_timer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_timer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_timer$(PreprocessSuffix): src/timer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_timer$(PreprocessSuffix) src/timer.c

$(IntermediateDirectory)/src_iic$(ObjectSuffix): src/iic.c  
	$(CC) $(SourceSwitch) src/iic.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_iic$(ObjectSuffix) -MF$(IntermediateDirectory)/src_iic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_iic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_iic$(PreprocessSuffix): src/iic.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_iic$(PreprocessSuffix) src/iic.c

$(IntermediateDirectory)/src_oled$(ObjectSuffix): src/oled.c  
	$(CC) $(SourceSwitch) src/oled.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_oled$(ObjectSuffix) -MF$(IntermediateDirectory)/src_oled$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_oled$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_oled$(PreprocessSuffix): src/oled.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_oled$(PreprocessSuffix) src/oled.c

$(IntermediateDirectory)/src_ina226$(ObjectSuffix): src/ina226.c  
	$(CC) $(SourceSwitch) src/ina226.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_ina226$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ina226$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_ina226$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_ina226$(PreprocessSuffix): src/ina226.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_ina226$(PreprocessSuffix) src/ina226.c

$(IntermediateDirectory)/src_spi$(ObjectSuffix): src/spi.c  
	$(CC) $(SourceSwitch) src/spi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/src_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_spi$(PreprocessSuffix): src/spi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_spi$(PreprocessSuffix) src/spi.c

$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix): ../Libraries/drivers/wm_adc.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_adc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_adc$(PreprocessSuffix): ../Libraries/drivers/wm_adc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_adc$(PreprocessSuffix) ../Libraries/drivers/wm_adc.c

$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix): ../Libraries/drivers/wm_cpu.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_cpu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_cpu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_cpu$(PreprocessSuffix): ../Libraries/drivers/wm_cpu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_cpu$(PreprocessSuffix) ../Libraries/drivers/wm_cpu.c

$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix): ../Libraries/drivers/wm_gpio.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_gpio$(PreprocessSuffix): ../Libraries/drivers/wm_gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_gpio$(PreprocessSuffix) ../Libraries/drivers/wm_gpio.c

$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix): ../Libraries/drivers/wm_hal.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_hal.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_hal$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_hal$(PreprocessSuffix): ../Libraries/drivers/wm_hal.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_hal$(PreprocessSuffix) ../Libraries/drivers/wm_hal.c

$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix): ../Libraries/drivers/wm_i2c.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_i2c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_i2c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_i2c$(PreprocessSuffix): ../Libraries/drivers/wm_i2c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_i2c$(PreprocessSuffix) ../Libraries/drivers/wm_i2c.c

$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix): ../Libraries/drivers/wm_internal_flash.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_internal_flash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_internal_flash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_internal_flash$(PreprocessSuffix): ../Libraries/drivers/wm_internal_flash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_internal_flash$(PreprocessSuffix) ../Libraries/drivers/wm_internal_flash.c

$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix): ../Libraries/drivers/wm_pmu.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_pmu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_pmu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_pmu$(PreprocessSuffix): ../Libraries/drivers/wm_pmu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_pmu$(PreprocessSuffix) ../Libraries/drivers/wm_pmu.c

$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix): ../Libraries/drivers/wm_pwm.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_pwm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_pwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_pwm$(PreprocessSuffix): ../Libraries/drivers/wm_pwm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_pwm$(PreprocessSuffix) ../Libraries/drivers/wm_pwm.c

$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix): ../Libraries/drivers/wm_spi.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_spi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_spi$(PreprocessSuffix): ../Libraries/drivers/wm_spi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_spi$(PreprocessSuffix) ../Libraries/drivers/wm_spi.c

$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix): ../Libraries/drivers/wm_spi_flash.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_spi_flash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_spi_flash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_spi_flash$(PreprocessSuffix): ../Libraries/drivers/wm_spi_flash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_spi_flash$(PreprocessSuffix) ../Libraries/drivers/wm_spi_flash.c

$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix): ../Libraries/drivers/wm_tim.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_tim.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_tim$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_tim$(PreprocessSuffix): ../Libraries/drivers/wm_tim.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_tim$(PreprocessSuffix) ../Libraries/drivers/wm_tim.c

$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix): ../Libraries/drivers/wm_touch.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_touch.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_touch$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_touch$(PreprocessSuffix): ../Libraries/drivers/wm_touch.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_touch$(PreprocessSuffix) ../Libraries/drivers/wm_touch.c

$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix): ../Libraries/drivers/wm_uart.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_uart$(PreprocessSuffix): ../Libraries/drivers/wm_uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_uart$(PreprocessSuffix) ../Libraries/drivers/wm_uart.c

$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix): ../Libraries/drivers/wm_wdg.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_wdg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_wdg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_wdg$(PreprocessSuffix): ../Libraries/drivers/wm_wdg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_wdg$(PreprocessSuffix) ../Libraries/drivers/wm_wdg.c

$(IntermediateDirectory)/drivers_wm_lcd$(ObjectSuffix): ../Libraries/drivers/wm_lcd.c  
	$(CC) $(SourceSwitch) ../Libraries/drivers/wm_lcd.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_lcd$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_lcd$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_lcd$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_lcd$(PreprocessSuffix): ../Libraries/drivers/wm_lcd.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_lcd$(PreprocessSuffix) ../Libraries/drivers/wm_lcd.c

$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix): ../Libraries/arch/xt804/bsp/board_init.c  
	$(CC) $(SourceSwitch) ../Libraries/arch/xt804/bsp/board_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_board_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_board_init$(PreprocessSuffix): ../Libraries/arch/xt804/bsp/board_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_board_init$(PreprocessSuffix) ../Libraries/arch/xt804/bsp/board_init.c

$(IntermediateDirectory)/bsp_startup$(ObjectSuffix): ../Libraries/arch/xt804/bsp/startup.S  
	$(AS) $(SourceSwitch) ../Libraries/arch/xt804/bsp/startup.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_startup$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_startup$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/bsp_startup$(PreprocessSuffix): ../Libraries/arch/xt804/bsp/startup.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_startup$(PreprocessSuffix) ../Libraries/arch/xt804/bsp/startup.S

$(IntermediateDirectory)/bsp_system$(ObjectSuffix): ../Libraries/arch/xt804/bsp/system.c  
	$(CC) $(SourceSwitch) ../Libraries/arch/xt804/bsp/system.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_system$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_system$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_system$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_system$(PreprocessSuffix): ../Libraries/arch/xt804/bsp/system.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_system$(PreprocessSuffix) ../Libraries/arch/xt804/bsp/system.c

$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix): ../Libraries/arch/xt804/bsp/trap_c.c  
	$(CC) $(SourceSwitch) ../Libraries/arch/xt804/bsp/trap_c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_trap_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_trap_c$(PreprocessSuffix): ../Libraries/arch/xt804/bsp/trap_c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_trap_c$(PreprocessSuffix) ../Libraries/arch/xt804/bsp/trap_c.c

$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix): ../Libraries/arch/xt804/bsp/vectors.S  
	$(AS) $(SourceSwitch) ../Libraries/arch/xt804/bsp/vectors.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_vectors$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/bsp_vectors$(PreprocessSuffix): ../Libraries/arch/xt804/bsp/vectors.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_vectors$(PreprocessSuffix) ../Libraries/arch/xt804/bsp/vectors.S

$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix): ../Libraries/arch/xt804/libc/libc_port.c  
	$(CC) $(SourceSwitch) ../Libraries/arch/xt804/libc/libc_port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_libc_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_libc_port$(PreprocessSuffix): ../Libraries/arch/xt804/libc/libc_port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_libc_port$(PreprocessSuffix) ../Libraries/arch/xt804/libc/libc_port.c

$(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix): ../Libraries/component/FreeRTOS/croutine.c  
	$(CC) $(SourceSwitch) ../Libraries/component/FreeRTOS/croutine.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_croutine$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_croutine$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_croutine$(PreprocessSuffix): ../Libraries/component/FreeRTOS/croutine.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_croutine$(PreprocessSuffix) ../Libraries/component/FreeRTOS/croutine.c

$(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix): ../Libraries/component/FreeRTOS/event_groups.c  
	$(CC) $(SourceSwitch) ../Libraries/component/FreeRTOS/event_groups.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_event_groups$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_event_groups$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_event_groups$(PreprocessSuffix): ../Libraries/component/FreeRTOS/event_groups.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_event_groups$(PreprocessSuffix) ../Libraries/component/FreeRTOS/event_groups.c

$(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix): ../Libraries/component/FreeRTOS/list.c  
	$(CC) $(SourceSwitch) ../Libraries/component/FreeRTOS/list.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_list$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_list$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_list$(PreprocessSuffix): ../Libraries/component/FreeRTOS/list.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_list$(PreprocessSuffix) ../Libraries/component/FreeRTOS/list.c

$(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix): ../Libraries/component/FreeRTOS/queue.c  
	$(CC) $(SourceSwitch) ../Libraries/component/FreeRTOS/queue.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_queue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_queue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_queue$(PreprocessSuffix): ../Libraries/component/FreeRTOS/queue.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_queue$(PreprocessSuffix) ../Libraries/component/FreeRTOS/queue.c

$(IntermediateDirectory)/FreeRTOS_stream_buffer$(ObjectSuffix): ../Libraries/component/FreeRTOS/stream_buffer.c  
	$(CC) $(SourceSwitch) ../Libraries/component/FreeRTOS/stream_buffer.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_stream_buffer$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_stream_buffer$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_stream_buffer$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_stream_buffer$(PreprocessSuffix): ../Libraries/component/FreeRTOS/stream_buffer.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_stream_buffer$(PreprocessSuffix) ../Libraries/component/FreeRTOS/stream_buffer.c

$(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix): ../Libraries/component/FreeRTOS/tasks.c  
	$(CC) $(SourceSwitch) ../Libraries/component/FreeRTOS/tasks.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_tasks$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_tasks$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_tasks$(PreprocessSuffix): ../Libraries/component/FreeRTOS/tasks.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_tasks$(PreprocessSuffix) ../Libraries/component/FreeRTOS/tasks.c

$(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix): ../Libraries/component/FreeRTOS/timers.c  
	$(CC) $(SourceSwitch) ../Libraries/component/FreeRTOS/timers.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix) -MF$(IntermediateDirectory)/FreeRTOS_timers$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/FreeRTOS_timers$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/FreeRTOS_timers$(PreprocessSuffix): ../Libraries/component/FreeRTOS/timers.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/FreeRTOS_timers$(PreprocessSuffix) ../Libraries/component/FreeRTOS/timers.c

$(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix): ../Libraries/component/FreeRTOS/portable/xt804/cpu_task_sw.S  
	$(AS) $(SourceSwitch) ../Libraries/component/FreeRTOS/portable/xt804/cpu_task_sw.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix) -MF$(IntermediateDirectory)/xt804_cpu_task_sw$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/xt804_cpu_task_sw$(PreprocessSuffix): ../Libraries/component/FreeRTOS/portable/xt804/cpu_task_sw.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/xt804_cpu_task_sw$(PreprocessSuffix) ../Libraries/component/FreeRTOS/portable/xt804/cpu_task_sw.S

$(IntermediateDirectory)/xt804_port$(ObjectSuffix): ../Libraries/component/FreeRTOS/portable/xt804/port.c  
	$(CC) $(SourceSwitch) ../Libraries/component/FreeRTOS/portable/xt804/port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/xt804_port$(ObjectSuffix) -MF$(IntermediateDirectory)/xt804_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/xt804_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/xt804_port$(PreprocessSuffix): ../Libraries/component/FreeRTOS/portable/xt804/port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/xt804_port$(PreprocessSuffix) ../Libraries/component/FreeRTOS/portable/xt804/port.c

$(IntermediateDirectory)/MemMang_heap_5$(ObjectSuffix): ../Libraries/component/FreeRTOS/portable/MemMang/heap_5.c  
	$(CC) $(SourceSwitch) ../Libraries/component/FreeRTOS/portable/MemMang/heap_5.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/MemMang_heap_5$(ObjectSuffix) -MF$(IntermediateDirectory)/MemMang_heap_5$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/MemMang_heap_5$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/MemMang_heap_5$(PreprocessSuffix): ../Libraries/component/FreeRTOS/portable/MemMang/heap_5.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/MemMang_heap_5$(PreprocessSuffix) ../Libraries/component/FreeRTOS/portable/MemMang/heap_5.c


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S

-include $(IntermediateDirectory)/*$(DependSuffix)
