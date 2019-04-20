include:
  - modules.haproxy.install
haproxy-service:
  file.managed:
    - name: /etc/haproxy/haproxy.cfg
    - source: salt://lbincluster/files/haproxy.cfg.inside
    - user: root
    - group: root
    - require:
      - file: /etc/haproxy

  service.running:
    - name: haproxy
    - enable: True
    - reload: True
    - require:
      - cmd: haproxy-init
    - watch:
      - file: haproxy-service
