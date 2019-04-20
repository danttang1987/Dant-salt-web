/etc/selinux/config:
  file.managed:
    - source: salt://init/files/selinux-config.default
    - user: root
    - group: root
    - mode: 644
