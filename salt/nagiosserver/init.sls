/usr/local/nagios/etc/objects/exampleserver.cfg:
  file.managed:
    - source: salt://nagiosserver/exampleserver.cfg

restart_nagios:
  service.running:
    - name: nagios
    - enable: True
    - restart: True
    - watch:
      - file: /usr/local/nagios/etc/objects/exampleserver.cfg
