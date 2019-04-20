redis-plugin:
  file.managed:
    - name: /app/source/phpredis-2.2.7.tar.gz
    - source: salt://modules/php/files/phpredis-2.2.7.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /app/source && tar zxf phpredis-2.2.7.tar.gz && cd phpredis-2.2.7&& /app/php-fastcgi/bin/phpize && ./configure --with-php-config=/app/php-fastcgi/bin/php-config &&  make && make install
    - unless: test -f /app/php-fastcgi/lib/php/extensions/*/redis.so
  require:
    - file: redis-plugin
    - cmd: php-install

