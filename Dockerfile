# Base image with Python
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and source code
COPY backend/requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
COPY backend/ /app/

# Create folder for reports
RUN mkdir -p /app/reportes

# Expose FastAPI default port
EXPOSE 8000

# Start the application with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]