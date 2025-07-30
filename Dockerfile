FROM flowiseai/flowise:3.0.4

WORKDIR /app

RUN npm install dd-trace@^5.0.0 

# Initialise DD Trace
ENV NODE_OPTIONS="--import dd-trace/initialize.mjs"
