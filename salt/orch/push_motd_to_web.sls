highstate_web:
    salt.state:
        - tgt: '*web'
        - highstate: True
