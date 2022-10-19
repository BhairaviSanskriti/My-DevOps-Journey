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
      ![image](https://user-images.githubusercontent.com/106534693/196670335-0d5675b8-010e-433c-93bb-3e3d424cc77c.png)
      ![image](https://user-images.githubusercontent.com/106534693/196671221-3d5b265d-94ae-4913-9d9c-d2016aaf6fc8.png)

  - ## Service
    - I used NodePort service to access my web page outside the cluster. I exposed the node at port 30100.
      ![svc_exposed](https://user-images.githubusercontent.com/106534693/196673082-fb2bf62e-8e49-419c-b1c9-7799ebbda0f5.jpg)
    - To get the node's ip address, run `kubectl get no -owide` command.
      ![image](https://user-images.githubusercontent.com/106534693/196675229-4a2d6eb4-aa72-4035-ba3f-211a88448f67.png)
    - To access service, all we have to do it run `curl -i <anyNodeIPAdress>:<exposedNodePort>`. In this case, I ran `curl -i 192.168.49.2:30100` command.
      ![image](https://user-images.githubusercontent.com/106534693/196676255-11488caf-8c95-4c98-811b-bc5dd7a3c500.png)
    - You can also access the website in the browser on the address `<anyNodeIPAdress>:<exposedNodePort>`, which in my case is `192.168.49.2:30100`.
      ![website](https://user-images.githubusercontent.com/106534693/196673729-dac16092-0c15-4615-86e3-2bd60e28a977.jpg)

  - ## Recreate and Rolling Update

    - I used Recreate and RollingUpdate strategies to know their differences.
      - In case of **Recreate**, when I edited the deployment by updating the image all the pods got terminated. Only after the termination of all pods new pods got created.
      ![recreate](https://user-images.githubusercontent.com/106534693/196678995-8433862f-036e-4018-b056-5c5b3733dce4.jpg)
      - For **RollingUpdate** strategy, pods are terminated and also gets created alongside.
        ![rollingupdate](https://user-images.githubusercontent.com/106534693/196680475-35b0a333-fdfc-4c99-8ea2-6d0c170e59ce.jpg)

        
