# LSML 2 Final Project
## Overview
The task which is solved with the model is classification of cat breeds.
The model should function as a web interface (HTML frontend) where the user can upload a photo of a cat and receive a prediction of TOP5 breeds with their probabilities.
## The task
The model task is to determine a cat breed by its photo. The model is able to distinguish between 67 breeds.
## The input
The model should be able to get a photo of a cat from the user with a web interface.
## The output
The model should be able to return a prediction of TOP5 breeds with their probabilities in a web interface.
## The data
This dataset from Kagle was used:
https://www.kaggle.com/ma7555/cat-breeds-dataset
The dataset contains around 67 thousand of photos for 67 cat breeds. 

The dataset is structured as cats.csv file with information about samples incluing photo ID and breed and set of folders (one folder for each breed) with photos.

Given the size of the dataset download by direct link was not practical and the data was saved to Google Drive which was mounted to Colab for training.
## Training
Trainig was done is Colab to utilize its GPU capacities. The traing was done with transfer learning approach using Big Transfer model (BiT-M-R50x1 variant) as the pretrained base model.

Accuracy of 42% on test sample was achieved which can be considered a good enough result given that the model tries to distinguish between 67 breeds, many of them looking similar. On practical testing with photos of breeds with distinguishable characteristic such as scottish fold or abyssinian the model attributed very high accuracy to the true breed.

Cross Entropy was used for the loss function and SGD was used for the optimizer.

The resulting trained model was saved to Googe Drive and then used for the runtime architecture.

## Runtime architecture
The trained model was used to build a web server (using Flask) to create an interface where the user can upload a photo and get breed prediction. To deploy the service a docker container was created. This contained was uploaded to Docker Hub as 

## Files in this GitHub
LSML2_final_project.ipynb - overview

Cat_breeds_train.ipynb - notebook for training (intended to be used on Colab)

model/cats_model_stated - saved weights for the trained model

model/cat_model_class_names - names of breeds

cat_breeds_inference.py - source code for the HTML frontend

dockerfile - dockerfile for building Docker container with the service

requirements.txt - requirements needed to build the container

static and templates folders - needed for the HTML fronted operation

## Run instructions: training

1. Download dataset archive from https://www.kaggle.com/ma7555/cat-breeds-dataset and save it to your Google Drive in folder "data" (or change the code in the notebook below)
2. Upload Cat_breeds_train.ipynb to Google Colab and run

## Run instructions: using model (HTML front end)
Build and run a docker container from this Git Hub local copy folder with the command

docker build -t ml_server .  
docker run -p 8000:8000 ml_server 

OR download and run ready container

docker pull virtualmary/ml_server    
docker run -p 8000:8000 virtualmary/ml_server

