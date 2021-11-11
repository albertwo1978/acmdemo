# Change to demo folder
cd ./acmdemo

# Connect to clusters
gcloud container clusters get-credentials cluster-east --zone us-east1
gcloud container clusters get-credentials cluster-west --zone us-west1

# Set kubectx cluster short name
kubectl ctx cluster-east=gke_alw-acm-proj-01_us-east1_cluster-east
kubectl ctx cluster-west=gke_alw-acm-proj-01_us-west1_cluster-west

# Show services deployed to cluster
kubectl get pods -n config-management-system

# Show config managment logs (pre1.9 config-management deployed to kube-system)
kubectl logs -n kube-system -l k8s-app=config-management-operator

kubectl logs -l app=reconciler-manager --namespace config-management-system -c reconciler-manager

kubectl logs -n gatekeeper-system gatekeeper-controller-manager-6dc946bf9b-sqzmn