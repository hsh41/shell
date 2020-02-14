#! /bin/sh
procs=`pgrep sslocal`
ip="c11s1.jamjams.net"
# if no sslocal, start
if [[ -z ${procs} ]]; then
    echo "no sslocal runs, start sslocal"
    sslocal -s ${ip} -p 62991 -l 1080 -k AGTDpX3oD5 -t 300 -m aes-256-gcm &>>/tmp/ss.log &
    echo "done"
    echo "start privoxy"
    export http_proxy=http://127.0.0.1:8118
    export https_proxy=http://127.0.0.1:8118
    git config --global http.proxy 'socks5://127.0.0.1:1080'
    git config --global https.proxy 'socks5://127.0.0.1:1080'
    git config --global core.gitproxy 'socks5://127.0.0.1:1080'
    echo "done"
# if exists sslocal, close them
else
    for pid in ${procs}; do
        echo "closing by pid: ${pid}"
        kill -9 ${pid}
    done

    if [ $? -eq 0 ]; then
        echo "result: success"
        : > /tmp/ss.log
    else
        echo "failed to close sslocal"
    fi
    echo "close privoxy"
    unset http_proxy
    unset https_proxy
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    git config --global --unset core.gitproxy 'socks5://127.0.0.1:1080'
    echo "done"
fi
