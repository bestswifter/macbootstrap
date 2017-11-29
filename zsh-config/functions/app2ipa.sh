function app2ipa {
    if [ $# != 1 ]; then
        echo "Use app2ipa xxx.app"
    fi

    OLD_POS=$(PWD)

    cd $BSTEMP

    if [[ -e ipa ]]; then
        rm -rf ipa
    fi
    mkdir ipa && cd ipa

    # 构造 Payload 文件夹，存放 .app 文件
    mkdir Payload
    cp -r $1 Payload

    # 构造 ITunesArtWork，存放资源
    mkdir iTunesArtwork

    # 压缩得到 ipa 文件
    zip -q -r output.ipa Payload iTunesArtWork && echo $(PWD)/output.ipa

    cd $OLD_POS
}

