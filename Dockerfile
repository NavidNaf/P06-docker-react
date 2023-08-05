# Build Phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

# /app/build - all the stuff related to the build
# When started with from, previous block completed
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

