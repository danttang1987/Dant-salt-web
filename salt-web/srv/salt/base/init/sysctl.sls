net.ipv4.ip_local_port_range:
  sysctl.present:
    - value: 10000 65000
fs.file-max:
  sysctl.present:
    - value: 2000000
net.ipv4.ip_forward:
  sysctl.present:
    - value: 1
vm.swappiness:
  sysctl.present:
    - value: 0
net.ipv4.tcp_fin_timeout:
  sysctl.present:
    - value: 2

net.ipv4.tcp_tw_reuse:
  sysctl.present:
    - value: 1
net.ipv4.tcp_tw_recycle:
  sysctl.present:
    - value: 1

net.ipv4.tcp_syncookies:
  sysctl.present:
    - value: 1
net.ipv4.tcp_keepalive_time:
  sysctl.present:
    - value: 600
net.ipv4.tcp_max_syn_backlog:
  sysctl.present:
    - value: 16384
net.ipv4.tcp_max_tw_buckets:
  sysctl.present:
    - value: 36000
net.ipv4.route.gc_timeout:
  sysctl.present:
    - value: 100
net.ipv4.tcp_syn_retries:
  sysctl.present:
    - value: 1
net.ipv4.tcp_synack_retries:
  sysctl.present:
    - value: 1
net.core.somaxconn:
  sysctl.present:
    - value: 16384
net.core.netdev_max_backlog:
  sysctl.present:
    - value: 16384
net.ipv4.tcp_max_orphans:
  sysctl.present:
    - value: 16384
net.nf_conntrack_max:
  sysctl.present:
    - value: 25000000
net.netfilter.nf_conntrack_max:
  sysctl.present:
    - value: 25000000
#net.netfilter.nf_conntrack_tcp_timeout_established:
#  sysctl.present:
#    - value: 180
#net.netfilter.nf_conntrack_tcp_timeout_time_wait:
#  sysctl.present:
#    - value: 120
#net.netfilter.nf_conntrack_tcp_timeout_close_wait:
#  sysctl.present:
#    - value: 60
#net.netfilter.nf_conntrack_tcp_timeout_fin_wait:
#  sysctl.present:
#    - value: 120

