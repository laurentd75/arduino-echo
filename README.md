Title: arduino-echo

This code is for testing bi-directional communication between a PC
and an Arduino board over USB at 1Mbits / second.

Prerequisite:
* the gcc-avr Debian package
* the avr-libc Debian package
* the avrdude Debian package
* the `pyserial` pypi package to run test.py

To build and upload the firmware to the Arduino:

  $ make flash

To test the serial line:

  $ python test.py

This relates to the following [blog post][1].

[1]: http://www.florentflament.com/blog/arduino-hello-world-without-ide.html
