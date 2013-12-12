mvn install --settings target/travis/settings.xml -B
if [ $? -ne 0 ]; then
  exit -1
fi

# Logic for dealing with pull requests:
if [ $TRAVIS_SECURE_ENV_VARS == 'true' ]; then
echo "TRAVIS_SECURE_ENV_VARS is true, attempting deployment..."

if [ $TRAVIS_PULL_REQUEST == 'false' ]; then
  echo "TRAVIS_PULL_REQUEST is false. Deploying..."
  mvn deploy --settings target/travis/settings.xml -B -DskipTests
if [ $? -ne 0 ]; then
  exit -1
fi

fi
fi
