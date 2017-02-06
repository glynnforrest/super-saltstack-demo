tmux:
    pkg.installed:
        - name: tmux
    file.managed:
        - source: salt://tmux/.tmux.conf
        - name: /home/vagrant/.tmux.conf
