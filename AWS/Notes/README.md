# **AWS Cloud Practitioner Essentials**

### ****Deployment models for cloud computing****

1. Cloud-based Deployment (”Private Cloud”)→ AWS, Azure, GCP 
2. On-premises Deployment → Enterprise
3. Hybrid Deployment

### ****Benefits of cloud computing****

1. Trade upfront expense for variable expense
2. Stop spending money to run and maintain data centers
3. Stop guessing capacity
4. Benefit from massive economies of sale
5. Increase speed and agility
6. Go global in minutes

### **Types of cloud computing**

1. Infrastructure as a Service (Iaa
2. Platform as a Service (PaaS)
3. Software as a Service (SaaS)
    ![Screenshot from 2022-12-14 16-06-20](https://user-images.githubusercontent.com/106534693/207647905-6d5dc365-83d9-4e4b-b744-5c32b9f68963.png)

### Multitenancy

Sharing underlying hardware between virtual machines. 

### ****Amazon EC2 instance types****

1. ****General Purpose****
    1. provide a balance of compute, memory and networking resources
    2. Use cases: web servers and code repositories
2. ****Compute Optimized****
    1. or compute bound applications that benefit from high performance processors
    2. Use cases: data analytics, CPU-based artificial intelligence and machine learning (AI/ML) inference
3. ****Memory Optimized****
    1. designed to deliver fast performance for workloads that process large data sets in memory.
4. **Accelerated Computing**
    1. uses hardware accelerators, or co-processors, to perform functions, such as floating point number calculations, graphics processing, or data pattern matching
    2. Use cases: Machine learning, high performance computing, computational fluid dynamics
5. ****Storage Optimized****
    1. designed for workloads that require high, sequential read and write access to very large data sets on local storage.
    2. These instances maximize the number of transactions processed per second (TPS) for I/O intensive and business-critical workloads
    

**Scaling Up** ->  means adding more power to the machines that are running.

### ****Amazon EC2 Auto Scaling****

Amazon EC2 Auto Scaling enables you to automatically add or remove Amazon EC2 instances in response to changing application demand.

Within Amazon EC2 Auto Scaling, you can use two approaches: dynamic scaling and predictive scaling.

- ***Dynamic scaling*** responds to changing demand.
- ***Predictive scaling*** automatically schedules the right number of Amazon EC2 instances based on predicted demand.

To scale faster, you can use dynamic scaling and predictive scaling together.

Because Amazon EC2 Auto Scaling uses Amazon EC2 instances, you pay for only the instances you use, when you use them.

### ****Elastic Load Balancing****

It is a regional construct, therefore, the service is automatically highly available with no additional effort on your part.

ELB is automatically scalable. As your traffic grows, ELB is designed to handle the additional throughput with no change to the hourly cost.

When your EC2 fleet auto-scales **out**, as each instance comes online, the auto-scaling service just lets the Elastic Load Balancing service know that it's ready to handle the traffic, and off it goes. 

Once the fleet scales **in**, ELB first stops all new traffic, and waits for the existing requests to complete, to drain out. Once they do that, then the auto-scaling engine can terminate the instances without disruption to existing customers.

ELB is not only used for external traffic.

- Image
    ![Screenshot from 2022-12-14 18-58-53](https://user-images.githubusercontent.com/106534693/207648431-b2c9574d-eb36-4790-be83-ee6685ced044.png)

### Tightly coupled architecture

### Loosely coupled architecture

Single failure won’t cause cascading failures.

- Image
    ![Screenshot from 2022-12-14 19-23-53](https://user-images.githubusercontent.com/106534693/207648679-e18c27c8-827a-474c-b5d5-4cc8671e4f57.png)
    ![Screenshot from 2022-12-14 19-24-23](https://user-images.githubusercontent.com/106534693/207648778-b8bdc6e9-6b26-4de1-925e-ebe402ac69ef.png)
    ![Screenshot from 2022-12-14 19-24-57](https://user-images.githubusercontent.com/106534693/207648817-15cfa3bb-c163-4276-a5e2-429a7d1c8e18.png)

    

## ********************Payload********************

Data contained within a message.

**Two services facilitate application integration**: Amazon Simple Notification Service (Amazon SNS) and Amazon Simple Queue Service (Amazon SQS).

### ****Amazon Simple Queue Service (Amazon SQS)****

Using Amazon SQS, you can send, store, and receive messages between software components, without losing messages or requiring other services to be available. In Amazon SQS, an application sends messages into a queue. A user or service retrieves a message from the queue, processes it, and then deletes it from the queue.

A message queuing service such as Amazon SQS enables messages between decoupled application complements.

### ****Amazon Simple Notification Service (Amazon SNS)****

It is a publish/subscribe service. Using Amazon SNS topics, a publisher publishes messages to subscribers. This is similar to the coffee shop; the cashier provides coffee orders to the barista who makes the drinks.

In Amazon SNS, subscribers can be web servers, email addresses, AWS Lambda functions, or several other options.

When you're using EC2, you are responsible for patching your instances when new software packages come out, setting up the scaling of those instances as well as ensuring that you've architected your solutions to be hosted in a highly available manner.

You might be wondering what other services does AWS offer for compute that are more convenient from a management perspective.

### Serverless

You can’t access or see the underlying infrastructure or instances hosting your application.

The term “serverless” means that your code runs on servers, but you do not need to provision or manage these servers.

Another benefit of serverless computing is the flexibility to scale serverless applications automatically. Serverless computing can adjust the applications' capacity by modifying the units of consumptions, such as throughput and memory.

### ****AWS Lambda****

**[AWS Lambda](https://aws.amazon.com/lambda)** is a service that lets you run code without needing to provision or manage servers.

While using AWS Lambda, you pay only for the compute time that you consume. Charges apply only when your code is running.

For example, a simple Lambda function might involve automatically resizing uploaded images to the AWS Cloud. In this case, the function triggers when uploading a new image.

### ****How AWS Lambda works****

1. You upload your code to Lambda.
2. You set your code to trigger from an event source, such as AWS services, mobile applications, or HTTP endpoints.
3. Lambda runs your code only when triggered.
4. You pay only for the compute time that you use. In the previous example of resizing images, you would pay only for the compute time that you use when uploading new images. Uploading the images triggers Lambda to run code for the image resizing function.

Both Amazon ECS and Amazon EKS can run on top of EC2. But if you don't want to even think about using EC2s to host your containers because you either don't need access to the underlying OS or you don't want to manage those EC2 instances, you can use a compute platform called AWS Fargate. 

### AWS Fargate

Fargate is a serverless compute platform for ECS or EKS.

When using AWS Fargate, you do not need to provision or manage servers. AWS Fargate manages your server infrastructure for you.
