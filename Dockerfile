
FROM node:alpine
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY ./ ./
CMD ["npm", "run," "build"]

FROM nginx
EXPOSE 80
COPY  --from=0 /usr/src/app/build /usr/share/nginx/html