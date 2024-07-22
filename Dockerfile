# 使用官方的 Ubuntu 基础镜像
FROM ubuntu:latest

# 设置环境变量，避免地区相关的问题
ENV DEBIAN_FRONTEND=noninteractive

# 更新包列表并安装 Apache 和 PHP
RUN apt-get update && \
    apt-get install -y apache2 php libapache2-mod-php && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /var/www/html

# 暴露端口 80
EXPOSE 80

# 启动 Apache 服务
CMD ["apachectl", "-D", "FOREGROUND"]
