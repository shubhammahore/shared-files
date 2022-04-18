# build environment
FROM node:16-alpine3.14 as react-build
WORKDIR /app
COPY . ./
COPY package*.json ./
RUN npm install --production
COPY . ./
RUN npm run build

# server environment
FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/configfile.template

COPY --from=react-build /app/build /usr/share/nginx/html

ENV PORT 8080
ENV HOST 0.0.0.0
EXPOSE 8080
CMD sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"

# Use below commands to deploy App to google cloud run using cloud build
# Reference: https://cloud.google.com/community/tutorials/deploy-react-nginx-cloud-run
# gcloud init
# clone your git repo
# cd project-path
# gcloud builds submit --tag gcr.io/[YOUR_PROJECT_ID]/[APP_NAME]
# gcloud run deploy --image gcr.io/[YOUR_PROJECT_ID]/[APP_NAME] --platform managed
 
# If Running Docker Container Locally use below commands
# docker build -f Dockerfile -t react-image-local .
# docker run -p 3000:8080 --name react-app-local react-image-local

# Push to Azure Container Registry [AZURE_CONTAINER_REGISTRY_URL = reactappdev.azurecr.io]
# docker login [AZURE_CONTAINER_REGISTRY_URL]
# docker build -t react-image .
# docker tag gpts-react-image [AZURE_CONTAINER_REGISTRY_URL]/react-image
# docker push [AZURE_CONTAINER_REGISTRY_URL]/react-image
# docker pull [AZURE_CONTAINER_REGISTRY_URL]/react-image
