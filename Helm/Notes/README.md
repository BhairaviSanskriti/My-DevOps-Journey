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

# Helm commands

- `helm repo list` -> list repo 
- `helm repo add bitnami https://charts.bitnami.com/bitnami` -> add bitnami repo
- `helm repo list`
- `helm repo remove bitnami` -> remove bitnami repo
- `helm repo add bitnami https://charts.bitnami.com/bitnami`


### Search the repository for mysql package:
- `helm search repo mysql`
- `helm search repo database`
- `helm search repo database --versions`


### Install a mysql package named *mydb*:

- `helm install mydb bitnami/mysql` 
- **Check the cluster:**
  - `kubectl get pods`
- **Check the installation status:**
  - `helm status mydb`




### To uninstall a release
- `helm uninstall mysql-release`

### Update repo
- `helm repo update`

### To Upgrade:
- `helm upgrade <release-name> bitnami/mysql --set/--values values.yaml`
- You can also change the configuration at this stage
- If you don't pass the config fiel then it will use the default one and not the one that you passed during the installation.
- To reuse either provide the values again or use `--reuse-values`
 - Eg, `helm upgrade mysql-release bitnami/mysql --set auth.rootPassword=$ROOT_PASSWORD`

## Secret
- Gets created everytime you do installation or upgradation.
- This is nothing but a release record.
	  - contains entire info about the installation
- `helm uninstall <release-name> --keep-history` -> It will not delete the the release record (you'll need it in rollback)
- Helm uses which of the following kubernetes resources to store release information? : Secret
- Have template info and metadata about the info
- `helm get/ls` fetch info from secrets

### `helm template <release-name> bitnami/<chart-name>`
- Doesn't validate the template.
- Therefore, doesn't need access to a k8s cluster
- always generates templates unlike upgradation where only the difference is there.
- k8s functions or functions that fetch the data from the k8s cluster on the fly, those functions will be replaced with default values.
	
### release records
- `kubectl get secrets <secretName> -o yaml`

### `helm get notes <release-name>`
- to get release notes of this installation.

### `helm get values <release-name>`
- lists customized values not the default ones (for the current release). 
	- Eg, `helm get values tomcat`
- to get 
	- all the values used `--all`. 
		- Eg, `helm get values tomcat --all`
	- values of a particular revision use `--revision <revision-number>`. 
		- Eg, `helm get values tomcat revision`
### `helm get manifest <release-name>`
- to get manifest for the current release use `--revision <revision-number>` flag
	
### `helm history <release-name>`
- Shows the history of intallations and upgrades including the error info
- Eg, `helm history <release-name>` 
### `helm rollback <release-name> <revision-version>`
- If you keep the history even after unistallation then you can rollback to a particular version of your deployment on the cluster again!
- Eg, `helm rollback <release-name> <revision-version>` 
	
### Creating namespace (during installation)
- use `--create-namespace`
- `helm install <release-name> bitnami/<chart-name> -n <ns-name> --create-namespace`

### `helm upgrade --install <release-name> bitnami/<chart-name>`
- The way this command works, it will first check if the installation is already there.
- If it is there it will do the upgrade, otherwise it will do a install.
- This is very helpful in our CI CD pipeline as the code gets committed to git or any other repository and the CI CD pipeline gets kicked off for the very first time.
- Eg, 
	- Release "webs" does not exist. Installing it now.
	- Release "webs" has been upgraded. Happy Helming!
		
### `--generate-name` (installation)
- to let helm choose the release name of a chart. Eg, `helm install bitnami/apache --generate-name`
- To provide a template:
	- Eg, `--name-template "mywebserver-{{randAlpha 8 | lower}}"`
	
### `--wait --timeout 10m10s` (installation)
- the helm install command considers the installation to be successful as soon as the manifest is received by the kubernetes API server 
- It doesn't wait for the pods to be up and running.
- use `--wait --timeout`
- `--timeout`: to control the timeout period.
- Helm will wait for the services and deployments to be created, 
	   and also the pods should be up and running only then the installation is considered successful.
- Eg, `helm install <release-name> bitnami/<chart-name> --wait --timeout 10m10s`
	
### `--atomic` (installation)
- if the pods are not up and running in the given time out period, or 
	   if you use the default time out within the five minutes, then wait will mark the installation as a failure
- automatically roll back to a previous successful release.
- no need to use --wait; it will be automatically enabled.
- Eg, `helm install <release-name> bitnami/<chart-name> --atomic --timeout 10m10s`

### `--force` (during upgradation)
- to delete a deployment and create pods again.
- there will be some downtime.
	
### `--cleanup-on-failure` (during upgradation)
- If an upgrade fails, we want to clean up all the resources that were created.
	   This could be config maps or secrets.
- don't use it if you want to debug   
---

   
# Create Charts
#### How to create charts
`helm create <mychart>`
#### Structure of chart directory
A directory named *mychart* is created. It contains 2 files and 2 folders-
- **Chart.yaml** has the metadata about our chart, 
- **charts** folder is where the dependent charts will be copied.
- **templates** folder has all the templates that will be used to render the Kubernetes manifest later on.
- **values.yaml** are where all the default values for these templates are stored, and we can override those values during installation.

### Install the chart
- `helm install <release-name>  <chart-name>`
- Let's say you want to install the *mychart* with the release name *firstapp*:
	- `helm install firstapp mychart`
### Chart.yaml
- Additional elements that you can have in your *CHart.yaml* file:
	- **icon:** <image-url>
	- **keywords:** Explains what the project does; list
	  
	  - db project
	  
	  - healthcare
	- **home:** <project-url>
	- **sources:** It's a list of project sources; can also be url
	- **maintianers:** List of maintainers
	   - name: xyz
	   
	     email: xyz@gmail.com

---

### Template Deep Dive
#### Template Actions
- action elements are where we define the dynamic logic within which will be using various other Helm templating, syntactical elements and anything outside of these actions, as you can see, metadata, etc. will be rendered as it is in the output and that will be sent to Kubernetes.

<!-- #### Define variables -->


 
