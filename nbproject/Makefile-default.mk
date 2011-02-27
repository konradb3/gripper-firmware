#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 
# Macros
CND_CONF=default

ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/gripper_firmware.X.${IMAGE_TYPE}.elf
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/gripper_firmware.X.${IMAGE_TYPE}.elf
endif
# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}
# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/adc.o ${OBJECTDIR}/crc.o ${OBJECTDIR}/timer.o ${OBJECTDIR}/uart.o ${OBJECTDIR}/pwm.o ${OBJECTDIR}/abs_enc.o ${OBJECTDIR}/control.o ${OBJECTDIR}/serial.o ${OBJECTDIR}/qei.o ${OBJECTDIR}/main.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

OS_ORIGINAL="Linux"
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=/opt/microchip/mplabc30/v3.24/bin/pic30-gcc
MP_AS=/opt/microchip/mplabc30/v3.24/bin/pic30-as
MP_LD=/opt/microchip/mplabc30/v3.24/bin/pic30-ld
MP_AR=/opt/microchip/mplabc30/v3.24/bin/pic30-ar
MP_CC_DIR=/opt/microchip/mplabc30/v3.24/bin
MP_AS_DIR=/opt/microchip/mplabc30/v3.24/bin
MP_LD_DIR=/opt/microchip/mplabc30/v3.24/bin
MP_AR_DIR=/opt/microchip/mplabc30/v3.24/bin
.build-conf: ${BUILD_SUBPROJECTS}
ifneq ($(OS_CURRENT),$(OS_ORIGINAL))
	@echo "***** WARNING: This make file contains OS dependent code. The OS this makefile is being run is different from the OS it was created in."
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/gripper_firmware.X.${IMAGE_TYPE}.elf

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/adc.o: adc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/adc.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/adc.o.d -o ${OBJECTDIR}/adc.o adc.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/adc.o.d > ${OBJECTDIR}/adc.o.tmp
	${RM} ${OBJECTDIR}/adc.o.d 
	${CP} ${OBJECTDIR}/adc.o.tmp ${OBJECTDIR}/adc.o.d 
	${RM} ${OBJECTDIR}/adc.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/adc.o.d > ${OBJECTDIR}/adc.o.tmp
	${RM} ${OBJECTDIR}/adc.o.d 
	${CP} ${OBJECTDIR}/adc.o.tmp ${OBJECTDIR}/adc.o.d 
	${RM} ${OBJECTDIR}/adc.o.tmp}
endif
${OBJECTDIR}/crc.o: crc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/crc.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/crc.o.d -o ${OBJECTDIR}/crc.o crc.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/crc.o.d > ${OBJECTDIR}/crc.o.tmp
	${RM} ${OBJECTDIR}/crc.o.d 
	${CP} ${OBJECTDIR}/crc.o.tmp ${OBJECTDIR}/crc.o.d 
	${RM} ${OBJECTDIR}/crc.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/crc.o.d > ${OBJECTDIR}/crc.o.tmp
	${RM} ${OBJECTDIR}/crc.o.d 
	${CP} ${OBJECTDIR}/crc.o.tmp ${OBJECTDIR}/crc.o.d 
	${RM} ${OBJECTDIR}/crc.o.tmp}
endif
${OBJECTDIR}/timer.o: timer.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/timer.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/timer.o.d -o ${OBJECTDIR}/timer.o timer.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/timer.o.d > ${OBJECTDIR}/timer.o.tmp
	${RM} ${OBJECTDIR}/timer.o.d 
	${CP} ${OBJECTDIR}/timer.o.tmp ${OBJECTDIR}/timer.o.d 
	${RM} ${OBJECTDIR}/timer.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/timer.o.d > ${OBJECTDIR}/timer.o.tmp
	${RM} ${OBJECTDIR}/timer.o.d 
	${CP} ${OBJECTDIR}/timer.o.tmp ${OBJECTDIR}/timer.o.d 
	${RM} ${OBJECTDIR}/timer.o.tmp}
endif
${OBJECTDIR}/uart.o: uart.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/uart.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/uart.o.d -o ${OBJECTDIR}/uart.o uart.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart.o.d > ${OBJECTDIR}/uart.o.tmp
	${RM} ${OBJECTDIR}/uart.o.d 
	${CP} ${OBJECTDIR}/uart.o.tmp ${OBJECTDIR}/uart.o.d 
	${RM} ${OBJECTDIR}/uart.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/uart.o.d > ${OBJECTDIR}/uart.o.tmp
	${RM} ${OBJECTDIR}/uart.o.d 
	${CP} ${OBJECTDIR}/uart.o.tmp ${OBJECTDIR}/uart.o.d 
	${RM} ${OBJECTDIR}/uart.o.tmp}
endif
${OBJECTDIR}/pwm.o: pwm.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/pwm.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/pwm.o.d -o ${OBJECTDIR}/pwm.o pwm.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/pwm.o.d > ${OBJECTDIR}/pwm.o.tmp
	${RM} ${OBJECTDIR}/pwm.o.d 
	${CP} ${OBJECTDIR}/pwm.o.tmp ${OBJECTDIR}/pwm.o.d 
	${RM} ${OBJECTDIR}/pwm.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/pwm.o.d > ${OBJECTDIR}/pwm.o.tmp
	${RM} ${OBJECTDIR}/pwm.o.d 
	${CP} ${OBJECTDIR}/pwm.o.tmp ${OBJECTDIR}/pwm.o.d 
	${RM} ${OBJECTDIR}/pwm.o.tmp}
endif
${OBJECTDIR}/abs_enc.o: abs_enc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/abs_enc.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/abs_enc.o.d -o ${OBJECTDIR}/abs_enc.o abs_enc.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/abs_enc.o.d > ${OBJECTDIR}/abs_enc.o.tmp
	${RM} ${OBJECTDIR}/abs_enc.o.d 
	${CP} ${OBJECTDIR}/abs_enc.o.tmp ${OBJECTDIR}/abs_enc.o.d 
	${RM} ${OBJECTDIR}/abs_enc.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/abs_enc.o.d > ${OBJECTDIR}/abs_enc.o.tmp
	${RM} ${OBJECTDIR}/abs_enc.o.d 
	${CP} ${OBJECTDIR}/abs_enc.o.tmp ${OBJECTDIR}/abs_enc.o.d 
	${RM} ${OBJECTDIR}/abs_enc.o.tmp}
endif
${OBJECTDIR}/control.o: control.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/control.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/control.o.d -o ${OBJECTDIR}/control.o control.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/control.o.d > ${OBJECTDIR}/control.o.tmp
	${RM} ${OBJECTDIR}/control.o.d 
	${CP} ${OBJECTDIR}/control.o.tmp ${OBJECTDIR}/control.o.d 
	${RM} ${OBJECTDIR}/control.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/control.o.d > ${OBJECTDIR}/control.o.tmp
	${RM} ${OBJECTDIR}/control.o.d 
	${CP} ${OBJECTDIR}/control.o.tmp ${OBJECTDIR}/control.o.d 
	${RM} ${OBJECTDIR}/control.o.tmp}
endif
${OBJECTDIR}/serial.o: serial.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/serial.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/serial.o.d -o ${OBJECTDIR}/serial.o serial.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/serial.o.d > ${OBJECTDIR}/serial.o.tmp
	${RM} ${OBJECTDIR}/serial.o.d 
	${CP} ${OBJECTDIR}/serial.o.tmp ${OBJECTDIR}/serial.o.d 
	${RM} ${OBJECTDIR}/serial.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/serial.o.d > ${OBJECTDIR}/serial.o.tmp
	${RM} ${OBJECTDIR}/serial.o.d 
	${CP} ${OBJECTDIR}/serial.o.tmp ${OBJECTDIR}/serial.o.d 
	${RM} ${OBJECTDIR}/serial.o.tmp}
endif
${OBJECTDIR}/qei.o: qei.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/qei.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/qei.o.d -o ${OBJECTDIR}/qei.o qei.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/qei.o.d > ${OBJECTDIR}/qei.o.tmp
	${RM} ${OBJECTDIR}/qei.o.d 
	${CP} ${OBJECTDIR}/qei.o.tmp ${OBJECTDIR}/qei.o.d 
	${RM} ${OBJECTDIR}/qei.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/qei.o.d > ${OBJECTDIR}/qei.o.tmp
	${RM} ${OBJECTDIR}/qei.o.d 
	${CP} ${OBJECTDIR}/qei.o.tmp ${OBJECTDIR}/qei.o.d 
	${RM} ${OBJECTDIR}/qei.o.tmp}
endif
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/main.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/main.o.d -o ${OBJECTDIR}/main.o main.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/main.o.d > ${OBJECTDIR}/main.o.tmp
	${RM} ${OBJECTDIR}/main.o.d 
	${CP} ${OBJECTDIR}/main.o.tmp ${OBJECTDIR}/main.o.d 
	${RM} ${OBJECTDIR}/main.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/main.o.d > ${OBJECTDIR}/main.o.tmp
	${RM} ${OBJECTDIR}/main.o.d 
	${CP} ${OBJECTDIR}/main.o.tmp ${OBJECTDIR}/main.o.d 
	${RM} ${OBJECTDIR}/main.o.tmp}
endif
else
${OBJECTDIR}/adc.o: adc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/adc.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/adc.o.d -o ${OBJECTDIR}/adc.o adc.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/adc.o.d > ${OBJECTDIR}/adc.o.tmp
	${RM} ${OBJECTDIR}/adc.o.d 
	${CP} ${OBJECTDIR}/adc.o.tmp ${OBJECTDIR}/adc.o.d 
	${RM} ${OBJECTDIR}/adc.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/adc.o.d > ${OBJECTDIR}/adc.o.tmp
	${RM} ${OBJECTDIR}/adc.o.d 
	${CP} ${OBJECTDIR}/adc.o.tmp ${OBJECTDIR}/adc.o.d 
	${RM} ${OBJECTDIR}/adc.o.tmp}
endif
${OBJECTDIR}/crc.o: crc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/crc.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/crc.o.d -o ${OBJECTDIR}/crc.o crc.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/crc.o.d > ${OBJECTDIR}/crc.o.tmp
	${RM} ${OBJECTDIR}/crc.o.d 
	${CP} ${OBJECTDIR}/crc.o.tmp ${OBJECTDIR}/crc.o.d 
	${RM} ${OBJECTDIR}/crc.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/crc.o.d > ${OBJECTDIR}/crc.o.tmp
	${RM} ${OBJECTDIR}/crc.o.d 
	${CP} ${OBJECTDIR}/crc.o.tmp ${OBJECTDIR}/crc.o.d 
	${RM} ${OBJECTDIR}/crc.o.tmp}
endif
${OBJECTDIR}/timer.o: timer.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/timer.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/timer.o.d -o ${OBJECTDIR}/timer.o timer.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/timer.o.d > ${OBJECTDIR}/timer.o.tmp
	${RM} ${OBJECTDIR}/timer.o.d 
	${CP} ${OBJECTDIR}/timer.o.tmp ${OBJECTDIR}/timer.o.d 
	${RM} ${OBJECTDIR}/timer.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/timer.o.d > ${OBJECTDIR}/timer.o.tmp
	${RM} ${OBJECTDIR}/timer.o.d 
	${CP} ${OBJECTDIR}/timer.o.tmp ${OBJECTDIR}/timer.o.d 
	${RM} ${OBJECTDIR}/timer.o.tmp}
endif
${OBJECTDIR}/uart.o: uart.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/uart.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/uart.o.d -o ${OBJECTDIR}/uart.o uart.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/uart.o.d > ${OBJECTDIR}/uart.o.tmp
	${RM} ${OBJECTDIR}/uart.o.d 
	${CP} ${OBJECTDIR}/uart.o.tmp ${OBJECTDIR}/uart.o.d 
	${RM} ${OBJECTDIR}/uart.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/uart.o.d > ${OBJECTDIR}/uart.o.tmp
	${RM} ${OBJECTDIR}/uart.o.d 
	${CP} ${OBJECTDIR}/uart.o.tmp ${OBJECTDIR}/uart.o.d 
	${RM} ${OBJECTDIR}/uart.o.tmp}
endif
${OBJECTDIR}/pwm.o: pwm.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/pwm.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/pwm.o.d -o ${OBJECTDIR}/pwm.o pwm.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/pwm.o.d > ${OBJECTDIR}/pwm.o.tmp
	${RM} ${OBJECTDIR}/pwm.o.d 
	${CP} ${OBJECTDIR}/pwm.o.tmp ${OBJECTDIR}/pwm.o.d 
	${RM} ${OBJECTDIR}/pwm.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/pwm.o.d > ${OBJECTDIR}/pwm.o.tmp
	${RM} ${OBJECTDIR}/pwm.o.d 
	${CP} ${OBJECTDIR}/pwm.o.tmp ${OBJECTDIR}/pwm.o.d 
	${RM} ${OBJECTDIR}/pwm.o.tmp}
endif
${OBJECTDIR}/abs_enc.o: abs_enc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/abs_enc.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/abs_enc.o.d -o ${OBJECTDIR}/abs_enc.o abs_enc.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/abs_enc.o.d > ${OBJECTDIR}/abs_enc.o.tmp
	${RM} ${OBJECTDIR}/abs_enc.o.d 
	${CP} ${OBJECTDIR}/abs_enc.o.tmp ${OBJECTDIR}/abs_enc.o.d 
	${RM} ${OBJECTDIR}/abs_enc.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/abs_enc.o.d > ${OBJECTDIR}/abs_enc.o.tmp
	${RM} ${OBJECTDIR}/abs_enc.o.d 
	${CP} ${OBJECTDIR}/abs_enc.o.tmp ${OBJECTDIR}/abs_enc.o.d 
	${RM} ${OBJECTDIR}/abs_enc.o.tmp}
endif
${OBJECTDIR}/control.o: control.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/control.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/control.o.d -o ${OBJECTDIR}/control.o control.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/control.o.d > ${OBJECTDIR}/control.o.tmp
	${RM} ${OBJECTDIR}/control.o.d 
	${CP} ${OBJECTDIR}/control.o.tmp ${OBJECTDIR}/control.o.d 
	${RM} ${OBJECTDIR}/control.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/control.o.d > ${OBJECTDIR}/control.o.tmp
	${RM} ${OBJECTDIR}/control.o.d 
	${CP} ${OBJECTDIR}/control.o.tmp ${OBJECTDIR}/control.o.d 
	${RM} ${OBJECTDIR}/control.o.tmp}
endif
${OBJECTDIR}/serial.o: serial.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/serial.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/serial.o.d -o ${OBJECTDIR}/serial.o serial.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/serial.o.d > ${OBJECTDIR}/serial.o.tmp
	${RM} ${OBJECTDIR}/serial.o.d 
	${CP} ${OBJECTDIR}/serial.o.tmp ${OBJECTDIR}/serial.o.d 
	${RM} ${OBJECTDIR}/serial.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/serial.o.d > ${OBJECTDIR}/serial.o.tmp
	${RM} ${OBJECTDIR}/serial.o.d 
	${CP} ${OBJECTDIR}/serial.o.tmp ${OBJECTDIR}/serial.o.d 
	${RM} ${OBJECTDIR}/serial.o.tmp}
endif
${OBJECTDIR}/qei.o: qei.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/qei.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/qei.o.d -o ${OBJECTDIR}/qei.o qei.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/qei.o.d > ${OBJECTDIR}/qei.o.tmp
	${RM} ${OBJECTDIR}/qei.o.d 
	${CP} ${OBJECTDIR}/qei.o.tmp ${OBJECTDIR}/qei.o.d 
	${RM} ${OBJECTDIR}/qei.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/qei.o.d > ${OBJECTDIR}/qei.o.tmp
	${RM} ${OBJECTDIR}/qei.o.d 
	${CP} ${OBJECTDIR}/qei.o.tmp ${OBJECTDIR}/qei.o.d 
	${RM} ${OBJECTDIR}/qei.o.tmp}
endif
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/main.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ64MC202  -MMD -MF ${OBJECTDIR}/main.o.d -o ${OBJECTDIR}/main.o main.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/main.o.d > ${OBJECTDIR}/main.o.tmp
	${RM} ${OBJECTDIR}/main.o.d 
	${CP} ${OBJECTDIR}/main.o.tmp ${OBJECTDIR}/main.o.d 
	${RM} ${OBJECTDIR}/main.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/main.o.d > ${OBJECTDIR}/main.o.tmp
	${RM} ${OBJECTDIR}/main.o.d 
	${CP} ${OBJECTDIR}/main.o.tmp ${OBJECTDIR}/main.o.d 
	${RM} ${OBJECTDIR}/main.o.tmp}
endif
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/gripper_firmware.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC}  -omf=elf  -mcpu=33FJ64MC202  -D__DEBUG -D__MPLAB_DEBUGGER_ICD2=1 -o dist/${CND_CONF}/${IMAGE_TYPE}/gripper_firmware.X.${IMAGE_TYPE}.elf ${OBJECTFILES}      -Wl,--defsym=__MPLAB_BUILD=1,-Tp33FJ64MC202.gld,--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD2=1,-l"dsp"
else
dist/${CND_CONF}/${IMAGE_TYPE}/gripper_firmware.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC}  -omf=elf  -mcpu=33FJ64MC202  -o dist/${CND_CONF}/${IMAGE_TYPE}/gripper_firmware.X.${IMAGE_TYPE}.elf ${OBJECTFILES}      -Wl,--defsym=__MPLAB_BUILD=1,-Tp33FJ64MC202.gld,-l"dsp"
	${MP_CC_DIR}/pic30-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/gripper_firmware.X.${IMAGE_TYPE}.elf -omf=elf
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist
# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
