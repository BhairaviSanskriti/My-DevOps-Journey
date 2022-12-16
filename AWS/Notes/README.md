# **AWS Cloud Practitioner Essentials**
Developing fundamentals understanding of the AWS Cloud using [AWS Cloud Practitioner Essentials
](https://aws.amazon.com/training/digital/aws-cloud-practitioner-essentials/) course. 
Making short notes as I learn, using this course.
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

1. Infrastructure as a Service (IaaS)
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
## Regions

Each Region is isolated from every other Region in the sense that absolutely no data goes in or out of your environment in that Region without you explicitly granting permission for that data to be moved.

### Four key factors to choose a region

When determining the right Region for your services, data, and applications, consider the following four business factors.

1. **Compliance** with data governance and legal requirements
2. **Proximity** to your customers
3. Feature Availability
4. Pricing

### Availability Zones (AZ)

An **Availability Zone** is a single data center or a group of data centers within a Region.

Availability Zones are located tens of miles apart from each other. This is close enough to have low latency (the time between when content is requested and received) between Availability Zones. However, if a disaster occurs in one part of the Region, they are distant enough to reduce the chance that multiple Availability Zones are affected.

All AZs in an AWS Region are interconnected.

- Image
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/74b62b61-8eaa-44d7-8913-8328d8c71fc9/Untitled.png)
    

A best practice is to run applications across at least two Availability Zones in a Region.

- Image
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/36a396e8-45fb-4115-932d-ea817cbf5728/Untitled.png)
    

Many of the AWS services run at the Region level, meaning they run synchronously across multiple AZs without any additional effort on your part. 

For example, ELB. This is actually a regional construct. It runs across all Availability Zones, communicating with the EC2 instances that are running in a specific Availability Zone. Regional services are by definition already highly available at no additional cost of effort on your part.

# CDN

Remember when selecting a Region, one of the major criteria was proximity to your customers, but what if you have customers all over the world or in cities that are not close to one of our Regions?

Caching copies of data closer to customers all around the world uses the concept of content delivery networks or [CDNs](https://www.cloudflare.com/en-gb/learning/cdn/what-is-a-cdn/).

CDNs are commonly used, and on AWS, we call our CDN Amazon CloudFront. 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/131d81c7-5880-4fc0-a18d-02921f339aaf/Untitled.png)

## Amazon CloudFront

It is a service that helps deliver data, video, applications, and APIs to customers around the world with low latency and high transfer speeds. Amazon CloudFront uses what are called Edge locations, all around the world, to help accelerate communication with users, no matter where they are. 

## **Edge locations**

An **edge location** is a site that Amazon CloudFront uses to store cached copies of your content closer to your customers for faster delivery.

Edge locations are separate from Regions, so you can push content from inside a Region to a collection of Edge locations around the world, in order to accelerate communication and content delivery. 

AWS Edge locations, also run more than just CloudFront. They run a domain name service, or DNS, known as Amazon Route 53, helping direct customers to the correct web locations with reliably low latency.

**AWS Outposts** allow you to run AWS infrastructure right in your own data center.

# ****Ways to interact with AWS services****

1. AWS Management Console
2. AWS CLI
3. SDKs: SDKs make it easier for you to use AWS services through an API designed for your programming language or platform.
4. Various other tools: Manage tools like AWS CloudFormation. AWS Elastic Beanstalk

# **AWS Elastic Beanstalk**

With **AWS Elastic Beanstalk**, you provide code and configuration settings, and Elastic Beanstalk deploys the resources necessary to perform the following tasks:

- Adjust capacity
- Load balancing
- Automatic scaling
- Application health monitoring

# **AWS CloudFormation**

With **AWS CloudFormation**, you can treat your infrastructure as code. This means that you can build an environment by writing lines of code instead of using the AWS Management Console to individually provision resources.

---

# Networking

## VPC

A networking service that you can use to establish boundaries around your AWS resources is **[Amazon Virtual Private Cloud (Amazon VPC)](https://aws.amazon.com/vpc/)**.

Amazon VPC enables you to provision an isolated section of the AWS Cloud. In this isolated section, you can launch resources in a virtual network that you define. Within a virtual private cloud (VPC), you can organize your resources into subnets. A **subnet** is a section of a VPC that can contain resources such as Amazon EC2 instances.

## ****Internet gateway****

To allow public traffic from the internet to access your VPC, you attach an **internet gateway**
 to the VPC.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/88da4b51-54cb-43a3-bfd9-c67f33967b5a/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/554fc265-ed0e-4973-b640-94aa39811427/Untitled.png)

An internet gateway is a connection between a VPC and the internet. You can think of an internet gateway as being similar to a doorway that customers use to enter the coffee shop. Without an internet gateway, no one can access the resources within your VPC.

## ****Virtual private gateway****

To access private resources in a VPC, you can use a **virtual private gateway**.

Here’s an example of how a virtual private gateway works. You can think of the internet as the road between your home and the coffee shop. Suppose that you are traveling on this road with a bodyguard to protect you. You are still using the same road as other customers, but with an extra layer of protection.

The bodyguard is like a virtual private network (VPN) connection that encrypts (or protects) your internet traffic from all the other requests around it.

The virtual private gateway is the component that allows protected internet traffic to enter into the VPC. Even though your connection to the coffee shop has extra protection, traffic jams are possible because you’re using the same road as other customers.

![https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671116400/GvF_bYwLw7ZCiUdk9DuT2w/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/l6TOPFdq56BwNLzb_s8U3lQzEONXm1FMX.png](https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671116400/GvF_bYwLw7ZCiUdk9DuT2w/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/l6TOPFdq56BwNLzb_s8U3lQzEONXm1FMX.png)

A virtual private gateway enables you to establish a virtual private network (VPN) connection between your VPC and a private network, such as an on-premises data center or internal corporate network. A virtual private gateway allows traffic into the VPC only if it is coming from an approved network.

## **AWS Direct Connect**

**[AWS Direct Connect](https://aws.amazon.com/directconnect/)** is a service that enables you to establish a dedicated private connection between your data center and a VPC.

**AWS Direct Connect provides a physical line that connects your network to your AWS VPC.**

Suppose that there is an apartment building with a hallway directly linking the building to the coffee shop. Only the residents of the apartment building can travel through this hallway.

This private hallway provides the same type of dedicated connection as AWS Direct Connect. Residents are able to get into the coffee shop without needing to use the public road shared with other customers.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4bbb171f-9490-4fb1-bcae-f3cc16fc41eb/Untitled.png)

![https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671116400/GvF_bYwLw7ZCiUdk9DuT2w/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/J-OFNyD3j-0JCfWl_YdzRvczPABE_j-yV.png](https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671116400/GvF_bYwLw7ZCiUdk9DuT2w/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/J-OFNyD3j-0JCfWl_YdzRvczPABE_j-yV.png)

The private connection that AWS Direct Connect provides helps you to reduce network costs and increase the amount of bandwidth that can travel through your network.

***It's also important to note that one VPC might have multiple types of gateways attached for multiple types of resources all residing in the same VPC, just in different subnets.***

## **Subnets and network access control lists**

The only technical reason to use subnets in a VPC is to control access to the gateways. The public subnets have access to the internet gateway; the private subnets do not.

In the coffee shop, you can think of the counter area as a VPC. The counter area divides into two separate areas for the cashier’s workstation and the barista’s workstation. In a VPC, **subnets** are separate areas that are used to group together resources.****

### **Subnets**

A subnet is a section of a VPC in which you can group resources based on security or operational needs. Subnets can be public or private.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d10c8f02-bd50-4e8a-9979-4d12502dc8e3/Untitled.png)

**Public subnets** contain resources that need to be accessible by the public, such as an online store’s website.

**Private subnets** contain resources that should be accessible only through your private network, such as a database that contains customers’ personal information and order histories.

In a VPC, subnets can communicate with each other. For example, you might have an application that involves Amazon EC2 instances in a public subnet communicating with databases that are located in a private subnet.

## **Network traffic in a VPC**

When a customer requests data from an application hosted in the AWS Cloud, this request is sent as a packet. A **packet** is a unit of data sent over the internet or a network.

It enters into a VPC through an internet gateway. Before a packet can enter into a subnet or exit from a subnet, it checks for permissions. These permissions indicate who sent the packet and how the packet is trying to communicate with the resources in a subnet.

The VPC component that checks packet permissions for subnets is a **[network access control list (ACL)](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-network-acls.html)**.

## **Network access control lists (ACLs)**

A network access control list (ACL) is a virtual firewall that controls inbound and outbound traffic at the subnet level.

![https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671127200/VrBWFpZulgzHsyHo-hAoHg/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/3VvC_sZaItiPLSyu_e5z0Nx1wJ-H36Lsd.png](https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671127200/VrBWFpZulgzHsyHo-hAoHg/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/3VvC_sZaItiPLSyu_e5z0Nx1wJ-H36Lsd.png)

Each AWS account includes a default network ACL. When configuring your VPC, you can use your account’s default network ACL or create custom network ACLs.

By default, your account’s default network ACL allows all inbound and outbound traffic, but you can modify it by adding your own rules. For custom network ACLs, all inbound and outbound traffic is denied until you add rules to specify which traffic to allow. Additionally, all network ACLs have an explicit deny rule. This rule ensures that if a packet doesn’t match any of the other rules on the list, the packet is denied.

## **Stateless packet filtering**

Network ACLs perform **stateless** packet filtering. They remember nothing and check packets that cross the subnet border each way: inbound and outbound.

Recall the previous example of a traveler who wants to enter into a different country. This is similar to sending a request out from an Amazon EC2 instance and to the internet.

When a packet response for that request comes back to the subnet, the network ACL does not remember your previous request. The network ACL checks the packet response against its list of rules to determine whether to allow or deny.

![https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671127200/VrBWFpZulgzHsyHo-hAoHg/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/d_0Zlj9p07VMaSC0_y7vKKj12R8wZy8gK.png](https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671127200/VrBWFpZulgzHsyHo-hAoHg/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/d_0Zlj9p07VMaSC0_y7vKKj12R8wZy8gK.png)

After a packet has entered a subnet, it must have its permissions evaluated for resources within the subnet, such as Amazon EC2 instances.

The VPC component that checks packet permissions for an Amazon EC2 instance is a **[security group](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)**.

# **Security groups**

A security group is a virtual firewall that controls inbound and outbound traffic for an Amazon EC2 instance.

![https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671127200/VrBWFpZulgzHsyHo-hAoHg/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/dzV_KitkeFinWgJ1_s3gZMSNIJWunc8qs.png](https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671127200/VrBWFpZulgzHsyHo-hAoHg/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/dzV_KitkeFinWgJ1_s3gZMSNIJWunc8qs.png)

By default, a security group denies all inbound traffic and allows all outbound traffic. You can add custom rules to configure which traffic to allow or deny.

If you have multiple Amazon EC2 instances within a subnet, you can associate them with the same security group or use different security groups for each instance.

# **Stateful packet filtering**

Security groups perform **stateful** packet filtering. They remember previous decisions made for incoming packets.

Consider the same example of sending a request out from an Amazon EC2 instance to the internet.

When a packet response for that request returns to the instance, the security group remembers your previous request. The security group allows the response to proceed, regardless of inbound security group rules.

![https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671127200/VrBWFpZulgzHsyHo-hAoHg/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/mZnrG4zbkW89q5P5_unCx4hVGemR5ybFS.png](https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671127200/VrBWFpZulgzHsyHo-hAoHg/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/mZnrG4zbkW89q5P5_unCx4hVGemR5ybFS.png)

Both network ACLs and security groups enable you to configure custom rules for the traffic in your VPC. 

![https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671127200/VrBWFpZulgzHsyHo-hAoHg/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/90uyZt9Op_XmDsxa_ha8um-1InZb0jryB.png](https://explore.skillbuilder.aws/files/a/w/aws_prod1_docebosaas_com/1671127200/VrBWFpZulgzHsyHo-hAoHg/tincan/48182b86c73ffe16940dfabe53710d740e5d80d2/assets/90uyZt9Op_XmDsxa_ha8um-1InZb0jryB.png)

## ****Compare security groups and network ACLs****

- *You can associate an instance with one or more security groups and that is probably because SG supports allow rule only. No conflict will be there between two or more security groups.*
- *You can associate a network ACL with multiple subnets. However, a subnet can be associated with only one network ACL at a time because Network ACL supports allow rules and deny rules. Thus increasing the chances of conflict between two or more Network ACLs.*
