all: build/gerbers

build:
	mkdir -p build

build/panel.kicad_pcb: build IronSaviorPCB/IronSaviorPCB.kicad_pcb
	kikit panelize \
		--layout 'rows: 3; cols: 2' \
		--cuts 'vcuts' \
		--framing 'frame; space: 0mm' \
		IronSaviorPCB/IronSaviorPCB.kicad_pcb build/panel.kicad_pcb

build/gerbers: build/panel.kicad_pcb
	kikit fab jlcpcb --no-drc $< build/gerbers
