#!/bin/sh

docker run --name=ipython_build -ti -v `pwd`:/playbook ansible ansible-playbook -i host.local --tags=ipython --verbose playbook.yml
docker commit ipython_build ipython
