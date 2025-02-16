FROM nginx:stable-alpine

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

COPY dist /usr/share/nginx/html

EXPOSE 5173

RUN nginx -t

CMD ["nginx", "-g", "daemon off;"]