FROM node:16.10.0-buster

RUN apt-get update && \
  apt-get install -y \
  neofetch \
  chromium \
  ffmpeg \
  wget \
  imagemagick \
  graphicsmagick \
  webp \
  mc && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .
RUN echo "npm install ytdl-core yt-search" >>/1.sh
RUN npm install -g npm@8.1.3
RUN npm install -g pm2
RUN bash /1.sh
RUN npm update
COPY . .
RUN pm2 save
EXPOSE 5000
CMD ["pm2-runtime", "app.js"]`