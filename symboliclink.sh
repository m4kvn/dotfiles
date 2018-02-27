dotfileDir=$(cd $(dirname $0) && pwd)
cd $HOME && ls -A ${dotfileDir}/dots | xargs -I{} ln -s ${dotfileDir}/dots/{}
