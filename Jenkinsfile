pipeline {
    agent {
      node {
          label 'ecs-slave'
      }
    }
    stages {
        stage('Start ECS') {
            steps {
                echo "Starting the ECS service"
                sh '''
                    ecs-cli compose \
                    --project-name tibco-ems service \
                    up \
                    --create-log-groups \
                    --cluster cib-cross-service-fargate \
                    --launch-type FARGATE \
                    --region eu-west-2 \
                    --aws-profile default
                '''
                echo "The ECS service was started"
            }
        }
        stage('Stop ECS') {
            steps {
                echo "Stoping the ECS service"
                sh '''
                    ecs-cli compose \
                    --project-name tibco-ems service \
                    down \
                    --cluster cib-cross-service-fargate \
                    --region eu-west-2 \
                    --aws-profile default
                '''
                echo "The ECS service was stopped"
            }
        } 
        stage('Zip testing results') {
            steps { 
                script {
                    sh 'aws s3 cp s3://cib-sigom-test-results/jenkins-build-1 ${BUILD_TAG} --recursive'
                    zip zipFile: "${BUILD_TAG}-test-results.zip", archive: true, dir: "${BUILD_TAG}"
                }
            }
        }
    }
}
