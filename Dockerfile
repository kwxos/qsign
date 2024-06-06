# 使用指定的基础镜像
FROM lanqian528/chat2api:latest

# 设置工作目录
WORKDIR /app

# 复制本地文件到工作目录
COPY main /app

RUN apt-get update && \
    apt-get install -y tzdata wget && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# 赋予 main 可执行权限
RUN chmod a+x main

# 暴露端口
EXPOSE 5005

# 设置容器启动命令
CMD ["./main"]
