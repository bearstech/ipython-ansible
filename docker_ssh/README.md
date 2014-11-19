A container for your ipython
============================

Prepare the image
-----------------

    ./build_host
    ./bootstrap
    docker run -t ipython .

Run it
------

    docker run -p 2222:22 ipython

Feed it with Ansible
--------------------

    ansible-playbook -i docker/hosts.docker --verbose playbook.yml
