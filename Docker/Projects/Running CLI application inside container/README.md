# Running a CLI application inside a container
## How to containerize your CLI application and run it

I made a [cli application](https://github.com/BhairaviSanskriti/My-DevOps-Journey/tree/main/Go/Projects/CLI%20application%20to%20order%20food) using Go and I wanted to containerize it. 

Here are the steps that I followed:

1. **Base image** of the container →  *golang:1.18.6-alpine3.16* . It’s more apt because it’s size is small in comparison to other *golang* images, and also because we want to run a GO cli application.
2. Then, I created a container using this base image and named it *food-app*. Entered into it. Created a directory */order-food* and wrote my code within this directory. My code constitutes files naming -  *main.go*, *bill.go*, *go.mod*, *greet.go*, *menu.go*, *modify.go*, *order.go* .
  
3. I've added the code files. You can also refer to this:[https://github.com/BhairaviSanskriti/Order-Food](https://github.com/BhairaviSanskriti/Order-Food) repo to gain more insight on what this application is about.
4. After writing all the neccessary files into this directory we will exit out of this container.
5. Make an image of this container by executing `docker commit food-app bhairavisanskriti/cli-app-image` command. This command will create an image of the name *bhairavisanskriti/cli-app-image* . As we have not specified the tag, so default tag will be assigned to it.
  ![image](https://user-images.githubusercontent.com/106534693/189168171-de36464e-56f6-44b0-adc0-c0337660067d.png)
6. Login to Docker by executing `docker login` command.
7. Push this image to the docker hub by running `docker push bhairavisanskriti/cli-app-image:latest` command.
  ![image](https://user-images.githubusercontent.com/106534693/189168361-d2161bfb-2d3c-443c-a2b5-948b349fb195.png)
8. Now, create a *Dockerfile*, and make changes to it:
    1. Image name → `bhairavisanskriti/cli-app-image:latest` 
    2. Working directory → We want to be inside */order-food*  directory once we enter the container, because that’s where our application code lies.
    3. Run command `go run .` to execute the code in the current working directory of your container once it gets created.
      ![image](https://user-images.githubusercontent.com/106534693/189168517-18b319d4-d138-4479-9d11-ccf14df72b5f.png)

9. Save *Dockerfile* and build the image named *order-food-image* out of this file. → `docker build -t order-food-image .`
  ![image](https://user-images.githubusercontent.com/106534693/189168656-c62142f4-4e90-4d30-b260-766d4f731fa4.png)
10. Create and run a container out of this image by executing : `docker run -it --name order-food-container order-food-image` 
  ![image](https://user-images.githubusercontent.com/106534693/189168772-3d48d393-4e0a-4df4-8025-93a54ddc401f.png)

11. Start using the CLI application.
12. The container, if it gets stopped then you can enter into it by executing `docker exec -it order-food-container ash` command. Then run the cli app by running `go run .`command.
  ![image](https://user-images.githubusercontent.com/106534693/189168872-cce11db0-4ea0-4bb1-878d-050fa6ecaf27.png)
  
 Your Go CLI application is containerized and it's running.
