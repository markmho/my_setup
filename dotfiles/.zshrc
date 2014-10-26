
# Python
export PATH="/usr/local/share/python:$PATH"

# Rbenv/Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# SBT
export SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

# Jars
alias avro-tools="java -jar ~/.jars/$(ls ~/.jars | grep avro-tools | sort | tail -n 1)"
