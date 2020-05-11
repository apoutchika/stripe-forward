# Stripe Forward

Simple stripe forward for docker compose

## Environments Variables

- `STRIP_SECRET`: Secret key of Stripe
- `URL`: forward url

## Exemple

```yaml
version: '3.7'

services:
  api:
    image: node
    command: sh -c "cd /app && npm run dev"
    working_dir: /app
    environment:
      STRIP_SECRET: sk_test_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

  stripe:
    image: apoutchika/stripe-forward
    environment:
      URL: 'http://api/webhook'
      STRIP_SECRET: sk_test_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    depends_on:
      - api
```
