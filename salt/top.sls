base:
    super-saltstack-master:
        - master
        - beacon.motd
    super-saltstack-web:
        - nginx
    super-saltstack-host:
        - imagesnap
