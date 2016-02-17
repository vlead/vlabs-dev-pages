BUILD=./build
SRC=${BUILD}/prj/
DEST_HOST="root@vlabs-dev.vlabs.ac.in"
DEST_HOST_STAGE="root@staging-dev.vlabs.ac.in"
DEST_DIR="/var/www/html"
REMOVE_COMMAND="rm -rf /var/www/html/*"




all:  publish

publish: 
	emacs --script elisp/prj.el

clean:
	rm -rf ${BUILD}

pull:
	git pull origin master

export: pull publish
	ssh -o "StrictHostKeyChecking no" ${DEST_HOST} ${REMOVE_COMMAND}
	rsync -avz --progress ${SRC} ${DEST_HOST}":"${DEST_DIR}

stage: 	publish
	ssh -o "StrictHostKeyChecking no" ${DEST_HOST_STAGE} ${REMOVE_COMMAND}
	rsync -avz --progress ${SRC} ${DEST_HOST_STAGE}":"${DEST_DIR}

