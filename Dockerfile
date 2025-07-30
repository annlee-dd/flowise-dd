ARG FLOWISE_VERSION
ARG DD_TRACE_VERSION

FROM flowiseai/flowise:"${FLOWISE_VERSION}"

WORKDIR /app

RUN npm install dd-trace@"${DD_TRACE_VERSION}"

# Initialise DD Trace
ENV NODE_OPTIONS="--import dd-trace/initialize.mjs"