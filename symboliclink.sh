dotfileDir=$(cd $(dirname $0) && pwd)
cd $HOME && \
find ${dotfileDir}/dots -type f | \
xargs -I{} ln -fs {} 2>/dev/null
exit 0
