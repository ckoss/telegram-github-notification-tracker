FROM python:3.7-alpine

RUN apk --no-cache add gcc \
                       libc-dev \
                       libffi-dev \
                       openssl-dev 

RUN pip install --no-cache-dir python-telegram-bot==12.2.0 \
                                pygithub==1.43.7 \
                                beautifulsoup4==4.7.1 \
                                markdown==3.1.1 \
                                html5lib

COPY issuetracker/ /app/issuetracker
COPY setup.py main.py /app/

WORKDIR /app

RUN pip install --no-cache-dir . 

COPY config.ini /app

CMD ["python", "main.py"]
