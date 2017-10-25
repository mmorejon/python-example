FROM python:3.6-alpine

COPY requirements.txt /code/

WORKDIR /code
RUN pip install -r requirements.txt

HEALTHCHECK \
    --interval=30s \
    --timeout=3s \
    CMD curl -f http://localhost:5000/test

COPY . /code/

CMD ["python","app.py"]
