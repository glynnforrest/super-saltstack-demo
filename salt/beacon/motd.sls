motd_beacon:
    beacon.present:
        - name: inotify
        - enabled: True
        - /home/vagrant/motd.txt:
            mask:
                - modify
