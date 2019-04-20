limits-init:
  file.managed:
    - name: /etc/security/limits.conf
    - source: salt://init/files/limits.conf.default
    - user: root
    - group: root
    - mode: 644
