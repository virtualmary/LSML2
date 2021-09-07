FROM python:3
COPY . /ml_server
WORKDIR /ml_server
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "cat_breeds_inference.py"]
EXPOSE 8000
