# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Python
export PATH="/usr/local/share/python:$PATH"

# Rbenv/Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_OPTS='-Xms256M -Xmx512M -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:+DoEscapeAnalysis -XX:+UseBiasedLocking -XX:PermSize=64M -XX:MaxPermSize=256M'

# SBT
export SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

# Jars
alias avro-tools="java -jar ~/my_setup/jars/$(ls ~/my_setup/jars | grep avro-tools | sort | tail -n 1)"

# Postgresapp
export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
