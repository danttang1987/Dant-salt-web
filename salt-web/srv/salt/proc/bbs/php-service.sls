include:
  - modules.php.install
  - modules.php.php-memcache
  - modules.php.php-redis
php-service:
  file.managed:
    - name: /app/php-fastcgi/etc/php.ini
    - source: salt://bbs/files/php.ini-production
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: php-fpm
    - enable: True
    - require:
      - cmd: php-service-init
    - watch:
      - file: php-service
      - file: php-fpm
