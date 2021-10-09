Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

You can now join any number of control-plane nodes by copying certificate authorities
and service account keys on each node and then running the following as root:

  kubeadm join cluster-endpoint:6443 --token gphqpl.x4t40tkyaznt49xa \
    --discovery-token-ca-cert-hash sha256:97acc5bed6dc47ee495632ab29ef7d867c42a4ceb844d70a8fdd9322afe93f28 \
    --control-plane 

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join cluster-endpoint:6443 --token gphqpl.x4t40tkyaznt49xa \
    --discovery-token-ca-cert-hash sha256:97acc5bed6dc47ee495632ab29ef7d867c42a4ceb844d70a8fdd9322afe93f28 