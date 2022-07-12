FROM python:slim

WORKDIR /app/

COPY requirements.txt .env api.py /app/

RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils gcc build-essential\
      && pip3 install --upgrade pip \
        && pip3 install --no-cache-dir -r requirements.txt \
          && python3 -m pip install --upgrade pip \
            && python3 -m pip install -r requirements.txt

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1  

EXPOSE 5000

CMD [ "python3", "api.py", "-m" , "flask", "run", "--host=127.0.0.1"]
#CMD ["python3", "api.py"]