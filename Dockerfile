FROM python:slim
WORKDIR /app/
COPY requirements.txt .env api.py /app/
RUN pip3 install --upgrade pip \
      && pip3 install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD ["python3", "api.py"]