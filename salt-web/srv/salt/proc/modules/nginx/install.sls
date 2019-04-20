include:
  - procinit.init
  - modules.pcre.install
  - modules.user.www
nginx-source-install:
  file.managed:
    - name: /app/source/nginx-1.9.1.tar.gz
    - source: salt://modules/nginx/files/nginx-1.9.1.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: cd /app/source && tar zxf nginx-1.9.1.tar.gz && cd nginx-1.9.1&& ./configure --prefix=/app/nginx-1.9.1 --user=www --group=www --with-http_ssl_module --with-http_stub_status_module --with-file-aio --with-http_dav_module --with-pcre=/app/source/pcre-8.37 && make && make install && chown -R www:www /app/nginx-1.9.1 && ln -s /app/nginx-1.9.1 /app/nginx
    - unless: test -L /app/nginx
    - require:
      - user: www-user-group
      - file: nginx-source-install
      - pkg: make-pkg
      - cmd: pcre-source-install
