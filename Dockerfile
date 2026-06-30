# FROM node:20-alpine

# WORKDIR /app

# COPY ./package.json ./package.json
# COPY ./package-lock.json ./package-lock.json

# RUN npm install

# COPY . .

# ENV DATABASE_URL=postgresql://postgres:mysecretpassword@localhost:5432/postgres
# RUN npx prisma migrate dev
# RUN npx prisma generate
# RUN npx run build
# EXPOSE 3000
# CMD ["npm","start"]
# ---- Build stage ----
FROM node:20-alpine AS build

WORKDIR /app

RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .

RUN pnpm prisma generate
RUN pnpm run build

# ---- Production stage ----
FROM node:20-alpine AS production

WORKDIR /app

RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile --prod

COPY --from=build /app/dist ./dist
COPY --from=build /app/src/generated ./src/generated
COPY prisma ./prisma

EXPOSE 3000
CMD ["sh", "-c", "pnpm prisma migrate deploy && node dist/index.js"]