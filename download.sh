#!/bin/bash

function download_go() {
    GOVERSION=$1; shift
    GOOS=$1; shift
    GOARCH=$1; shift

        
    GO_DL_URL=https://golang.org/dl/go${GOVERSION}.${GOOS}-${GOARCH}.tar.gz
    TMPFILE=/tmp/golang.tar.gz
    CURL=$(which curl)
    CURL_OPTS="-L -# -o ${TMPFILE}"
    TAR=$(which tar)
    TAR_OPTS=-xf
    
    

    if [[ -z ${CURL} ]]
    then
        echo "error: no curl installed"
        return 1
    fi
    echo "*** download golang version ${GOVERSION}"
    ${CURL} ${CURL_OPTS} ${GO_DL_URL}

    if [[ ! -f ${TMPFILE} ]]
    then
        echo "error: downloading file"
        return 1
    fi

    echo "*** unpack golang version ${GOVERSION}"
    ${TAR} ${TAR_OPTS} ${TMPFILE} 

}


download_go $1 $2 $3