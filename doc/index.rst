.. _weact_stm32g474_long:

WeAct Studio STM32G474 Core Board
#################################

The WeAct STM32G474 Core Board is a low-cost bare-bones STM32G474-based development
board. See the `STM32G431CB474CE website`_ for more information about the MCU. More information
about the board, including schematics, is available from the `WeAct GitHub`_. This also applies
to the "long" version of the board as well.


Supported Features
==================

The Zephyr weact_stm32g474_core board configuration supports the following hardware
features:

+------------+------------+-------------------------------------+
| Interface  | Controller | Driver/Component                    |
+============+============+=====================================+
| NVIC       | on-chip    | nested vector interrupt controller  |
+------------+------------+-------------------------------------+
| UART       | on-chip    | serial port                         |
+------------+------------+-------------------------------------+
| GPIO       | on-chip    | gpio                                |
+------------+------------+-------------------------------------+
| ADC        | on-chip    | ADC Controller                      |
+------------+------------+-------------------------------------+
| USB        | on-chip    | USB device                          |
+------------+------------+-------------------------------------+
| UCPD       | on-chip    | ucpd                                |
+------------+------------+-------------------------------------+
| CAN        | on-chip    | can                                 |
+------------+------------+-------------------------------------+

The default configuration can be found in the defconfig file:

:zephyr_file:`boards/weact/stm32g474_core/weact_stm32g474_core_defconfig`

Pin Mapping
===========

Default Zephyr Peripheral Mapping:
----------------------------------

- UART_2 TX/RX   : PA2/PA3
- BUTTON (User)  : PC13
- BUTTON (BOOT0) : PB8
- LED0           : PC6
- ADC (VBUS)     : PB2

The ADC is disabled by default since the VBUS voltage divider is not connected in the
board's standard configuration.


Clock Sources
-------------

The board has two external oscillators. The frequency of the slow clock (LSE) is 32.768
kHz. The frequency of the main clock (HSE) is 8 MHz.

The default configuration sources the system clock from the PLL, which is derived from
HSE, and is set at 170 MHz. The 48 MHz clock used by the USB interface is derived from the
PLL instead of the internal 48 MHz oscillator.

Programming and Debugging
*************************

The MCU is normally programmed using the ROM bootloader or the exposed SWD port.

Please note that some laptops may not detect the ROM bootloader correctly if the CCx
pull-downs have been disconnected by opening SB8 and SB9 unless dead battery support has
been enabled by closing SB3 and SB5. A USB-C to USB-A adapter can be used as a workaround
if this is a problem.

Flashing an Application
=======================

Connect a USB-C cable and the board should power ON. Force the board into DFU mode by
keeping the BOOT0 switch pressed while pressing and releasing the NRST switch.

The dfu-util runner is supported on this board and so a sample can be built and tested
easily.

.. zephyr-app-commands::
   :zephyr-app: samples/basic/blinky
   :board: weact_stm32g431_core
   :goals: build flash

Debugging
=========

The board can be debugged by installing the included 100 mil (0.1 inch) header, and
attaching an SWD debugger to the 3V3 (3.3V), GND, SCK, and DIO pins on that header.


References
**********

.. target-notes::

.. _WeAct GitHub:
   https://github.com/WeActStudio/WeActStudio.STM32G474CoreBoard

.. _STM32G474CE website:
   https://www.st.com/en/microcontrollers-microprocessors/stm32g474ce.html

.. _STM32G4 reference manual:
   https://www.st.com/resource/en/reference_manual/rm0440-stm32g4-series-advanced-armbased-32bit-mcus-stmicroelectronics.pdf
