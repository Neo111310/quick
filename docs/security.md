# Secure Konzepte

## Cloud Security
Für die anmeldung mit einem Admin an der Cloud, macht es z.B. bei MS365 durchaus sinn z.B. eine Subdaomein für das Login zu nehmen.
- Normaler user v.nachname@company.net
- Admin user theguru@secure.copany.net

### Subdomain MS365
Einträge im DNS 
``` 
autodiscover.sub    CNAME   autodiscover.outlook.com.
sub                 TXT     MS=000000
sub                 MX      0  bla.bla.microsoft.mailserver.com.
sub                 TXT     v=spf1....
```
Nicht vergessen auch in MS365 Tennant Registrieren
