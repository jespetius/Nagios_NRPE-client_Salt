install_plugins:
  pkg.installed:
    - pkgs:
      - nagios-nrpe-plugin
      - nagios-nrpe-server
      
/etc/nagios/nrpe.cfg:
  file.managed:
    - source: salt://nagios/nrpe.cfg
