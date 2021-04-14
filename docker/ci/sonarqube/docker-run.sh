docker run -d --name xrksudy.sonarqube \
  -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
  -p 9080:9000 \
  -v sonarqube_data:/data/devops-data/sonarqube/data \
  -v sonarqube_extensions:/data/devops-data/sonarqube/extensions \
  -v sonarqube_logs:/data/devops-data/sonarqube/logs \
  sonarqube:8-community