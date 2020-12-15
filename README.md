# Nagios NRPE-clientin asentaminen Saltilla

Tässä projektissa asennetaan Nagios NRPE-client Ubuntu 20.04(LTS) ja Ubuntu 18.04.3(LTS) palvelimille.

## Alkuvaatimukset
Alkuvaatimuksena Nagios Core pitää olla asennettuna. Se onnistuu mainiosti Nagioksen ohjeilla. Komennot tehdään check_nrpe:llä. Olisi siis hyvä, jos komentosi käyttävät check_nrpe:tä eikä esimerkiksi SSH:ta. 

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


