#!/bin/bash

if [ "$NODE_ENV" = "production" ]; then
  echo "Installing production dependencies..."
  pnpm install
  pnpm prisma generate
  pnpm prisma migrate deploy
  pnpm run build
  pnpm run start
else
  pnpm install
  pnpm prisma migrate dev
  pnpm run dev
fi