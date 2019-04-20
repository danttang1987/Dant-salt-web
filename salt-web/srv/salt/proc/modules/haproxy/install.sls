include:
  - procinit.init

haproxy-install:
  file.managed:
    - name: /app/source/haproxy-1.8.19.tar.gz
    - source: salt://modules/haproxy/files/haproxy-1.8.19.tar.gz
    - user: root
    - group: root
    - mode: 644
    - require:
      - file: softdir
  
  cmd.run:
    - name: cd /app/source/ && tar zxf haproxy-1.8.19.tar.gz && cd haproxy-1.8.19 && make TARGET=linux2628 USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 && make install PREFIX=/app/haproxy-1.8.19 && ln -s /app/haproxy-1.8.19 /app/haproxy
    - unless: test -L /app/haproxy
    - require:
      - file: haproxy-install
      - pkg: make-pkg

haproxy-init:
  file.managed:
    - name: /etc/init.d/haproxy
    - source: salt://modules/haproxy/files/haproxy.init
    - mode: 755
    - user: root
    - group: root
    - require_in:
      - cmd: haproxy-install
  cmd.run:
    - name: chkconfig --add haproxy
    - unless: chkconfig --list | grep haproxy
    - require:
      - file: haproxy-init
  sysctl.present:
    - name: net.ipv4.ip_nonlocal_bind
    - value: 1
/etc/haproxy:
  file.directory:
    - user: root
    - group: root
    - mode: 755


