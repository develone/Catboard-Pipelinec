################################################################################
## 
## Filename: 	rtl/basic/Makefile
##
## Project:	ICO Zip, iCE40 ZipCPU demonsrtation project
##
## Purpose:	To direct the build of the files in the rtl/basic directory!
##
## Creator:	Dan Gisselquist, Ph.D.
##		Gisselquist Technology, LLC
##
################################################################################
##
## Copyright (C) 2016-2017, Gisselquist Technology, LLC
##
## This program is free software (firmware): you can redistribute it and/or
## modify it under the terms of  the GNU General Public License as published
## by the Free Software Foundation, either version 3 of the License, or (at
## your option) any later version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
## FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
## for more details.
##
## You should have received a copy of the GNU General Public License along
## with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
## target there if the PDF file isn't present.)  If not, see
## <http://www.gnu.org/licenses/> for a copy.
##
## License:	GPL, v3, as defined and found on www.gnu.org,
##		http://www.gnu.org/licenses/gpl.html
##
##
################################################################################
##
##
#all: blinky pmodtest clktest dimmer
all: blinky clktest dimmer pmodtest

# GNU Make automatic variables (since I can never remember these ...)
# $@	- name of the target
# $<	- Name of the first prerequisite
# $^	- Names of all the prerequisites
%.blif: %.v
	#yosys -p 'synth_ice40 -blif $@' $<
	#yosys -l simple.log -p 'synth_ice40 -blif $@ -json $@' $<
	yosys -l simple.log -p 'synth_ice40 -blif $@ -json $*.json' $<
%.asc: %.blif %.pcf
	#arachne-pnr -d 8k -p $*.pcf -o $@ $<
	nextpnr-ice40 --hx8k --pcf $*.pcf --json $*.json --asc $*.asc 
%.bin: %.asc
	icetime -d hx8k -c 80 $<
	icepack $< $@

.PHONY: blinky pmodtest clktest
blinky:     blinky.bin
clktest:    clktest.bin
pmodtest:   pmodtest.bin
dimmer:     dimmer.bin

.PHONY: load
load: blinky.bin
	icoprog -p < blinky.bin # Needs sudo

clean:
	rm -f *.blif *.asc *.bin *.json
	# rm -rf obj_dir

