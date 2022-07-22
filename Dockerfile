FROM node:14
MAINTAINER rojer <rojerchen@qq.com>

# 时区
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata && rm -rf /var/lib/apt/lists/*

# 安装node-canvas
RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
    cmake \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev

# 设置yarn镜像
RUN yarn config set registry https://registry.npmmirror.com && export NODE_MIRROR=https://npmmirror.com/mirrors/node/

CMD [ "node" ]