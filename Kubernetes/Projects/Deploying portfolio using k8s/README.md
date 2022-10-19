# About
  I made a simple portfolio website and deployed it using Kubernetes.
# Procedure
  - ## Image:
    - I created an image of a container on which I ran my website locally.
       ![image](https://user-images.githubusercontent.com/106534693/196607224-8f30b157-4149-4154-b107-514a9381eb9c.png)

    - Then, I pushed it into the Docker hub. [Here](https://hub.docker.com/repository/docker/bhairavisanskriti/my-portfolio) it is.
        ![image](https://user-images.githubusercontent.com/106534693/196607315-60f34909-bff9-43d8-8b44-7de4ab174676.png)
   
      
  - ## Deployment:
    - After this, I deployed the application using the k8s object Deployment.
      
    - I used NodePort service to access my web page outside the cluster.
    - I used Recreate and RollingUpdate strategies to know their differences.
