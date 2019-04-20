make-pkg:
  pkg.installed:
    - pkgs:
      - gcc
      - gcc-c++
      - glibc
      - make
      - autoconf
      - openssl
      - openssl-devel
      - pcre
      - pcre-devel
softdir:
  file.directory:
    - name: /app/source
