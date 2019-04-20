/etc/resolv.conf:
  file.managed:
    - soruce: salt://init/files/resolv.conf.template
    - user: root
    - group: root
    - mode: 644
