mvn install --settings target/travis/settings.xml -B
if [ -n $TRAVIS_PULL_REQUEST ]; then
if [ $TRAVIS_PULL_REQUEST == 'true' ]; then
  mvn deploy --settings target/travis/settings.xml -B
fi
fi
