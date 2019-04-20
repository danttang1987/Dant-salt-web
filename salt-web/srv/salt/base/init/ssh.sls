ssh-init:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://init/files/sshd_config.default
    - user: root
    - group: root
    - mode: 600
