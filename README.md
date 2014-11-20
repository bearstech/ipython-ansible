Ansible's role for iPython
==========================

Complete install of iPython with:
 - numpy
 - notebook
 - ipython.parralel

With an Nginx frontend.

Test with Vagrant
-----------------

Install a cute version of Virtualbox and Vagrant.

The hostmanager plugin is needed :

    vagrant plugin install vagrant-hostmanager

Test wirh Docker
----------------

Install Docker (and boot2docker if you are not a Linux user).

Prepare your ansible image :

    cd docker
    docker build -t ansible .

Build you own ipython version :

    ./build_with_docker.sh

Take a pause, enjoy your powerful CPUs.

Now, you've got a numpy image, 2.5Go of pure math and love.

You can tune host.local.

### Next step

 * Complete automated workflow
 * Parameters for the image
 * Howto using it in a cluster
 * Howto build your own docker with this image

Licence
-------

3 terms BSD licence © 2014 Mathieu Lecarme
