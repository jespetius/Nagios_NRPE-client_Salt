install_plugins:
  pkg.installed:
    - pkgs:
      - nagios-nrpe-plugin
      - nagios-nrpe-server
      
/etc/nagios/nrpe.cfg:
  file.managed:
    - source: salt://nagiosclient/nrpe.cfg

restart_nrpe:
  service.running:
    - name: nagios-nrpe-server
    - enable: True
    - restart: True
    - watch: 
      - file: /etc/nagios/nrpe.cfg

/usr/local/bin/open5666:
  file.managed:
    - source: salt://nagiosclient/open5666
    - mode: 755

Run open5666:
  cmd.run:
    - name: /usr/local/bin/open5666
    - cwd: /
