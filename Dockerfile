# 使用指定的基础镜像
FROM openjdk:11-jre-slim

# 设置时区为 Asia/Shanghai
ENV TZ Asia/Shanghai

# 设置工作目录
WORKDIR /app

# 复制本地文件到工作目录
COPY . /app

# 更新系统并安装必要的软件包
RUN apt-get update && \
    apt-get install -y tzdata wget && \
    # 配置时区为 Asia/Shanghai 并设置为系统默认时区
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# 赋予 main 可执行权限
RUN chmod a+x main

# 暴露端口 8080（假设应用程序使用该端口）
EXPOSE 8080

# 设置容器启动命令，执行 /app/main 脚本
ENTRYPOINT ["/bin/bash", "-c", "bash /app/main"]
