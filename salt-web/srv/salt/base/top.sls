base:
  '*':
    - init.init
proc:
  '*':
    - lbincluster.haproxy_inside
    - lbincluster.haproxy-inside-keepalived
    - bbs.bbs
  'nginx01*':
    - bbs.memcached-service
