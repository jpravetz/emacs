# ~/.zshrc: executed by zsh(1) runs for each new Terminal session.
# See also .bash_profile

# alias epdoc-ftp='ftp 64.202.163.217'

#export JAVA_HOME=/usr
export MAVEN_HOME=/usr/local/maven
export MYSQL_HOME=/usr/local/mysql

export CAYODEV_HOME=$HOME/dev/cayo
export BO_HOME=/Users/jpravetz/dev/bo
export REDITRUCK_HOME=/Users/jpravetz/dev/reditruck
export MANPAGER=cat
#export JAVA_HOME=/usr
export M2_HOME=/usr/local/apache-maven-2.0.8
export M2=$M2_HOME/bin
export EC2_HOME=/Users/jpravetz/usr/local/ec2-api-tools-1.2-13740
export MTASC_HOME=/Users/jpravetz/usr/local/mtasc-1.12-osx
export S3SYNC_HOME=/Users/jpravetz/usr/local/s3sync
export JETS3T_HOME=/Users/jpravetz/usr/local/jets3t-0.7.3
export PERL5LIB=/Users/jpravetz/usr/libperl
export GCLOUD_PROJECT=bo-gdrive
export GOOGLE_APPLICATION_CREDENTIALS=/Users/jpravetz/.gcloud/bo-gdrive.json

export PATH=$HOME/usr/bin:$HOME/usr/nodejs/bin:$HOME/usr/binpython:$HOME/usr/binperl:$HOME/usr/binruby:$HOME/dev/cayo/bin:$MAVEN_HOME/bin:$MYSQL_HOME/bin:$PATH:$EC2_HOME/bin:$JETS3T_HOME/bin:$MTASC_HOME:/usr/local/git/bin:$S3SYNC_HOME

# MacPorts Installer addition on 2010-12-18_at_08:37:26: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/dev/epdoc/strava/bin:/usr/local/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Set Path for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

export EC2_PRIVATE_KEY=~/.ec2/pk-U5S7C67XQAQJXUM3HOPBACLLXGN7CRJD.pem
export EC2_CERT=~/.ec2/cert-U5S7C67XQAQJXUM3HOPBACLLXGN7CRJD.pem

# Set bash prompt
# export PS1="\u[\w]> "
# Set zsh prompt
PROMPT='%F{yellow}%n%F{240}[%~]>%f '

# Ruby rvm setup. Needs to be at end.
# export RVM_HOME=/usr/local/rvm
# export RVM_HOME=$HOME/.rvm
# [[ -s "$RVM_HOME/scripts/rvm" ]] && . "$RVM_HOME/scripts/rvm" # Load RVM function


#export NVM_DIR="/Users/jpravetz/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jpravetz/usr/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jpravetz/usr/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jpravetz/usr/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jpravetz/usr/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
