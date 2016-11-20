jira-servicedesk
==================

Formula for installing jira-servicedesk, with correct pillar settings it should work also for jira

See the full [Salt Formulas installation and usage instructions](http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html)


## Available states
- [jira](#jira)


### jira
Installing jira-servicedesk 



Configuration
=============

## Jira required settings

### jira:version
Version of jira-servicedesk to be installed

### jira:db_type
mysql or postgres72

### jira:db_type_name
mysql or postgres

### jira:db_driver
com.mysql.jdbc.Driver or org.postgresql.Driver

### jira:db_server
Hostname or IP of database server

### jira:db_name
Name of database (default: jira)

### jira:db_port
Port for mysql/postgresql server

### jira:db_username
Username for database (remember that it need to be set the same as for #mysql:server:root_user )

### jira:db_password
Password for database user (remember that it need to be set the same as for #mysql:server:root_password)


### jira:prefix 
Prefix where jira should be installed, default /opt 

### jira:jira_home
Homedir where jira will keep data of this jira 

### jira:jira_hostname
Hostname, it's remember to setup that one the same as in #nginx:servers:managed:jira:server_name


## Mysql
(For more settings look here: https://github.com/saltstack-formulas/mysql-formula )
### mysql:server:root_user
User root for mysql

### mysql:server:root_password
password for root user

### mysql:datadir 
Dir where mysql will keep data in

### mysql:database
List of databses need to be created (need to have database from #jira:db_name)


## Nginx

Example pillar below, for explanation of this settings look here:  https://github.com/saltstack-formulas/nginx-formula

Most important option is nginx:servers:managed:jira:server_name
as it's defining what will be server name for jira


```
nginx:
  ng:
    server:
      config: 
        worker_processes: 4
        pid: /run/nginx.pid
        events:
          worker_connections: 768
        http:
          sendfile: 'on'
          include:
            - /etc/nginx/mime.types
            - /etc/nginx/conf.d/*.conf
            - /etc/nginx/sites-enabled/*

    servers:
      managed:
        jira: 
          enabled: True
          overwrite: True 
          config:
            - server:
              - server_name: jira.somedomain.com
              - index:
                - index.html
                - index.htm
              - "location /":
                - proxy_set_header:
                  - X-Forwarded-Host            
                  - $host
                - proxy_set_header:   
                  - X-Forwarded-Server       
                  - $remote_addr
                - proxy_set_header:   
                  - X-Forwarded-for 
                  - $proxy_add_x_forwarded_for
                - proxy_pass:
                   - http://localhost:8080
                - client_max_body_size:
                   - 10M
```


Dependencies
================
- https://github.com/saltstack-formulas/mysql-formula
- https://github.com/saltstack-formulas/nginx-formula
- https://github.com/saltstack-formulas/sun-java-formula



