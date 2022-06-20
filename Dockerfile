FROM python:slim
WORKDIR /app/
COPY requirements.txt /app/
RUN pip3 install --upgrade pip \
      && pip3 install --no-cache-dir -r requirements.txt
COPY api.py /app/ 
COPY .env /app/
EXPOSE 5000
CMD ["python3", "api.py"]