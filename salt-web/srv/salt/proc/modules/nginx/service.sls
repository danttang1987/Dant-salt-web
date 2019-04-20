include:
  - modules.nginx.install

nginx-init:
  file.managed:
    - name: /etc/init.d/nginx
    - source: salt://modules/nginx/files/nginx-init
    - mode: 755
    - user: root
    - group: root
  cmd.run:
    - name: chkconfig --add nginx
    - unless: chkconfig --list | grep nginx
    - require:
      - file: nginx-init

/app/nginx/conf/nginx.conf:
  file.managed:
    - source: salt://modules/nginx/files/nginx.conf
    - user: www
    - group: www
    - mode: 644 
nginx-offline:
  file.directory:
    - name: /app/nginx/conf/vhost_offline

nginx-online:
  file.directory:
    - name: /app/nginx/conf/vhost_online
    - require:
      - cmd: nginx-source-install

nginx-service:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - require:
      - cmd: nginx-init
    - watch:
      - file: /app/nginx/conf/nginx.conf
      - file: nginx-online
