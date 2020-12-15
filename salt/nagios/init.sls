install_plugins:
  pkg.installed:
    - pkgs:
      - nagios-nrpe-plugin
      - nagios-nrpe-server
      
/etc/nagios/nrpe.cfg:
  file.managed:
    - source: salt://nagios/nrpe.cfg

restart_nrpe:
  service.running:
    - name: nagios-nrpe-server
    - enable: True
    - restart: True
    - watch: 
      - file: /etc/nagios/nrpe.cfg

