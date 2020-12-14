# Nagios clientin asentaminen saltilla

Tässä projektissa asennan Nagios clientin Ubuntu 20.04(LTS) ja Ubuntu 18.04.3(lTS) palvelimille.

## Alkuvaatimukset
Alkuvaatimuksena Nagios Core pitää olla asennettuna. Se onnistuu mainiosti Nagioksen ohjeilla. Komennot tehdään check_nrpe:llä. Olisi siis hyvä, jos komentosi käyttävät check_nrpe:tä eikä esimerkiksi SSH:ta. 

## Ohjeet
nrpe.cfg-tiedostoon pitää lisätä oman Nagioksen ip.
```
allowed_hosts= Nagios-palvelimen ip

```


