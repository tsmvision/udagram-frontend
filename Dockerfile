FROM node:16-alpine3.15 as builder
WORKDIR /app
COPY ./ ./
RUN apk update && apk upgrade && apk add npm && apk add curl && npm ci && npm run build

FROM nginx:alpine
COPY --from=builder  /app/www/ /usr/share/nginx/html/