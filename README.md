Currency Exchange Service

This is a Spring Boot application hosting a service to get the exchange rates for USD/INR, EUR/INR and AUD/INR on mock rates persisted in in-memory H2 Database.

This is a complete project to showcase the complete CI/CD workflow using Github Actions.

1. Create a REST API using Spring Boot
2. Upload to GitHub
3. Build the project and upload the image in DockerHub using **Dockerfile**
4. Deploy the service on GoogleKubernetesEngine Cluster using **deployment.yaml**
5. To orchestrate the complete CI/CD on GitHub, GithubActions is used.

**Steps to upload project to GitHub**
1. git init -b master
2. git add .
3. git commit -m "Initial Commit"
4. git remote add origin "https://github.com/sanjeeb-das-lti/currency-exchange-service.git"
5. git push -u origin master

**Steps to build Dockerfile**
1. Get the base java image[java version in pom.xml]- FROM openjdk:11
2. Expose the port on which app will be available(maintained in application.properties)- EXPOSE 8000
3. Copy the final jar[refer pom.xml- </finalName>] name from target- ADD target/currency-exchange-ser-github-action.jar currency-exchange-ser-github-action.jar
4. Mark the entrypoint- ENTRYPOINT ["java","-jar","currency-exchange-ser-github-action.jar"]

**Steps to build deployment.yaml**
1. Create an account (free) on https://console.cloud.google.com
2. Navigate to Kubernetes Engine > Create a Cluster
3. Activate Cloud Shell
4. Run the command:
   kubectl create deployment currency-exchange --image=dsan2119/currency-exchange-ser-github-action
   kubectl expose deployment currency-exchange --type=LoadBalancer --port=8000
5. Check if all the components are created correctly- kubectl get all

**Create JSON files to integrate it with the code base**
Activate GCloud on local machine
1. glcoud config set project *your.project.id*
   **Fix issue for authentication to GCloud**
1. gcloud components install gke-gcloud-auth-plugin
2. gcloud container clusters get-credentials *cluster.name* --zone=*zone.on.which.cluster.is.created*

**Active kubectl on local machine and create the deployment.yaml**
1. kubectl get deployments currency-exchange -o yaml >> deployment.yaml
2. kubectl get service currency-exchange -o yaml >> service.yaml
3. Merge the service.yaml in deployment.yaml to create a single file for deployment

**Deploy the project on Github**
   Create Github Actions Workflow on GitHub tab: Actions
1. Create Action for Build with Maven [This project is Maven Based project]
2. Create Action to Build and Publish Image to DockerHub repository
3. Create Action to Deploy image to GKE Cluster

Use the urls.txt to fire the service from the Kubernetes External Service IP

**Happy Coding :)**

   





