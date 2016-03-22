class vhost {    
    apache::vhost{ 'yusuf.dev':
        name => 'yusuf.dev',
        port => 80,
        docroot => '/vagrant/yusufsoyo/',
        configure_firewall => false,
        servername => 'yusuf.dev',
        serveralias => 'www.yusuf.dev'
        ssl => false,
        override => all
    }
}