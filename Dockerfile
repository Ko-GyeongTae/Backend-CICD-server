FROM node:16 AS builder
WORKDIR /app

COPY . .

RUN yarn
RUN yarn build

FROM node:16-alpine
WORKDIR /app

COPY --from=builder /app ./

EXPOSE 5555

CMD ["yarn", "start"]