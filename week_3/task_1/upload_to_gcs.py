import io
import os
import requests
import pandas as pd
import pyarrow
from google.cloud import storage
import os

init_url = 'https://github.com/DataTalksClub/nyc-tlc-data/releases/download/fhv/'

os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/home/zhanbulat/.gc/ardent-course-375307-fa5ca3e67fd8.json"

def upload_to_gcs(bucket, object_name, local_file):

    client = storage.Client()
    bucket = client.bucket(bucket)
    blob = bucket.blob(object_name)
    blob.upload_from_filename(local_file)
   


def web_to_gcs(year):
    for i in range(12):
        month = '0'+str(i+1)
        month = month[-2:]

        file_name = 'fhv_tripdata_' + year + '-' + month + '.csv.gz'
        request_url = init_url + file_name
        os.system(f"wget {request_url} -O {file_name}")
     
        upload_to_gcs("prefect-de-zoomcamp-zm", f"week_3/{file_name}", file_name)
        print(f"GCS: {file_name}")
web_to_gcs('2019')
