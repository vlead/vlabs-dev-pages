BUILD=./build
SRC=${BUILD}/prj/
DEST_HOST="root@vlabs-dev.vlabs.ac.in"
DEST_DIR="/var/www/html"
REMOVE_COMMAND="rm -rf /var/www/html/*"

DEST_HOST_STAGE="root@10.4.15.148"
DEST_DIR_STAGE="/var/www/"
REMOVE_COMMAND_STAGE="rm -rf /var/www/*"


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

stage: pull publish
	ssh -o "StrictHostKeyChecking no" ${DEST_HOST_STAGE} ${REMOVE_COMMAND_STAGE}
	rsync -avz --progress ${SRC} ${DEST_HOST_STAGE}":"${DEST_DIR_STAGE}

