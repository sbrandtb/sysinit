#!/usr/bin/env bash


fail() {
    echo -e "\e[31m$1\e[0m"
    exit 1
}


info() {
    echo -e "\e[34m$1\e[0m"
}


get_release_info() {
    cat /etc/lsb-release | grep $1 | grep -Eo '[^=]*$' | tr '[:upper:]' '[:lower:]' || fail "Could not get release info"
}


try_manual_install_salt() {
    platform=`get_release_info DISTRIB_ID`
    codename=`get_release_info DISTRIB_CODENAME`
    release=`get_release_info DISTRIB_RELEASE`

    if [[ "$platform" == "ubuntu" && "$codename" == "yakkety" ]] ; then
        info "Salt does not support yakkety (yet). Using xenial repository"
        release="16.04"
        codename="xenial"
    else
        (exit 1)
    fi

    wget -O - https://repo.saltstack.com/apt/$platform/$release/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add - && \
    sudo bash -c "echo 'deb http://repo.saltstack.com/apt/$platform/$release/amd64/latest $codename main' > /etc/apt/sources.list.d/saltstack.list" && \
    sudo apt-get update && \
    sudo apt-get install -y salt-minion
}


install_salt() {
    info "Installing Salt Minion..."
    sudo apt install curl

    curl -L https://bootstrap.saltstack.com/develop -o /tmp/install_salt.sh && sudo sh /tmp/install_salt.sh
    if [[ $? -ne 0 ]] ; then
        info "Installing Salt by official script failed, trying manual install..."
        try_manual_install_salt || fail "Could not install salt minion."
    fi
}


run_salt() {
    info "Running Salt..."
    SALT_OPTS="--local --file-root states state.apply $STATE pillar={\"user\":\"`whoami`\"}"
    if $DRY_RUN ; then
         SALT_OPTS="$SALT_OPTS test=True"
    fi
    sudo salt-call $SALT_OPTS
}


DRY_RUN=false
STATE=""

while getopts "ds:" opt; do
    case "$opt" in
    d)
        DRY_RUN=true
        info "Dry run..."
        ;;
    s)
        STATE="$OPTARG"
        info "State: $STATE"
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift


if ! `which salt-call 2>&1 > /dev/null` ; then
    install_salt
fi
run_salt
