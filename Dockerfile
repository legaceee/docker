FROM node:20-alphine

WORKDIR /app

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm install

COPY . .

ENV DATABASE_URL=postgresql://postgres:mysecretpassword@localhost:5432/postgres
RUN npx prisma generate
RUN npx run build

CMD ["npm","start"]