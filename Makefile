export PATH := $(PATH):node_modules/.bin:bin

default: project.mml

xml: project.xml

# symlink into TileMill's project folder (if TM is installed)
link:
	@test -e ${HOME}/Documents/MapBox/project && \
	test -e ${HOME}/Documents/MapBox/project/openterrain || \
	ln -sf "`pwd`" ${HOME}/Documents/MapBox/project/openterrain

.PHONY: clean

clean:
	@rm -f *.mml *.xml

.PRECIOUS: %.mml %.xml

%.mml: %.yml *.mss interp js-yaml
	@cat $< | interp | js-yaml > tmp.mml && mv tmp.mml $@

%.xml: %.mml carto
	@carto -l $< > $@ || (rm -f $@; false)

.PHONY: carto interp js-yaml

carto: node_modules/carto/package.json

interp: node_modules/interp/package.json
	 
js-yaml: node_modules/js-yaml/package.json

node_modules/carto/package.json: PKG = $(word 2,$(subst /, ,$@))
node_modules/carto/package.json: node_modules/millstone/package.json
	@type node > /dev/null 2>&1 || (echo "Please install Node.js" && false)
	@echo "Installing $(PKG)"
	@npm install $(PKG)

node_modules/interp/package.json: PKG = $(word 2,$(subst /, ,$@))
node_modules/interp/package.json:
	@type node > /dev/null 2>&1 || (echo "Please install Node.js" && false)
	@echo "Installing $(PKG)"
	@npm install $(PKG)

node_modules/js-yaml/package.json: PKG = $(word 2,$(subst /, ,$@))
node_modules/js-yaml/package.json:
	@type node > /dev/null 2>&1 || (echo "Please install Node.js" && false)
	@echo "Installing $(PKG)"
	@npm install $(PKG)

node_modules/millstone/package.json: PKG = $(word 2,$(subst /, ,$@))
node_modules/millstone/package.json:
	@type node > /dev/null 2>&1 || (echo "Please install Node.js" && false)
	@echo "Installing $(PKG)"
	@npm install $(PKG)
