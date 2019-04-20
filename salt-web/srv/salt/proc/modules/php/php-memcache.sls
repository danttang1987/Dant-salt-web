include:
  - modules.php.install
memcache-plugin:
  file.managed:
    - name: /app/source/memcache-2.2.7.tgz
    - source: salt://modules/php/files/memcache-2.2.7.tgz
    - user: root
    - group: root
    - mode: 755

  cmd.run:
    - name: cd /app/source && tar zxf memcache-2.2.7.tgz && cd memcache-2.2.7 && /app/php-fastcgi/bin/phpize && ./configure --enable-memcache --with-php-config=/app/php-fastcgi/bin/php-config &&  make && make install
    - unless: test -f /app/php-fastcgi/lib/php/extensions/*/memcache.so
  require:
    - file: memcache-plugin
    - cmd: php-install

