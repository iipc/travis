mvn install --settings target/travis/settings.xml -B
if [ TRAVIS_PULL_REQUEST -eq 'true' ]; do
  mvn deploy --settings target/travis/settings.xml -B
done
