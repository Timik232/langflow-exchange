# Financial Assistant

AI agent for currency analysis built with Langflow and GigaChat. The agent helps retrieve current and historical currency data and perform analytical calculations.

## ✨ Features

- 📊 Real-time currency exchange rates
- 📈 Historical data analysis
- 🧮 Basic analytical calculations
- 🤖 Intelligent agent approach using GigaChat
- 🔧 Extensible Langflow-based architecture

## 🛠 Tech Stack

- **Langflow** - visual framework for building AI agents
- **GigaChat** - Russian language model
- **PostgreSQL** - database for Langflow
- **Docker & Docker Compose** - containerization
- **ExchangeRate API** - currency data source
- **Python 3.11+**

## 📋 Prerequisites

- Docker and Docker Compose
- Python 3.11 or higher (for local development)
- API keys:
  - [ExchangeRate API](https://www.exchangerate-api.com/) - for currency data
  - [GigaChat API](https://developers.sber.ru/gigachat) - for language model

## 🚀 Installation & Setup

### 1. Clone repository

```bash
git clone <repository-url>
cd langflow-project
```

### 2. Environment setup

Copy the example environment file:

```bash
cp .env.example .env
```

Edit `.env` and add your API keys:

```env
# API Keys
EXCHANGERATE_API_KEY=your_exchangerate_api_key_here
GIGA_API_KEY=your_gigachat_api_key_here

# Langflow Settings
LANGFLOW_PORT=7860
LANGFLOW_MCP_PORT=8000

# PostgreSQL Settings
POSTGRES_USER=langflow
POSTGRES_PASSWORD=langflow
POSTGRES_DB=langflow
```

### 3. Start project

Launch all services using Docker Compose:

```bash
docker-compose up -d
```

### 4. Access interface

After startup, Langflow will be available at:

```
http://localhost:7860
```

## 📁 Project Structure

```
langflow-project/
├── flows/                      # Langflow flows
│   ├── Financial agent.json    # Main financial agent
│   └── get_latest_rate.json    # Currency rate fetching flow
├── compose.yaml                # Docker Compose configuration
├── Dockerfile                  # Docker image for Langflow
├── pyproject.toml             # Python dependencies
├── .env.example               # Example environment variables
└── README.md                  # Documentation
```

## ⚙️ Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `EXCHANGERATE_API_KEY` | API key for ExchangeRate API | - |
| `GIGA_API_KEY` | API key for GigaChat | - |
| `LANGFLOW_PORT` | Langflow web interface port | 7860 |
| `LANGFLOW_MCP_PORT` | MCP server port | 8000 |
| `POSTGRES_USER` | PostgreSQL user | langflow |
| `POSTGRES_PASSWORD` | PostgreSQL password | langflow |
| `POSTGRES_DB` | Database name | langflow |

## 🎯 Available Flows

### Financial agent.json
Main agent for financial analysis. Includes:
- GigaChat integration for query processing
- Tools for retrieving currency rates
- Calculator for computations
- Agent logic for comprehensive analysis

### get_latest_rate.json
Specialized flow for fetching current currency rates via ExchangeRate API.

## 💡 Usage

1. Open Langflow web interface: `http://localhost:7860`
2. Select "Financial agent" flow from the list
3. Run the flow and start interacting with the agent
4. Example queries:
   - "What is the current USD to RUB exchange rate?"
   - "Show EUR trends for the last month"
   - "Calculate how many dollars I get for 10000 rubles"

## 🔧 Development

### Local dependency installation

```bash
# Install uv (if not already installed)
pip install uv

# Sync dependencies
uv sync

# Install dev dependencies
uv sync --group dev
```

### Run Langflow locally

```bash
uv run langflow run 
```

### Modifying flows

1. Open Langflow UI
2. Edit existing flow or create new one
3. Export changes to JSON
4. Save file to `flows/` directory

### 📊 Stopping & Cleanup

### Stop services

```bash
docker-compose down
```

### Full cleanup (including data)

```bash
docker-compose down -v
```

## 📝 License

This project is licensed under the MIT License. See `LICENSE` file for details.

## 👤 Author

Timik232

## ❓ Troubleshooting

### Ports already in use

If ports 7860 or 8000 are already in use, change them in `.env`:

```env
LANGFLOW_PORT=8080
LANGFLOW_MCP_PORT=8001
```

### API key issues

Make sure:
- API keys are correctly copied to `.env`
- No extra spaces or quotes
- Keys are active and not expired

### Database won't start

```bash
# Check logs
docker-compose logs postgres

# Recreate container
docker-compose down -v
docker-compose up -d
```
