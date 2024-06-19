# 使用指定的基础镜像
FROM openjdk:11-jre-slim

ENV TZ Asia/Shanghai
# 设置工作目录
WORKDIR /app

# 复制本地文件到工作目录
COPY . /app

RUN apt-get update && \
    apt-get install -y tzdata wget && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# 赋予 main 可执行权限
RUN chmod a+x main

# 暴露端口
EXPOSE 8080

# 设置容器启动命令
CMD ["./main"]
