# 使用官方的 Node.js 镜像作为基础镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json 到工作目录
COPY package*.json ./

# 安装依赖
RUN npm install --omit=dev

# 复制项目文件到工作目录
COPY . .

# 暴露端口 (如果需要通过 http-server 访问)
EXPOSE 8000

# 设置启动命令 (使用 http-server)
CMD ["npx", "http-server", "-p", "8000"] 