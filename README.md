# Project 2 - Bash Command Line Tool 

## Key Objectives

I built a bash command line tool that reads a file and ouputs: '
1. Number of columns 
2. Number of rows
3. First 3 rows
4. Number of unique ratings
5. Average rating 

The repo is pushed to Dockerhub and can be accessed in Cloud9. Check out my demo video here. 

## Dataset 

The example file is a CSV file containing Yelp reviews and ratings from ![Hugging Face] (https://huggingface.co/datasets/yelp_review_full), extracted from the 2015 Yelp Review Challenge. It contains 2 data fields, which are 'text' for reviews and 'label' for ratings. There are 130,000 reviews in the training data and 10,000 reviews in the testing data. 

## Workflow Diagram


## Workflow Steps 

### 1. Create bash command line
* Create bash command line file (main.sh) and use `chmod u+x main.sh` to grant execution permission to file owner and run shell command.
* Test main.sh on dataset locally with `./main.sh my-dataset-train.csv`.

### 2. Build Docker container image in Codespace
* Build docker using `docker build -t imagename .`.
* Run main.sh with image id `docker run -t d55f7cbf506b /bin/bash main.sh my-dataset-train.csv`.

### 3. Push container image to Dockerhub 
* Create access token in Dockerhub. 
* Create access token in Docker Hub. 
* Copy access token and add to Codespace Secrets (DOCKERHUB_TOKEN).  
* Create repo in Docker Hub. 
* Login to Docker Hub using `$ docker login -u michellejieli -p $DOCKERHUB_TOKEN` in Codespace terminal.
* Build and tag locally with `docker build . -t michellejieli/proj2`.
* Push with `docker push michellejieli/proj2`.
* To verify that repo runs: https://hub.docker.com/repository/docker/michellejieli/proj2

### 4. Run Docker Hub repo in Cloud9 ([Class lecture](https://duke.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=65156928-c3ae-4ef7-87a3-aefb00fbb6ad))
* Create AWS account. 
* Create a new envivronment in Cloud9.
* Run code locally with `docker run -it michellejieli/proj2:latest /bin/bash main.sh my-dataset-test.csv`
* In new environment, navigate to AWS > ECR and create registry for container (right click).
* Get authentication token and authenticate Docker to your registry (command found in ECR push commands): `aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 681238067355.dkr.ecr.us-east-1.amazonaws.com`
* Retag existing Docker image: `docker tag michellejieli/proj2 681238067355.dkr.ecr.us-east-1.amazonaws.com/proj2:latest`
* Push Docker image to [AWS repo](https://us-east-1.console.aws.amazon.com/ecr/repositories/private/681238067355/proj2?region=us-east-1): `docker push 681238067355.dkr.ecr.us-east-1.amazonaws.com/proj2:latest`
* Run main.sh in AWS repo: `docker run -it 681238067355.dkr.ecr.us-east-1.amazonaws.com/proj2:latest /bin/bash main.sh my-dataset-test.csv`
