Number Sayer
============

If you give an arabic number to the form, the system shows the english phrase
of the number.


For example:

    7    == seven
    42   == forty-two
    2001 == two thousand and one
    1999 == nineteen hundred and ninety-nine

Also the application can show numbers in two dialect: UK English and US English,
you can just select them from the dropdown.


Statuses
--------
[![Build
Status](https://travis-ci.org/hron84/numbersayer.png?branch=master)](https://travis-ci.org/hron84/numbersayer)


Known bugs / limitations
------------------------

The application currently supports numbers up to 9 999 999 999 above this limit
it should make a serious mistakes in phrasing.
Application also does not know the 'billion' phrase because it should confuse 
some external language speakers where billion is equals to 10^12 and not 10^9
(known example is Hungarian).

Licensing
---------

Copyright (c) 2013 Gabor Garami

The code and design is licensed under Public Domain. See LICENSE file for details.
