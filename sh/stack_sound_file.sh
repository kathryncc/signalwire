#!/bin/bash
stack_sounds_get () {

    read -p "please choose sounds install directory [/usr/share/freeswitch/sounds]: " SOUNDS_DIR
    SOUNDS_DIR=${SOUNDS_DIR:-/usr/share/freeswitch/sounds}

    read -p "please choose file ownership permissions [freeswitch]: " SOUNDS_PERMS
    SOUNDS_PERMS=${SOUNDS_PERMS:-freeswitch}

    if [ ! -d /tmp/sounds ]; then
	mkdir -p /tmp/sounds/md5
	cd /tmp/sounds/md5
    else
	cd /tmp/sounds/md5
    fi

    declare -a SOUNDS=(
        #freeswitch-sounds-en-ca-june-8000-1.0.50.tar.gz
        freeswitch-sounds-en-ca-june-8000-1.0.51.tar.gz
        #freeswitch-sounds-en-ca-june-16000-1.0.50.tar.gz
        freeswitch-sounds-en-ca-june-16000-1.0.51.tar.gz
        #freeswitch-sounds-en-ca-june-32000-1.0.50.tar.gz
        freeswitch-sounds-en-ca-june-32000-1.0.51.tar.gz
        #freeswitch-sounds-en-ca-june-48000-1.0.50.tar.gz
        freeswitch-sounds-en-ca-june-48000-1.0.51.tar.gz
        #freeswitch-sounds-en-us-allison-8000-1.0.0.tar.gz
        freeswitch-sounds-en-us-allison-8000-1.0.1.tar.gz
        #freeswitch-sounds-en-us-allison-16000-1.0.0.tar.gz
        freeswitch-sounds-en-us-allison-16000-1.0.1.tar.gz
        #freeswitch-sounds-en-us-allison-32000-1.0.0.tar.gz
        freeswitch-sounds-en-us-allison-32000-1.0.1.tar.gz
        #freeswitch-sounds-en-us-allison-48000-1.0.0.tar.gz
        freeswitch-sounds-en-us-allison-48000-1.0.1.tar.gz
        freeswitch-sounds-es-mx-maria-44100.tar.gz
        #freeswitch-sounds-fr-ca-june-8000-1.0.14.tar.gz
        #freeswitch-sounds-fr-ca-june-8000-1.0.15.tar.gz
        #freeswitch-sounds-fr-ca-june-8000-1.0.16.tar.gz
        #freeswitch-sounds-fr-ca-june-8000-1.0.18.tar.gz
        #freeswitch-sounds-fr-ca-june-8000-1.0.50.tar.gz
        freeswitch-sounds-fr-ca-june-8000-1.0.51.tar.gz
        #freeswitch-sounds-fr-ca-june-16000-1.0.16.tar.gz
        #freeswitch-sounds-fr-ca-june-16000-1.0.18.tar.gz
        #freeswitch-sounds-fr-ca-june-16000-1.0.50.tar.gz
        freeswitch-sounds-fr-ca-june-16000-1.0.51.tar.gz
        #freeswitch-sounds-fr-ca-june-32000-1.0.14.tar.gz
        #freeswitch-sounds-fr-ca-june-32000-1.0.15.tar.gz
        #freeswitch-sounds-fr-ca-june-32000-1.0.16.tar.gz
        #freeswitch-sounds-fr-ca-june-32000-1.0.18.tar.gz
        #freeswitch-sounds-fr-ca-june-32000-1.0.50.tar.gz
        freeswitch-sounds-fr-ca-june-32000-1.0.51.tar.gz
        #freeswitch-sounds-fr-ca-june-48000-1.0.14.tar.gz
        #freeswitch-sounds-fr-ca-june-48000-1.0.15.tar.gz
        #freeswitch-sounds-fr-ca-june-48000-1.0.16.tar.gz
        #freeswitch-sounds-fr-ca-june-48000-1.0.18.tar.gz
        #freeswitch-sounds-fr-ca-june-48000-1.0.50.tar.gz
        freeswitch-sounds-fr-ca-june-48000-1.0.51.tar.gz
        freeswitch-sounds-pl-pl-espeak-8000-0.1.0.tar.gz
        freeswitch-sounds-pl-pl-espeak-16000-0.1.0.tar.gz
        #freeswitch-sounds-pt-BR-karina-8000-1.0.50.tar.gz
        freeswitch-sounds-pt-BR-karina-8000-1.0.51.tar.gz
        #freeswitch-sounds-pt-BR-karina-16000-1.0.50.tar.gz
        freeswitch-sounds-pt-BR-karina-16000-1.0.51.tar.gz
        #freeswitch-sounds-pt-BR-karina-32000-1.0.50.tar.gz
        freeswitch-sounds-pt-BR-karina-32000-1.0.51.tar.gz
        #freeswitch-sounds-pt-BR-karina-48000-1.0.50.tar.gz
        freeswitch-sounds-pt-BR-karina-48000-1.0.51.tar.gz
        #freeswitch-sounds-ru-RU-elena-8000-1.0.10.tar.gz
        #freeswitch-sounds-ru-RU-elena-8000-1.0.11.tar.gz
        #freeswitch-sounds-ru-RU-elena-8000-1.0.12.tar.gz
        #freeswitch-sounds-ru-RU-elena-8000-1.0.13.tar.gz
        #freeswitch-sounds-ru-RU-elena-8000-1.0.50.tar.gz
        freeswitch-sounds-ru-RU-elena-8000-1.0.51.tar.gz
        #freeswitch-sounds-ru-RU-elena-16000-1.0.10.tar.gz
        #freeswitch-sounds-ru-RU-elena-16000-1.0.11.tar.gz
        #freeswitch-sounds-ru-RU-elena-16000-1.0.12.tar.gz
        #freeswitch-sounds-ru-RU-elena-16000-1.0.13.tar.gz
        #freeswitch-sounds-ru-RU-elena-16000-1.0.50.tar.gz
        freeswitch-sounds-ru-RU-elena-16000-1.0.51.tar.gz
        #freeswitch-sounds-ru-RU-elena-32000-1.0.10.tar.gz
        #freeswitch-sounds-ru-RU-elena-32000-1.0.11.tar.gz
        #freeswitch-sounds-ru-RU-elena-32000-1.0.12.tar.gz
        #freeswitch-sounds-ru-RU-elena-32000-1.0.13.tar.gz
        #freeswitch-sounds-ru-RU-elena-32000-1.0.50.tar.gz
        freeswitch-sounds-ru-RU-elena-32000-1.0.51.tar.gz
        #freeswitch-sounds-ru-RU-elena-48000-1.0.10.tar.gz
        #freeswitch-sounds-ru-RU-elena-48000-1.0.11.tar.gz
        #freeswitch-sounds-ru-RU-elena-48000-1.0.12.tar.gz
        #freeswitch-sounds-ru-RU-elena-48000-1.0.13.tar.gz
        #freeswitch-sounds-ru-RU-elena-48000-1.0.50.tar.gz
        freeswitch-sounds-ru-RU-elena-48000-1.0.51.tar.gz
        freeswitch-sounds-ru-RU-kirill-8000-1.0.0.tar.gz
        freeswitch-sounds-ru-RU-kirill-16000-1.0.0.tar.gz
        freeswitch-sounds-ru-RU-kirill-32000-1.0.0.tar.gz
        freeswitch-sounds-ru-RU-kirill-48000-1.0.0.tar.gz
        freeswitch-sounds-ru-RU-vika-8000-1.0.0.tar.gz
        freeswitch-sounds-ru-RU-vika-16000-1.0.0.tar.gz
        freeswitch-sounds-ru-RU-vika-32000-1.0.0.tar.gz
        freeswitch-sounds-ru-RU-vika-48000-1.0.0.tar.gz
        #freeswitch-sounds-sv-se-jakob-8000-1.0.0.tar.gz
        freeswitch-sounds-sv-se-jakob-8000-1.0.50.tar.gz
        #freeswitch-sounds-sv-se-jakob-16000-1.0.0.tar.gz
        freeswitch-sounds-sv-se-jakob-16000-1.0.50.tar.gz
        #freeswitch-sounds-sv-se-jakob-32000-1.0.0.tar.gz
        freeswitch-sounds-sv-se-jakob-32000-1.0.50.tar.gz
        #freeswitch-sounds-sv-se-jakob-48000-1.0.0.tar.gz
        freeswitch-sounds-sv-se-jakob-48000-1.0.50.tar.gz
        freeswitch-sounds-zh-cn-sinmei-8000-1.0.51.tar.gz
        freeswitch-sounds-zh-cn-sinmei-16000-1.0.51.tar.gz
        freeswitch-sounds-zh-cn-sinmei-32000-1.0.51.tar.gz
        freeswitch-sounds-zh-cn-sinmei-48000-1.0.51.tar.gz
        freeswitch-sounds-zh-hk-sinmei-8000-1.0.51.tar.gz
        freeswitch-sounds-zh-hk-sinmei-16000-1.0.51.tar.gz
        freeswitch-sounds-zh-hk-sinmei-32000-1.0.51.tar.gz
        freeswitch-sounds-zh-hk-sinmei-48000-1.0.51.tar.gz
    )
    for SOUND in ${SOUNDS[@]}; do
        if [ ! -f /tmp/sounds/$SOUND ]; then
            wget -O /tmp/sounds/$SOUND https://files.freeswitch.org/releases/sounds/$SOUND
        fi
	if [ ! -f /tmp/sounds/md5/$SOUND.md5 ]; then
            wget --quiet https://files.freeswitch.org/releases/sounds/$SOUND.md5
	fi
        if [ -f /tmp/sounds/$SOUND ] && [ -f /tmp/sounds/md5/$SOUND.md5 ]; then
            if [[ "$(md5sum -c /tmp/sounds/md5/$SOUND.md5)" =~ OK ]]; then
                printf "md5sum for $SOUND passed... installing...\n"
		tar -zxvf /tmp/sounds/$SOUND -C $SOUNDS_DIR
	    else
                rm -rf /tmp/sounds/$SOUND
                rm -rf /tmp/sounds/md5/$SOUND.md5
                printf "The md5sum for $SOUND failed.\nThe sounds tarball and md5 have been removed. Trying running script again... \n"
		exit
	    fi
	elif [ -f /tmp/sounds/$SOUND ]; then
	    printf "There is no md5 for $SOUND... installing without integrity check...\n"
	    tar -zxvf /tmp/sounds/$SOUND -C $SOUNDS_DIR
	else
	    printf "something went wrong installing $SOUND... seems to be missing...\n"
	    exit
	fi
    done
    chown -R $SOUNDS_PERMS $SOUNDS_DIR
    ls -la /usr/share/freeswitch/sounds
    printf "all done installing sounds.\n"
}
stack_sounds_get
