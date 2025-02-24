YOSYS = $(OSS_CAD_SUITE)/bin/yosys
NEXTPNR = $(OSS_CAD_SUITE)/bin/nextpnr-ice40
ICEPLL = $(OSS_CAD_SUITE)/bin/icepll
ICEPACK = $(OSS_CAD_SUITE)/bin/icepack
ICEPLL = $(OSS_CAD_SUITE)/bin/icepll
DFU_UTIL = $(OSS_CAD_SUITE)/bin/dfu-util
BIN2UF2 = bin2uf2
PIPELINEC = $(PIPELINEC_REPO)/src/pipelinec
NEXTPNR_FREQ ?= $(PLL_CLK_MHZ)
NEXTPNR_ARGS ?= --freq $(NEXTPNR_FREQ)
# Only one PLL producing one clock in design for now...
PLL_CLK_MHZ ?= 25.0
all: pipelinec gateware.bin

clean:
	$(RM) pll.v
	$(RM) *.json *.asc *.bin *.uf2
	$(RM) pll_clk_mhz.h
	$(RM) yosys_stderr.log
	$(RM) pipelinec.log
	$(RM) -r pipelinec_output
	$(RM) lextab.py
	$(RM) yacctab.py
	$(RM) dfu_util.log

prog: gateware.bin
	$(RM) dfu_util.log
	sudo $(DFU_UTIL) -d 1209:b1c0 -a 1 -D gateware.bin -R > dfu_util.log

gateware.bin: top.sv
	$(ICEPLL) -q -i 100 -o $(PLL_CLK_MHZ)  -m -f pll.v
	$(YOSYS) -l simple.log -q -m ghdl -p "ghdl --std=08 -frelaxed `cat pipelinec_output/vhdl_files.txt` -e pipelinec_top; read_verilog -sv top.sv pll.v; synth_ice40 -top top -json $*.json" 2> yosys_stderr.log
	$(NEXTPNR) -l nextpnr.log -q --randomize-seed --hx8k --package ct256 --pcf ice40.pcf --json $*.json --asc $*.asc
	$(ICEPACK) $*.asc $@

.bin.uf2:
	$(BIN2UF2) -o $@ $<

pipelinec:
	echo "#define PLL_CLK_MHZ $(PLL_CLK_MHZ)\n" > pll_clk_mhz.h
	$(PIPELINEC) top.c --top pipelinec_top --out_dir pipelinec_output --comb --no_synth > pipelinec.log

.SUFFIXES: .v .sv .asc .bin .uf2
