# from fastapi import FastAPI, File, UploadFile
# from fastapi.middleware.cors import CORSMiddleware
# import uvicorn
# import numpy as np
# import os
# from io import BytesIO
# from PIL import Image
# import tensorflow as tf
# import json

# app = FastAPI()
# origins = [
#     "http://localhost",
#     "http://localhost:3000",
# ]
# app.add_middleware(
#     CORSMiddleware,
#     allow_origins=origins,
#     allow_credentials=True,
#     allow_methods=["*"],
#     allow_headers=["*"],
# )
# MODEL = tf.keras.models.load_model("./saved_models/2")



# CLASS_NAMES = ["Dark spots", "Clear Face","Pimples","Dark Heads"]

# # @app.get("/ping")
# # async def ping():
# #     return "Hello, I'm ok!"

# def read_file_as_image(data) -> np.ndarray:
#     image = np.array(Image.open(BytesIO(data)))
#     return image



# @app.post("/predict")
# async def predict(
#     file: UploadFile = File(...)
# ):
#     image = read_file_as_image(await file.read())
#     img_batch = np.expand_dims(image, 0)
    
#     predictions = MODEL.predict(img_batch)

#     predicted_class = CLASS_NAMES[np.argmax(predictions[0])]
#     confidence = np.max(predictions[0])
#     return {
#         'class': predicted_class,
#         'confidence': float(confidence)
#     }



# if __name__ == "__main__":
#     uvicorn.run(app, host='localhost', port=8000)


from fastapi import FastAPI, File, UploadFile
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import numpy as np
import os
from io import BytesIO
from PIL import Image
import tensorflow as tf
import json

app = FastAPI()
origins = [
    "http://localhost",
    "http://localhost:3000",
]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
MODEL = tf.keras.models.load_model("./training/TrainModel/my_model2")

CLASS_NAMES = ["Dark spots", "Clear Face", "Pimples", "Dark Heads"]

ISSUES_MAPPING = [
    ["Dark spots"],
    ["Normal skin"],
    ["Pimples"],
    ["Dark Heads"]
]

def read_file_as_image(data) -> np.ndarray:
    image = np.array(Image.open(BytesIO(data)))
    return image

@app.post("/predict")
async def predict(file: UploadFile = File(...)):
    image = read_file_as_image(await file.read())
    img_batch = np.expand_dims(image, 0)
    
    predictions = MODEL.predict(img_batch)

    predicted_class_index = np.argmax(predictions[0])
    predicted_class = CLASS_NAMES[predicted_class_index]
    confidence = np.max(predictions[0])

    # Get the issues for the predicted class
    issues = ISSUES_MAPPING[predicted_class_index]

    return {
        'class': predicted_class,
        'confidence': float(confidence),
        'issues': issues
    }

if __name__ == "__main__":
    uvicorn.run(app, host='localhost', port=8000)
