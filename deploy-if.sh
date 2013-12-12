mvn install --settings target/travis/settings.xml -B
if [ $? -ne 0 ]; then
  exit -1
fi

if [ -n $TRAVIS_PULL_REQUEST ]; then
if [ $TRAVIS_PULL_REQUEST == 'true' ]; then
  mvn deploy --settings target/travis/settings.xml -B
if [ $? -ne 0 ]; then
  exit -1
fi

fi
fi
