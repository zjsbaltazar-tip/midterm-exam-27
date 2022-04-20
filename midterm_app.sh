#!/bin/bash
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static
cp midterm_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.
echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
Lab - Build a CI/CD Pipeline Using Jenkins
© 2020 - 2022 Cisco and/or its affiliates. All rights reserved. Cisco Public Page 8 of 30 www.netacad.com
echo "COPY midterm_app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/midterm_app.py" >> tempdir/Dockerfile
cd tempdir
docker build -t midterm_app .
docker run -t -d -p 5050:5050 --name midtermrunning midterm_app
docker ps -a