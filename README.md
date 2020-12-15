# Nagios NRPE-clientin asentaminen Saltilla
![alt text](https://github.com/jespetius/Nagios_with_Salt/blob/main/images/nagios.PNG)

Tässä projektissa asennetaan Nagios NRPE-client Ubuntu 20.04(LTS) ja Ubuntu 18.04.3(LTS) palvelimille.
[Sivuillani](https://jesperikuula.wordpress.com/nagios-nrpe-client-saltilla/) on artikkeli, kuinka kyseinen projekti on kehitetty. 
Nagios Core ei ollut ennen tätä projektia itselleni liian tuttu. Tämän projektin tarkoitus on asentaa NRPE-client sulavasti valvottavaan kohteeseen. Projekti on toteutettu [Tero Karvisen Palvelinten hallinta-kurssilla](http://terokarvinen.com/2020/configuration-management-systems-palvelinten-hallinta-ict4tn022-autumn-2020/).

## Projektissa käytetyt versiot
Nagios Core 4.4.5 [Asennus](https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html#Ubuntu)

Nagios-palvelin Ubuntu 18.04.3 (LTS) x64

Valvottavat palvelimet

Ubuntu 18.04.3 (LTS) x64

Ubuntu 20.04 (LTS) x64

salt-master:
  Installed: 2017.7.4+dfsg1-1ubuntu18.04.2


## Ohjeet
top.sls-tiedostoon lisää omat palvelimesi
```
base:
  'your nagios server':
    - nagiosserver
  'your nagios client':
    - nagiosclient
```

salt/nagiosclient/nrpe.cfg-tiedostoon pitää lisätä oman Nagioksen ip-osoite:
```
allowed_hosts= nagios server ip here

```

salt/nagiosserver/examplehost.cfg-tiedostossa pitää muokata seuraavat asiat, jos haluat ottaa Saltilla uuden palvelimen valvontaan:
lisää palvelimen ip-osoite ja vaihda mahdollisesti nimi muuksi kun exampleserver. Huom, se pitää vaihtaa joka komennossa.
```
define host {

    use                     linux-server            ; Name of host template to use
                                                    ; This host definition will inherit all variables that are defin$
                                                    ; in (or inherited by) the linux-server host template definition.
    host_name               exampleserver
    alias                   exampleserver
    address                 PUT IP HERE 
}


define service {

    use                     local-service           ; Name of service template to use
    host_name               exampleserver
    service_description     PING
    check_command           check_ping!100.0,20%!500.0,60%
}

```


