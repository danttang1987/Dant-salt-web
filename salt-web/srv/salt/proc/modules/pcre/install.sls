pcre-source-install:
  file.managed:
    - name: /app/source/pcre-8.37.tar.gz
    - source: salt://modules/pcre/files/pcre-8.37.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /app/source && tar zxf pcre-8.37.tar.gz && cd pcre-8.37 && ./configure --prefix=/usr/local/pcre && make && make install
    - unless: test -d /usr/local/pcre
    - require:
      - file: pcre-source-install
