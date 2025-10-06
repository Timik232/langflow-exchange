#!/bin/sh
set -e

echo "Waiting for PostgreSQL..."
sleep 10
echo "PostgreSQL ready."

FLOW_COUNT=$(python3 -c "
import os
import asyncio
from sqlalchemy.ext.asyncio import create_async_engine
from sqlalchemy import text

DB_URL = os.environ.get('LANGFLOW_DATABASE_URL', '').replace('postgresql://', 'postgresql+psycopg://', 1)

async def main():
    if not DB_URL:
        print(0)
        return
    engine = create_async_engine(DB_URL, echo=False)
    try:
        async with engine.begin() as conn:
            result = await conn.execute(text('SELECT COUNT(*) FROM flow'))
            count = result.scalar() or 0
            print(count)
    except:
        print(0)
    finally:
        await engine.dispose()

asyncio.run(main())
")

FLOW_COUNT=$(printf '%s' "$FLOW_COUNT" | tr -d ' \n\t\r')

if [ "$FLOW_COUNT" -gt 0 ]; then
  echo "Flows already exist ($FLOW_COUNT); skipping auto-load."
  unset LANGFLOW_LOAD_FLOWS_PATH
else
  echo "No flows found; will auto-load from /app/flows."
fi

exec python -m langflow run "$@"
