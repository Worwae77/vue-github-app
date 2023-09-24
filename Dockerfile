FROM node:12.18.3-alpine3.12 as builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install --production --silent
COPY . .
RUN npm run build

FROM node:12.18.3-alpine3.12
WORKDIR /app
COPY --from=builder /app/dist ./dist
