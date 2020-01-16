IMAGE_TAG := "registry.navercorp.com/wooseop/hello-world"
K8S_TAG = "hello-world"

.PHONY: run
run:
	go run cmd/main.go

.PHONY: deploy-image
deploy-image:
	ncc docker build -t ${IMAGE_TAG} .
	ncc docker push ${IMAGE_TAG}

.PHONY: delete-k8s
delete-k8s:
	kubectl delete deploy ${K8S_TAG} || true
	kubectl delete svc ${K8S_TAG} || true

.PHONY: apply-k8s
apply-k8s:
	kubectl apply -f Deployment.yaml
	kubectl apply -f Service.yaml

.PHONY: restart-k8s
restart-k8s: delete-k8s apply-k8s
