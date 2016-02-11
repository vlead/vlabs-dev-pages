BUILD=./build
DEST=${BUILD}/prj

all:  publish

publish: 
	emacs --script elisp/prj.el

clean:
	rm -rf ${BUILD}


export:
	rsync -avz ${DEST} www.iiit.ac.in:/home/faculty_website/choppell/data


pascal:
	rsync -avz ${DEST}/* pascal.iiit.ac.in:/home/choppell/public_html

