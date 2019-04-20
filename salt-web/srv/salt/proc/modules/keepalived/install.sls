include:
  - procinit.init
keepalived-install:
  file.managed:
    - name: /app/source/keepalived-1.2.17.tar.gz
    - source: salt://modules/keepalived/files/keepalived-1.2.17.tar.gz
    - mode: 755
    - user: root
    - group: root
    - require:
      - file: softdir
  cmd.run:
    - name: cd /app/source && tar zxf keepalived-1.2.17.tar.gz && cd keepalived-1.2.17 && ./configure --prefix=/app/keepalived-1.2.17 --disable-fwmark && make && make install && ln -s /app/keepalived-1.2.17 /app/keepalived
    - unless: test -L /app/keepalived
    - require:
      - file: keepalived-install
      - pkg: make-pkg

/etc/sysconfig/keepalived:
  file.managed:
    - source: salt://modules/keepalived/files/keepalived.sysconfig
    - mode: 644
    - user: root
    - group: root

/etc/init.d/keepalived:
  file.managed:
    - source: salt://modules/keepalived/files/keepalived.init
    - mode: 755
    - user: root
    - group: root

keepalived-init:
  cmd.run:
    - name: chkconfig --add keepalived
    - unless: chkconfig --list | grep keepalived
    - require:
      - file: /etc/init.d/keepalived
      - cmd: keepalived-install

/etc/keepalived:
  file.directory:
    - user: root
    - group: root
