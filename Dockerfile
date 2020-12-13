FROM node:12

# nice clean home for our action files
RUN mkdir /action
WORKDIR /action

# install deps
COPY ./package.json ./yarn.lock ./
RUN yarn install --frozen-lockfile

# copy in entrypoint after dependency installation
COPY entrypoint.js .

ENTRYPOINT ["node", "/action/entrypoint.js"]
