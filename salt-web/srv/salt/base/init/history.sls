/etc/profile:
  file.append:
    - text:
      - export HISTTIMEFORMAT="%F %T `whoami` "
      - export HISTCONTROL=ignorespace
      - export TMOUT=60
