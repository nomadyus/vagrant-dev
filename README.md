# Albatross
## The LAMP stack Vagrant Repository
Just a vagrant repository for any web developement using a LAMP stack with Puppet and Vagant.

## Specifications
- ip:       "192.168.33.10"
- provider: "virtualBox"
- box:      "precise64"
- hostname: "albatross"
- vb name:  "albatross.dev"

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
    $ vagrant box add precise64 http://files.vagrantup.com/precise64.box
```
    
## Installation Instructon
1.  Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads) 
2.  Install [Vagrant](https://www.vagrantup.com/downloads.html)
3.  Install ['precise64'](#vagrant-box-installation) vagrant box
4.  Clone this repository 
5.  Create a directory for your developement domain on the same level as this clone
6.  Edit the VirtualHost entry in [puppet/modules/vhost/files/site.conf](/puppet/modules/vhost/files/site.conf) to point to your development domain diectory
7.  Add your following to your machine host file 
``` 
    192.168.33.10 yusuf.dev 
```
-    For Linux based development system `` /etc/hosts ``
-    For Windows based development system `` C:\Windows\System32\drivers\etc\hosts ``
8.  Open a terminal, go to the location of the git repository and boot up the vagrant box

```
    $ vagrant up 
```

    

And that is it!

## Credits
- [Puppet.com](https://puppet.com/blog/lamp-stacks-made-easy-vagrant-puppet) - LAMP Stacks Made Easy with Vagrant & Puppet 
- [jrodriguezjr/puppet-lamp-stack](https://github.com/jrodriguezjr/puppet-lamp-stack)
