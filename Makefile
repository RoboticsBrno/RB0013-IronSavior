all: build/gerbers

build:
	mkdir -p build

build/panel.kicad_pcb: build IronSaviorPCB/IronSaviorPCB.kicad_pcb
	kikit panelize \
		--layout 'rows: 5; cols: 3' \
		--cuts 'vcuts; layer: Edge.Cuts' \
		--framing 'frame; space: 0mm; mintotalheight: 70mm; mintotalwidth: 70mm' \
		IronSaviorPCB/IronSaviorPCB.kicad_pcb build/panel.kicad_pcb

build/gerbers: build/panel.kicad_pcb
	kikit fab jlcpcb --no-drc $< build/gerbers
