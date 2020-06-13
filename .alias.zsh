alias gnuradio='docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /prj:/prj -v /opt:/opt gnuradio'
alias cocotb='docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /opt:/opt -v /prj:/prj -i  -t cocotb bash'
alias cdprj='cd /prj/dyumnin/designw.in'
alias cdweb='cd /prj/dyumnin/designw.in/web'
alias cdng='cd /prj/dyumnin/designw.in/ng2.rc5/app/project'
alias tmuxshadow="tmux -u -2 new-session -A -s shadow"
alias tmuxinten="tmux -u -2 new-session -A -s inten"
alias addtime="sudo kidtimer addtime srihari 30"
alias tmuxdy="\tmux -u -2 new-session -A -s dyumnin"
alias gitolite="cd /prj/gitolite"
alias emacs="/opt/bin/emacs"
alias ghdl="/opt/bin/ghdl"
alias vit="perl /opt/bin/vit"
alias intensetask="task intensivate"
#alias python3=python36
alias phone="cat /prj/records/phone"
alias gnucash="LANG=en_IN gnucash"
alias octave="/opt/bin/octave"
#alias be='PYTHONPATH=/opt/lib/python2.7/site-packages /opt/bin/be'
alias cardo='cd &&tiddlywiki cardo --listen'
alias grive='grive -s Switch'
alias mutt='neomutt'
alias gdrive='google-drive-ocamlfuse ~/GoogleDrive'
#alias makepp='~/Downloads/makepp-2.0/makepp'
alias tor='cd ~/Downloads/tor-browser_en-US/ && ./start-tor-browser.desktop && cd -'
