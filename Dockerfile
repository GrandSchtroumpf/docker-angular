## Builder Phase
FROM node:alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN ["npm", "run", "build", "--prod"]

## Run Phase
FROM nginx
# Copy the distribution into the nginx server
COPY --from=builder /usr/app/dist/frontend /usr/share/nginx/html
