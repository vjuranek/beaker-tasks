Beaker tasks
============

A set of tasks and recipes for [Beaker](https://beaker-project.org/).

`recipe` conatins Beaker recipes submited to Beaker for job execution.

`task` conatins task definitions. Tasks are used in recipes. Task can be built and deployed to Beaker using `make bkradd` in task directory.

`util` contains various useful scripts like script for submitting recipes to Beaker.


To build and install Beaker tasks run: `make bkradd`
To submit recipe with parameters: TBD (or use [Jenkins Beaker pluguin](https://wiki.jenkins-ci.org/display/JENKINS/Beaker+Builder+Plugin)) 