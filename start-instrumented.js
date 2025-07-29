// DD Agent App level config
const tracer = require('dd-trace').init({
  service: process.env.DD_SERVICE || 'flowise-langchain',
  env: process.env.DD_ENV || 'dev',
  version: process.env.DD_VERSION || '1.0.0',
  logInjection: true,
  llmObservability: true,
  integrations: {
    langchain: true,
    openai: true,
    anthropic: true,
    bedrock: true,
    vertexai: true
  }
});

console.log('Datadog enabled for Flowise');

const { startFlowise } = require('flowise');
startFlowise();
