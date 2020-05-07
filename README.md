# Barnsley Children's services

```bash
acme.sh --issue -d www.barnsleychildrenshealth.co.uk  -d barnsleychildrenshealth.co.uk -d vaccinations.barnsleychildrenshealth.co.uk -d health.barnsleychildrenshealth.co.uk -d camhs.barnsleychildrenshealth.co.uk -d  therapy.barnsleychildrenshealth.co.uk -d speech.barnsleychildrenshealth.co.uk -d epilepsy.barnsleychildrenshealth.co.uk -d audiology.barnsleychildrenshealth.co.uk -d family.barnsleychildrenshealth.co.uk -d school.barnsleychildrenshealth.co.uk -w /home/barnsley_kids/current/public
```

```bash
acme.sh --install-cert -d www.barnsleychildrenshealth.co.uk --key-file       /etc/nginx/ssl/acme/www.barnsleychildrenshealth.co.uk/privkey.pem  --fullchain-file /etc/nginx/ssl/acme/www.barnsleychildrenshealth.co.uk/fullchain.pem
```

```bash
acme.sh --remove -d www.barnsleychildrenshealth.co.uk
```
