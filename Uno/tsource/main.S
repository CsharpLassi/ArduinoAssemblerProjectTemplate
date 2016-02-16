;Einstiegspunkt und Interrupt
.org 0x0000
rjmp main
rjmp stdhandler ;ExInt 0
rjmp stdhandler ;ExInt 1
rjmp stdhandler ;PinChange 0
rjmp stdhandler ;PinChange 1
rjmp stdhandler ;PinChange 2
rjmp stdhandler ;WDT
rjmp stdhandler ;Timer2 CompA
rjmp stdhandler ;Timer2 CompB
rjmp stdhandler ;Timer2 OVF
rjmp stdhandler ;Timer1 CAPT
rjmp stdhandler ;Timer1 CompA
rjmp stdhandler ;Timer1 CompB
rjmp stdhandler ;Timer1 OVF
rjmp stdhandler ;Timer0 CompA
rjmp stdhandler ;Timer0 CompB
rjmp stdhandler ;Timer0 OVF
rjmp stdhandler ;SPI STC
rjmp stdhandler ;USART, RX Complete
rjmp stdhandler ;USART, Data Register Empty
rjmp stdhandler ;USART, TX Complete 
rjmp stdhandler ;ADC Conversion Complete
rjmp stdhandler ;EEPROM Ready
rjmp stdhandler ;AnalogComperator
rjmp stdhandler ;2-wire Interface
rjmp stdhandler ;Store Program Memory Ready

.include "m328Pdef.S" 
.include "parameter.S"
.include "lowuart.S"

main:
	;Ram
	ldi temp , hi8(RAMEND)
	out SPH  , temp
	ldi temp , lo8(RAMEND)
	out SPL  , temp

	rcall Uart_Init
	
loop:
	ldi 30, lo8(txt_hello)
	ldi 31, hi8(txt_hello)
	rcall   print
	rjmp    loop
 
stdhandler:
	reti

txt_hello: .asciz "Hello World\n\r"
