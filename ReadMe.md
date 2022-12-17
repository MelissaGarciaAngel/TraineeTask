## Trainee task definition

Goal: The main goal of this task is to ensure the candidate can learn a new technology fast.
<br  />
Duration: 2 weeks
<br  />
Description: The task consists of two separate scenarios. In the First scenario you should create infrastructure described below (Pic.1) in the AWS public cloud. You should use terraform with version at least 0.12.31. Also, you should describe required resources which necessary for creating this architecture such as VPC, Subnet and etc. in AWS. Environment
<br  />
settings:
<br  />

 - OS: Windows Server 2019 or Linux
 - Traffic should be routed between two instances.
 - In AWS(use Network LoadBalancer)

![Picture 1 – Infrastructure diagram in AWS](https://github.com/MelissaGarciaAngel/traineeTask/blob/main/util/img1.png?raw=true) <br  />
Picture 1 – Infrastructure diagram in AWS

The Second scenario you should create Bash (PowerShell) scripts that can deploy web server (IIS, NGINX, Apache and etc.) with hello world website to VMs created in the previous scenario. Each script run should clean up and redeploy all artifacts and components.

  

## Prerequisites

Install `terraform` 👌

<br  />

Create a profile named `trainee_challenge` using AWS CLI, the user should be an IAM user with permissions to create.

  
  

## Usage

Ensure that the profile named `trainee_challenge` is correctly created in your machine, the used region is `us-east-1`. Optionally you can change the name of the `profile` variable in the `variables.tf` file to match your personal variable.

  

<br  />Next, run `terraform init`

<br  />Then run `terraform plan`

<br  />And finally run `terraform apply`
