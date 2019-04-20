include:
  - modules.libevent.install
  - procinit.init

memcached-source-install:
  file.managed:
    - name: /app/source/memcached-1.4.24.tar.gz
    - source: salt://modules/memcached/files/memcached-1.4.24.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: cd /app/source && tar zxf memcached-1.4.24.tar.gz && cd memcached-1.4.24 && ./configure --prefix=/app/memcached-1.4.24 --enable-64bit --with-libevent=/usr/local/libevent && make && make install && ln -s /app/memcached-1.4.24 /app/memcached
    - unless: test -L /app/memcached
    - require:
      - cmd: libevent-source-install
      - file: memcached-source-install
      - pkg: make-pkg
