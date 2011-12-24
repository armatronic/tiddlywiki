# Start at a Makefile or managing build activities.
# Expects a 'cook' script somewhere on the $PATH.
# See 'cook' in this directory for a sample you can use.
# For now users the OSX specific "open" to run a test file. This
# will need to change.
#

clean:
	rm cooked/*.html || true
	rm cooked/*.jar || true
	rm cooked/*.js || true
	rmdir cooked || true

test: clean tests.html
	ln -sf $(PWD)/test/recipes/sample.txt sample.txt
	cp $(PWD)/test/recipes/sample.txt cooked/sample.txt
	ln -sf $(PWD)/java/TiddlySaver.jar cooked/TiddlySaver.jar
	open cooked/tests.html

tests.html:
	mkdir -p cooked
	cook $(PWD)/test/recipes/tests.html.recipe -d $(PWD)/cooked -o tests.html

alpha:
	./bldalpha
