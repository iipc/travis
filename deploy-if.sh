mvn install --settings target/travis/settings.xml -B
if [ $? -ne 0 ]; then
  exit -1
fi

# Logic for dealing with pull requests:
if [ -n $TRAVIS_PULL_REQUEST ]; then
echo "TRAVIS_PULL_REQUEST is set to" $TRAVIS_PULL_REQUEST

if [ $TRAVIS_PULL_REQUEST == 'false' ]; then
  echo "TRAVIS_PULL_REQUEST is not false. Deploying..."
  mvn deploy --settings target/travis/settings.xml -B -DskipTests
if [ $? -ne 0 ]; then
  exit -1
fi

fi
fi
