sudoers-init:
  file.append:
    - name: /etc/sudoers
    - text:
      - 'dantadmin ALL=(ALL) NOPASSWD: ALL'
    - check_cmd: visudo -c 
