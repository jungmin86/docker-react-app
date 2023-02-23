FROM node:alpine as builder
# builder stage

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./ 
# node_modules 지우고 빌드해도 됨

# CMD ["npm", "run", "build"]
RUN npm run build


FROM nginx
#run stage
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html