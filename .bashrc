# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export PATH="/home/lixy/soft/zsh-5.5.1/build/bin:$PATH"
#exec /home/lixy/soft/zsh-5.5.1/build/bin/bin/zsh

# added by Miniconda2 installer
export PATH="/home/lixy/miniconda2/bin:$PATH"
# alias rm=/home/lixy/linux-stuff/scripts/saferm.sh
# alias 'ngs3'='source activate ngs3'
# alias 'ngs2'='source activate ngs2'
# alias 'deac'='source deactivate'
alias 'll'='ls -ahltr'
# alias 'icdiff'='/home/lixy/soft/icdiff/icdiff'
# alias 'axel'='/home/lixy/soft/axel-2.4/axel'
alias 'z'='exec zsh'
alias 'ss2'='ssh 192.168.10.221'
function cl() {
    cd "$@" && ls
}
# alias 'vv'='/home/lixy/local/vim81/bin/vim'
export PATH=/home/yeh/program/pickpocket-1.1:$PATH

export PATH=/home/yeh/program/netMHC-4.0:$PATH
export PATH=/home/yeh/program/netMHCpan-3.0:$PATH
export PATH=/home/yeh/program/netMHCpan-4.0:$PATH
export PATH=/home/yeh/program/netMHCcons-1.1:$PATH
export PATH=/home/yeh/program/netMHC-3.4:$PATH
export PATH=/home/yeh/program/netMHCII-2.3:$PATH
export PATH=/home/yeh/program/netMHCIIpan-3.2:$PATH

export TMPDIR='/tmp'
export LD_LIBRARY_PATH=/mnt/pipeline-programs/bamtools/bamtools-2.4.1/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${R_HOME}/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/lwang/softwares/boost/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/yeh/program/gsl-2.4/lib:$LD_LIBRARY_PATH
export PATH=/home/lixy/bin:$PATH

export MANPATH=/home/lixy/local/texlive/2018/texmf-dist/doc/man:${MANPATH}
export INFOPATH=/home/lixy/local/texlive/2018/texmf-dist/doc/info:${INFOPATH}
export PATH=/home/lixy/local/texlive/2018/bin/x86_64-linux:${PATH}

PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\u\[\033[00m\]@\h: \[\033[00;36m\]\w\[\033[00m\] \[\t\]\n\$ '
[[ -s /home/lixy/.autojump/etc/profile.d/autojump.sh  ]] && source /home/lixy/.autojump/etc/profile.d/autojump.sh 
