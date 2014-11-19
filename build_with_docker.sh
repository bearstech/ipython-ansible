#!/bin/sh

docker run -ti -v `pwd`:/playbook ansible ansible-playbook -i host.local --tags=ipython --verbose -c local playbook.yml
