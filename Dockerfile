# 使用指定的基础镜像
FROM cikeyqi/unidbg-fetch-qsign-docker:latest

# 设置时区为 Asia/Shanghai
ENV TZ Asia/Shanghai
ENV TXLIB_VERSION=8.9.96
# 设置工作目录
WORKDIR /app

# 复制本地文件到工作目录
COPY . /app

# 更新系统并安装必要的软件包
RUN apt-get update && \
    apt-get install -y tzdata wget

# 赋予 main 可执行权限
RUN chmod a+x main
# RUN chmod a+x /app/bin/unidbg-fetch-qsign
# 暴露端口 8080（假设应用程序使用该端口）
EXPOSE 8080

# 设置容器启动命令，执行 /app/main 脚本

ENTRYPOINT ["/bin/bash", "-c", "bash /app/main"]
# ENTRYPOINT ["/bin/bash", "-c", "bash /app/bin/unidbg-fetch-qsign --basePath=txlib/$TXLIB_VERSION"]
