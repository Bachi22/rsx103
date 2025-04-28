# deployement/Dockerfile

# 1. Image de base OpenResty (Alpine) avec le package opm
FROM openresty/openresty:alpine

# 2. Installer git, perl et curl pour opm
RUN apk add --no-cache git perl curl \
    \
    # 3. Installer les modules Lua requis via opm
    && opm get bungle/lua-resty-session \
    && opm get ledgetech/lua-resty-http \
    && opm get cdbattags/lua-resty-jwt \
    && opm get jkeys089/lua-resty-hmac \
    && opm get zmartzone/lua-resty-openidc

# 4. Copier la configuration NGINX (générée par Ansible)
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

# 5. Lancer OpenResty au démarrage du container
CMD ["openresty", "-g", "daemon off;"]
