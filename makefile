BUILD=./build
SRC=${BUILD}/prj/
DEST_HOST="root@vlabs-dev.vlabs.ac.in"
DEST_HOST_STAGE="root@staging-dev.vlabs.ac.in"
DEST_DIR="/var/www/html"
REMOVE_COMMAND="rm -rf /var/www/html/*"




all:  publish

publish: 
	emacs --script elisp/prj.el
	mkdir -p build/prj/images
	cp src/images/* build/prj/images
clean:
	rm -rf ${BUILD}

pull:
	git pull origin master

export: pull publish
	ssh -o "StrictHostKeyChecking no" ${DEST_HOST} ${REMOVE_COMMAND}
	rsync -avz --progress ${SRC} ${DEST_HOST}":"${DEST_DIR}

# launches app at localhost:8000
server: 
	(cd ${BUILD}/prj; python -m SimpleHTTPServer)


stage: 	publish
	ssh -o "StrictHostKeyChecking no" ${DEST_HOST_STAGE} ${REMOVE_COMMAND}
	rsync -avz --progress ${SRC} ${DEST_HOST_STAGE}":"${DEST_DIR}

