{%- from 'jira-servicedesk/conf/settings.sls' import jira with context %}

apache:
  pkg.installed:
    - pkgs:
       - apache2
  service.running:
    - name: apache2
    - enable: True
    - require:
      - pkg: apache

apache-restart:
  module.wait:
    - name: service.restart
    - m_name: apache2

apache-reload:
  module.wait:
    - name: service.reload
    - m_name: apache2


jira-vhost:
  file.managed:
    - name: /etc/apache2/sites-available/jira.conf
    - source: salt://jira-servicedesk/templates/jira-vhost.tmpl 
    - template: jinja
    - listen_in:
      - module: jira-restart
    - context:
      jira: {{ jira|json }}


disable-default-site:
  file.absent:
    - name: /etc/apache2/sites-enabled/000-default
    - listen_in:
      - module: apache-reload
    - require:
      - file: enable-jira-site

enable-jira-site:
  file.symlink:
    - name: /etc/apache2/sites-enabled/jira.conf
    - target: /etc/apache2/sites-available/jira.conf
    - listen_in:
      - module: apache-reload
    - require:
      - file: jira-vhost
 
a2enmod proxy:
  cmd.wait:
    - watch:
      - pkg: apache
    - listen_in:
      - module: apache-restart

a2enmod proxy_http:
  cmd.wait:
    - watch:
      - pkg: apache
    - listen_in:
      - module: apache-restart

