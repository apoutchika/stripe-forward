# Stripe Forward

Simple stripe forward for docker compose

## Environments Variables

- `STRIPE_SECRET`: Secret key of Stripe
- `URL`: forward url
- `EVENTS`: listened events separed by commat

## Exemple

```yaml
version: '3.7'

services:
  api:
    image: node
    command: sh -c "cd /app && npm run dev"
    working_dir: /app
    environment:
      STRIPE_SECRET: sk_test_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

  stripe:
    image: apoutchika/stripe-forward
    environment:
      URL: 'http://api/webhook'
      STRIPE_SECRET: sk_test_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
      EVENTS: payment_intent.succeeded,charge.captured,charge.updated
    depends_on:
      - api
```

## Changlog

- 0.1.5 : Update to last stripe version 1.7.0 and add events parameter in environnement variables
- 0.1.4 : Update to last stripe version 1.5.8
