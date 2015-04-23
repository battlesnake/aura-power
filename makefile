views=$(wildcard *.scad)
stls=$(views:%.scad=stl/%.stl)

default: $(stls)

stl/%.stl: %.scad
	openscad -o $@ $<

clean:
	rm -f -- stl/*.stl
