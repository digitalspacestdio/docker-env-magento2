#!/bin/sh

sed -i 's/fastcgi_param  REMOTE_ADDR.*/fastcgi_param  REMOTE_ADDR        127.0.0.1;/g' /etc/nginx/fastcgi_params

tee -a /etc/nginx/fastcgi_params <<FASTCGI_PARAM_HTTPS

set \$fcgi_https \$https;
if (\$http_x_forwarded_proto = "https") {
    set \$fcgi_https on;
}
fastcgi_param HTTPS \$fcgi_https;

\$fcgi_host \$host
if (\$http_x_forwarded_host != "") {
    set \$fcgi_host \$http_x_forwarded_host;
}
fastcgi_param HOST \$fcgi_host;

FASTCGI_PARAM_HTTPS
