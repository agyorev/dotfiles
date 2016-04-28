if [ -f ~/.bashrc ] || [ -h ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.leanplum_profile ] || [ -h ~/.leanplum_profile ]; then
  source ~/.leanplum_profile
fi
