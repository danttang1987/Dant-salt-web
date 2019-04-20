include:
  - bbs.php-service
  - modules.nginx.service

web-bbs:
  file.managed:
    - name: /app/nginx/conf/vhost_online/bbs.conf
    - source: salt://bbs/files/bbs.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - service: php-service
    - watch_in:
      - service: nginx-service
