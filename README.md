# Vagrant
Just a vagrant repository for any web developement using a LAMP stack with Puppet and Vagant.

## Specifications
- ip: "192.168.33.10"
- provider: "virtualBox"
- box: "precise32"

## Requiements
- [Vagrant](https://www.vagrantup.com/)
- [Virtual Box](https://www.virtualbox.org/)

## Packages
The configuration for each package is located in their respective folder. The packages included are listed as follows: 
- php
    - php5-fpm
    - php5-cli
    - libapache2-mod-php5
- mysql
    - mysql-server
    
- apache
    - apache2
    
## Vagrant Box Installation
```
    $ vagrant box add precise32 http://files.vagrantup.com/precise32.box
```
    
## Installation Instructon
1.  Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads) 
1.  Install [Vagrant](https://www.vagrantup.com/downloads.html)
1.  Install 'precise32' vagrant box
1.  Clone this repository 
1.  Create a directory for your developement domain on the same level as this clone
1.  Edit the VirtualHost entry in [/puppet/modules/vhost/files/site.conf](/puppet/modules/vhost/files/site.conf) to point to your development domain diectory
1.  Open a terminal, go to the location of the git repository and boot up the vagrant box

```
    $ vagrant up 
```

And that is it!

## Credits
- [Puppet.com](https://puppet.com/blog/lamp-stacks-made-easy-vagrant-puppet) - LAMP Stacks Made Easy with Vagrant & Puppet 
- [jrodriguezjr/puppet-lamp-stack](https://github.com/jrodriguezjr/puppet-lamp-stack)