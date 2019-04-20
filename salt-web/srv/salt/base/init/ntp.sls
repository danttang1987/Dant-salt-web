/usr/sbin/ntpdate time.windows.com >/dev/null 2 >&1:
  cron.present:
    - user: root
    - minute: '*/5'

/usr/sbin/ntpdate time.nist.gov >/dev/null 2>&1:
  cron.present:
    - user: root
    - minute: '*/10'
