FROM node:16.14-alpine as builder

ARG DUMMY
ENV DUMMY $DUMMY

ARG PORT
ENV PORT $PORT

WORKDIR /app

COPY . .

RUN yarn install
RUN NODE_ENV=production yarn build

FROM node:16.14-alpine

COPY --from=builder /app/build /build
COPY --from=builder /app/node_modules /node_modules
COPY --from=builder /app/package.json /package.json

CMD ["yarn", "start"]