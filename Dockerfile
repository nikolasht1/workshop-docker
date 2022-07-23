FROM python:3.8-slim-buster

WORKDIR /app/

COPY requirements.txt .env api.py /app/

RUN apt-get update \
      && pip3 install --upgrade pip \
        && pip3 install --no-cache-dir -r requirements.txt 
        
EXPOSE 5000

CMD [ "python3", "api.py", "0.0.0.0:5000", "-b", "-m"]