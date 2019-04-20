include:
  - modules.keepalived.install
keepalived-server:
  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://lbincluster/files/haproxy-inside-keepalived.conf
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    {% if grains['fqdn'] == 'salt-master' %}
    - ROUTEID: haproxy_ha
    - STATEID: MASTER
    - PRIORITYID: 150
    {% elif grains['fqdn'] == 'nginx01.zishan.com' %}
    - ROUTEID: haproxy_ha
    - STATEID: BACKUP
    - PRIORITYID: 100
    {% endif %}
  service.running:
    - name: keepalived
    - enable: True
    - watch:
      - file: keepalived-server
