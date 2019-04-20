zabbix-repo:
  pkg.installed:
    - sources:
      - zabbix-release: https://mirrors.aliyun.com/zabbix/zabbix/4.1/rhel/7/x86_64/zabbix-release-4.1-1.el7.noarch.rpm
    - unless: rpm -qa | grep zabbix-release
zabbix-install:
  pkg.installed:
    - pkgs:
      - zabbix-agent
    - require:
      - pkg: zabbix-repo

zabbix-conf:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://init/files/zabbix_agentd.conf.template
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      zabbix_server: {{ pillar['zabbix-server'] }}
      HOSTNAME: {{ grains['localhost'] }}
    - require:
      - pkg: zabbix-install

zabbix-service:
  service.running:
    - name: zabbix-agent
    - enable: Ture
    - watch:
      - pkg: zabbix-install
      - file: zabbix-conf
      - file: zabbix-conf-d

zabbix-conf-d:
  file.directory:
    - name: /etc/zabbix/zabbix_agentd.d
    - require:
      - pkg: zabbix-install
      - file: zabbix-conf
