FROM flowiseai/flowise:latest

WORKDIR /app

RUN npm install dd-trace@^5.0.0

# DD Agent Container level config
ENV DD_LLMOBS_ENABLED=1 \
    DD_LLMOBS_ML_APP="flowise-app" \
    NODE_OPTIONS="--import dd-trace/initialize.mjs"