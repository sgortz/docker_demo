# FROM node:21-alpine AS build

# WORKDIR /www

# COPY package.json .

# RUN npm install

# COPY . .

# RUN npm run build

FROM nginx:stable-alpine

# COPY --from=build /www/dist usr/share/nginx/html

# COPY /nginx/nginx.conf /etc/nginx/nginx.conf

#install nginx and remove the default configuration file
RUN apk add --no-cache "nginx" && rm -f "/etc/nginx/http.d/default.conf"

COPY nginx/default.conf /etc/nginx/http.d 

WORKDIR /www

COPY dist .

EXPOSE 5173

RUN nginx -t

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]