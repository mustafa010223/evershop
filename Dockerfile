FROM node:18-alpine

WORKDIR /app

# NPM güncelle (isteğe bağlı ama gerekmezse çıkar)
RUN npm install -g npm@9

# package.json ve lock dosyasını ekle
COPY package*.json ./

# Diğer dizinleri ekle
COPY packages ./packages
COPY themes ./themes
COPY extensions ./extensions
COPY public ./public
COPY media ./media
COPY config ./config
COPY translations ./translations

# npm registry mirror kullanmak istersen:
RUN npm config set registry https://registry.npmmirror.com

# Bağımlılıkları yükle
RUN npm install --legacy-peer-deps

# Uygulama build
RUN npm run build

# Evershop 3000 portundan çalışır
EXPOSE 3000

CMD ["npm", "run", "start"]

