{% set p  = salt['pillar.get']('jira', {}) %}
{% set g  = salt['grains.get']('jira', {}) %}



{%- set default_version      = '3.2.4' %}
{%- set default_prefix       = '/opt' %}
{%- set default_app_name       = 'atlassian-servicedesk' %}

{%- set default_source_url   = 'https://downloads.atlassian.com/software/jira/downloads' %}
{%- set default_log_root     = '/var/log/jira' %}
{%- set default_jira_user    = 'jira' %}
{%- set default_jira_group   = 'jira' %}

{%- set default_db_server    = 'localhost' %}
{%- set default_db_name      = 'jira' %}
{%- set default_db_username  = 'jira' %}
{%- set default_db_password  = 'jira' %}
{%- set default_jvm_Xms      = '384m' %}
{%- set default_jvm_Xmx      = '768m' %}
{%- set default_jvm_MaxPermSize = '384m' %}


{%- set default_mysql_connector_version = '5.1.40' %}
{%- set default_mysql_location = 'http://dev.mysql.com/get/Downloads/Connector-J/' %}
{%- set default_db_type      = 'postgresql72' %}
{%- set default_db_driver    = 'org.postgresql.Driver' %}
{%- set default_db_port      = '5432' %}
{%- set default_db_type_name      = 'postgresql' %}
{%- set default_jira_hostname	  = 'localhost' %}

{%- set default_use_https   = false %}



{%- set version        = g.get('version', p.get('version', default_version)) %}
{%- set prefix         = g.get('prefix', p.get('prefix', default_prefix)) %}
{%- set app_name        = g.get('default_app_name', p.get('app_name', default_app_name)) %}
{%- set source_url     = g.get('source_url', p.get('source_url', default_source_url)) %}
{%- set log_root       = g.get('log_root', p.get('log_root', default_log_root)) %}
{%- set jira_user      = g.get('user', p.get('user', default_jira_user)) %}
{%- set jira_group     = g.get('group', p.get('group', default_jira_group)) %}
{%- set db_server      = g.get('db_server', p.get('db_server', default_db_server)) %}
{%- set db_name        = g.get('db_name', p.get('db_name', default_db_name)) %}
{%- set db_username    = g.get('db_username', p.get('db_username', default_db_username)) %}
{%- set db_password    = g.get('db_password', p.get('db_password', default_db_password)) %}
{%- set jvm_Xms        = g.get('jvm_Xms', p.get('jvm_Xms', default_jvm_Xms)) %}
{%- set jvm_Xmx        = g.get('jvm_Xmx', p.get('jvm_Xmx', default_jvm_Xmx)) %}
{%- set jvm_MaxPermSize = g.get('jvm_MaxPermSize', p.get('jvm_MaxPermSize', default_jvm_MaxPermSize)) %}
{%- set mysql_location      = g.get('mysql_location', p.get('mysql_location', default_mysql_location)) %}
{%- set mysql_connector_version      = g.get('mysql_connector_version', p.get('mysql_connector_version', default_mysql_connector_version)) %}

{%- set db_type      = g.get('db_type', p.get('db_type', default_db_type)) %}
{%- set db_driver      = g.get('db_driver', p.get('db_driver', default_db_driver)) %}
{%- set db_port      = g.get('db_port', p.get('db_port', default_db_port)) %}
{%- set db_type_name      = g.get('db_type_name', p.get('db_type_name', default_db_type_name)) %}
{%- set jira_hostname     = g.get('jira_hostname', p.get('jira_hostname', default_jira_hostname)) %}

{%- set use_https     = g.get('use_https', p.get('use_https', default_use_https)) %}



{%- set default_jira_home      = salt['pillar.get']('users:%s:home' % jira_user, '/home/jira') %}
{%- set jira_home      = g.get('jira_home', p.get('jira_home', default_jira_home)) %}





{%- set jira = {} %}
{%- do jira.update( { 'version'        : version,
                      'app_name'       : app_name,
                      'source_url'     : source_url,
                      'log_root'       : log_root,
                      'home'           : jira_home,
                      'prefix'         : prefix,
                      'user'           : jira_user,
                      'group'          : jira_group,
                      'db_server'      : db_server,
                      'db_name'        : db_name,
                      'db_username'    : db_username,
                      'db_password'    : db_password,
                      'jvm_Xms'        : jvm_Xms,
                      'jvm_Xmx'        : jvm_Xmx,
                      'jvm_MaxPermSize': jvm_MaxPermSize,
                      'db_port'        : db_port,
                      'db_driver'      : db_driver,
                      'db_port'        : db_port,
                      'db_type'        : db_type,
                      'db_type_name'   : db_type_name,
                      'jira_hostname'  : jira_hostname,
                      'use_https'      : use_https,
                      'mysql_location' : mysql_location,
                      'mysql_connector_version': mysql_connector_version
                  }) %}


