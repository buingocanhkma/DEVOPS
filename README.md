# DEVOPS
K8s: 
============================ LAB 1 ===============================

1. Install 
sudo curl --location -o /usr/local/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl

2.  Enter the following command to make kubectl an executable file:

sudo chmod +x /usr/local/bin/kubectl

3. Enter the following command to display the version of the kubectl utility and verify it is installed properly:
kubectl version --short --client
The output should look similar to this:
Client Version: v1.21.2-13+d2965f0db10712

4. Enter the following command to download and unzip eksctl:
curl --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp


5. Enter the following command to move eksctl to the /usr/local/bin directory:

sudo mv -v /tmp/eksctl /usr/local/bin

6. Check 
eksctl version

7. Enter the following command to save the current region to a shell variable and display it on screen:
export AWS_REGION=$(curl --silent http://169.254.169.254/latest/meta-data/placement/region) && echo $AWS_REGION

8. Enter the following command to deploy an Amazon EKS cluster with a managed node group of three nodes:
eksctl create cluster \
--name dev-cluster \
--nodegroup-name dev-nodes \
--node-type t3.small \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--managed \
--version 1.21 \
--region ${AWS_REGION}

9. Enter the following command save the name of the first pod to an environment variable which you will use in subsequent commands:
export MY_POD_NAME=$(kubectl get pods -n default -o jsonpath='{.items[0].metadata.name}')

10.  Enter the following command to view the details of the pod:
kubectl -n default describe pod $MY_POD_NAME

11. Enter the following command to connect to a bash shell inside the pod:

kubectl exec -it ${MY_POD_NAME} -n default -- /bin/bash


12. scale out:
kubectl scale deployment ecsdemo-nodejs --replicas=3

kubectl scale deployment ecsdemo-crystal --replicas=3

13. check:
kubectl get deployments

14. scale in:
kubectl scale deployment ecsdemo-nodejs --replicas=2

kubectl scale deployment ecsdemo-crystal --replicas=2

kubectl scale deployment ecsdemo-frontend --replicas=2

15. check 


============================================ LAB 2 ===================================
1. create repository

2. create ssh key:
ssh-keygen -t rsa
3. Enter the following command to upload the public key and attach it to the user
aws iam upload-ssh-public-key \
--user-name gitUser \
--ssh-public-key-body file://~/.ssh/id_rsa.pub

4. Now that your key pair has been connected and the public key has been uploaded, enter the following command to create an SSH config file that associates the public and private keys:
cat <<EOF > ~/.ssh/config
Host git-codecommit.*.amazonaws.com
  User ${KEYID}
  IdentityFile ~/.ssh/id_rsa
EOF
chmod 700 ~/.ssh/config

5. Enter the following command to confirm that you are able to authenticate into AWS CodeCommit. When asked if you would like to connect to git-codecommit.us-west-2.amazonaws.com port 22:, type yes and press Enter:
ssh git-codecommit.us-west-2.amazonaws.com

6. Enter the following commands to update the Git configuration:
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git config --global init.defaultBranch main

7. Enter the following command to clone your eks-example CodeCommit repository to your home directory:
cd ~ && git clone ssh://$KEYID@git-codecommit.us-west-2.amazonaws.com/v1/repos/eks-example
