travis
======

Shared config for Travis CI for IIPC.

This set-up follows the general example given [here][1], but extended to ensure snapshots are not deployed for pull-request builds.

In short Travis allow you to use [secure environment variables][2] to safely pass credentials to the build. That system also allows you to distinguish pull requests from normal builds, which is used here to avoid deploying snapshots unnecessarily.

[1]: http://blog.xeiam.com/2013/05/configure-travis-ci-to-deploy-snapshots.html
[2]: http://about.travis-ci.org/docs/user/build-configuration/#Secure-environment-variables

Example .travis.yml configuration
---------------------------------

<pre>
language: java
jdk:
  - oraclejdk7
before_install: "git clone git@github.com:iipc/travis.git target/travis"
before_script:
 - "echo $JAVA_OPTS"
 - "export JAVA_OPTS=-Xmx1024m"
 - "echo $JAVA_OPTS"
script: "target/travis/deploy-if.sh"

# whitelist
branches:
  only:
    - master

env:
  global:
    - secure: "qDKjVdoe4Qcz4WfXiQydU7tyl51T62FUJrjqu4FUPBcgeQhFQiggwhpaE6xCOzOpxbsuBi2R1c8gMQf5esE5iDL5jZMu+kz++dYbuzMTd13ttvZWMW5wRPH0H8iHk609FP/RDtVKKBr7WO0JvvIAZEhWNHZrLXBrrKgdTey171g="
    - secure: "FXGBKJNP9X7ePJfS4eYTZtoFo4RT1sxor34XxncSJr7uV6ggtZb4B4WNd16IlLcDk6E32sx8YoWdltaOGwQ5Vg/kux5Ko/wKZCoccS018Ln1bRT86dD1KoPY34rGoNJVQxe7J/1MPqpBKwmi2XCKfzpsEh3W7bbIqg8w9MEOOZA="
</pre>
