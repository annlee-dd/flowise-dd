# Flowise + Datadog LLM Observability Integration

This setup instruments the [Flowise](https://github.com/FlowiseAI/Flowise) low-code LLM orchestration tool with **Datadog AI Observability**, enabling prompt-level tracing, LangChain insights, and service telemetry — all with zero changes to the core Flowise code.

---

## 🔧 Overview

### 🐳 Dockerfile
This Dockerfile extends the official Flowise image to enable **Datadog Node.js tracing** via the `dd-trace` library. It configures automatic instrumentation of Flowise at startup using the `NODE_OPTIONS` environment variable and Datadog’s AI observability settings.

### 📜 Startup Script
A custom script bootstraps Datadog tracing before Flowise launches. It enables AI observability for LangChain, OpenAI, Anthropic, Bedrock, and VertexAI — allowing **end-to-end prompt tracing** and metadata tagging in Datadog.

### 🧱 Docker Compose
This Docker Compose setup deploys Flowise alongside a **Datadog Agent sidecar container** that captures APM, logs, and metrics. It provides full observability for Flowise workflows and LLM usage.

---

## 🚀 Setup Instructions

### 1️⃣ Prerequisites
- Docker + Docker Compose installed
- Datadog account with API key

---

### 2️⃣ Configuration Steps

1. **Generate a Datadog API key**:  
   [https://app.datadoghq.com/organization-settings/api-keys](https://app.datadoghq.com/organization-settings/api-keys)

2. **Create a `.env` file** with the following contents:
   ```env
   DD_API_KEY=your-datadog-api-key
   DD_SITE=datadoghq.com            # or datadoghq.eu / datadoghq.us depending on region
   DD_SERVICE=flowise-langchain
   DD_ENV=dev

3. **Build and run the containers:*
    docker-compose build --no-cache
    docker-compose up -d

4. **Access Flowise UI**:
    Open http://localhost:3000 in your browser.

### 🛠️ Using the App

1. **Register a new user** on the Flowise UI.
2. **Create a LangChain-based workflow**:
   - Use **Conversational Chains** or **Agent** nodes to trigger LLM calls.
   - These interactions will be **traced and logged in Datadog**.
3. **Get/ create OpenAI API Key**:
   [https://platform.openai.com/api-keys] (https://platform.openai.com/api-keys)

---

### ✅ Validating Telemetry in Datadog

1. Visit: [Datadog LLM Observability](https://app.datadoghq.com/llm/applications)
2. Ensure **`flowise-app`** appears in the top-left application selector.
3. Navigate to the **Trace** tab:
   - Confirm **LangChain → LLM → Response** traces are visible.
   - Spans should show:
     - **Model used**
     - **Latency**

