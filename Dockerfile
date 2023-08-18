FROM python:3.9

WORKDIR /Hog

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 -y

COPY ./requirements.txt /Hog/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /Hog/requirements.txt

COPY ./ /Hog/

ENV PYTHONPATH "${PYTHONPATH}:/Hog"

#
CMD ["uvicorn","app.main:app", "--host", "0.0.0.0","--port","80"]