## About
In this project, I have created a Jenkins pipeline to update my container image on the docker hub and to update the image tag in deployment.yaml file. 

## Steps
1. I created an AWS ec2 instance. Then I installed Jenkins on it and ran it on port 8080.
  ![image](https://user-images.githubusercontent.com/106534693/202862759-6d7dd211-c788-45f7-abf8-2246639af3e9.png)
3. I configured Jenkins by installing git and docker plugins.
4. I needed to create two jobs. One is for updating the image tag on the docker hub as soon as any change is made to the web application, and another one is to update the application's image tag in the deployment.yaml file. The first job will trigger the second job.
5. I created two GitHub repositories. 
    1. [First Repository](https://github.com/BhairaviSanskriti/Jenkins-Project) contains the Jenkinsfile. This file will be used to build the first job. This repository also contains the application code. When a change is made in this repo either in the source code or the Jenkinsfile then a job will get triggered. I have used GitHub webhook to do so.
    2. The [Second Repository](https://github.com/BhairaviSanskriti/Jenkins-Update-Manifest) contains the Jenkinsfile for the second job and also the manifest of our deployment. The Jenkinsfile in this repo will get triggered by the first job. After that, it will update the image tag in the deployment.yaml file.
5. I created these projects using a pipeline script from SCM (source code management), which in my case was GitHub.
  ![image](https://user-images.githubusercontent.com/106534693/202862041-a601931b-45d5-4ab8-b639-16a923152487.png)
6. The first project was named *sanskriti-portfolio*. When built, it will update the version of the docker image and push it to the DockerHub repository. You can build this job from the Jenkins console or GitHub repo.
  ![image](https://user-images.githubusercontent.com/106534693/202862052-35c8a0d2-4a64-4dfc-86bb-1e5ede927e71.png)
7. This second project named *updateManifest* will get triggered every time the first project is built. This job will update the Manifest and perform a commit in the GitHub repo to make the change effective. This way our deployment.yaml file contains the latest image tag.  ![image](https://user-images.githubusercontent.com/106534693/202862073-bc76a164-bccd-4500-9ebf-6824e7f0c002.png)


## Conclusion
In this project, I build the CI pipeline. I got to use various concepts like triggering one job from another, passing parameters from one job to another, and using webhooks to trigger jobs. 
