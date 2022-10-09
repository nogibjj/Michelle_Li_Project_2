[![Codespaces Prebuilds](https://github.com/nogibjj/assimilate-hugging-face/actions/workflows/codespaces/create_codespaces_prebuilds/badge.svg)](https://github.com/nogibjj/assimilate-hugging-face/actions/workflows/codespaces/create_codespaces_prebuilds)
# Project 2 - Bash Command Line Tool 

I built a bash command line tool that reads a file and ouputs: '
1. Number of columns 
2. Number of rows
3. First 3 rows
4. Number of unique ratings
5. Average rating 

The example file is a CSV file containing Yelp reviews and ratings from ![Hugging Face] (https://huggingface.co/datasets/yelp_review_full), extracted from the 2015 Yelp Review Challenge. It contains 2 data fields, which are 'text' for reviews and 'label' for ratings. There are 130,000 reviews in the training data and 10,000 reviews in the testing data. 

Workflow


Demo 

Create bash command line
1. Create bash command line file (main.sh) and use `chmod u+x main.sh` to grant execution permission to file owner and run shell command.
2. Test main.sh on dataset locally with `./main.sh my-dataset-train.csv`.

Build Docker container image in Codespace
3. Build docker using `docker build -t imagename .`.
4. Run main.sh with image id `docker run -t d55f7cbf506b /bin/bash main.sh my-dataset-train.csv`.

Push container image to Dockerhub 
5. Create access token in Dockerhub. 
6. Copy access token and add to Codespace Secrets (DOCKERHUB_TOKEN).  
7. Create repo in Dockerhub. 
8. Login to Dockerhub using `$ docker login -u michellejieli -p $DOCKERHUB_TOKEN` in Codespace terminal.
9. Build and tag locally with `docker build . -t michellejieli/proj2`.
10. Push with `docker push michellejieli/proj2`.
11. Verify I can run repo by pulling from Dockerhub: https://hub.docker.com/repository/docker/michellejieli/proj2


