#!/bin/bash

stripe listen \
  --api-key ${STRIPE_SECRET} \
  -f ${URL} \
  --events ${EVENTS}
