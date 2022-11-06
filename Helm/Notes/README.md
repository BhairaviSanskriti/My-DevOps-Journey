# About
  I am documenting my Helm journey through brief notes.

# Resources
  These are the resources that I am following to learn Helm:
  
   1. [What is Helm?](https://www.youtube.com/watch?v=fy8SHvNZGeE) - IBM Technology
   2. [Helm Kubernetes Packaging Manager for Developers and DevOps](https://www.udemy.com/course/helm-kubernetes-packaging-manager-for-developers-and-devops/) - Bharath Thippireddy

# Intro

## Before Helm
1. **Static Files**    
    -  Manifests can't receive the parameter dynamically. 
    
2. **Consistency**
    - Inconsistency can occur between the cluster state and manifest files in case a developer makes changes to the cluster directly and doesn't update the yaml files accordingly.
3. **Revision History**  
    - It's hard to go back to a particular version unless you maintain a backup of that particular working k8s cluster.
        
  
## After Helm
1. **Dynamic Configuration**
    - Placeholder for parameters in the template files
    - `values.yaml` file is used to pass these parameters to the template files.
    - Template files + `value.yaml` file -> Final YAML file sent to the k8s cluster for deployment.
 
2. **Consistency**
    - Whatever we have locally in the chart is always consistent with what is deployed in the k8s cluster. 
3. **Revision History**
    - Helm maintains a revision history as we do installations and upgrades.
    - It will store all the templates and configuration information used for that installation or upgrade to a particular location.
    - It's easier to revert to a particular revision.
4. **Simple** 
    - No need to create resources to deploy an application
    - A simple command will pull the required chart containing all the required template files with a default set of values. Another command will do the installation.
5. **Intelligent Deployments**
    - Helm knows the order in which Kubernetes resources should be created, and it will automatically do it for us.
6. **Security**
      - in-built support to ensure that the charts that are downloaded from the central repositories are secured. 

# Chart
> A chart is a collection of files that describe a related set of Kubernetes resources. 

# Repository
> A chart repository is a location where packaged charts can be stored and shared. 

-  Helm uses the same config file, which `kubectl` command uses. Helm will get cluster info from this file.
-  You can use another config file by setting the `KUBECONFIG` variable which will point to the config file.

<!-- # Advanced Commands
## Helm release workflow
## Helm `--dry-run`
  - `--dry-run` can be used for both installation & upgradation.
## Helm template  (DIFF BTW DRY RUN AND TEMPLATE)
  1. template command to see only template and not the release info.
  2. Helm doesn't need an active k8s cluster to validate the, works even if you don;t have access stp a kubernetes cluster
  3. helm will use tjhe default vaues in case it requres to fetch info or data from the k8s cluster.
  4. always generetaes teomplates likes installaiton. -->
 
