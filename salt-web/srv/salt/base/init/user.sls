user-init:
  group.present:
    - name: dantadmin
    - gid: 1002

  user.present:
    - name: dantadmin
    - fullname: dantadmin
    - shell: /bin/bash
    - uid: 1002
    - gid: 1002
    - password: $1$RkFWmdO5$eY7X/qiOZxtORMFblbnve0
