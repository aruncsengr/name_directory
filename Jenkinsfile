pipeline {
  agent any
  environment {
    GITHUB_API_TOKEN = credentials('repo:status:deployment')
    RUN_DISPLAY_URL = "${env.RUN_DISPLAY_URL}"
  }
  stages {
    stage('Security testing') {
      steps {
        echo 'hello'
      }
      post {
        success{
          sh '''
          curl -XPOST -H "Authorization: token $GITHUB_API_TOKEN" https://api.github.com/repos/aruncsengr/name_directory/statuses/$GIT_COMMIT -d '{"state": "success","target_url": "'"$RUN_DISPLAY_URL"'","description": "Good to go!","context": "Jiffle CI/Security"}'
          '''
        }
        failure{
          sh '''
          curl -XPOST -H "Authorization: token $GITHUB_API_TOKEN" https://api.github.com/repos/aruncsengr/name_directory/statuses/$GIT_COMMIT -d '{"state": "failure","target_url": "'"$RUN_DISPLAY_URL"'","description": "Something went wrong!","context": "Jiffle CI/Security"}'
          '''
        }
      }
    }
    stage('Unit testing') {
      steps {
        echo 'hello'
      }
      post{
        always{
          junit 'spec/reports/*.xml'
        }
        success{
          sh '''
          curl -XPOST -H "Authorization: token $GITHUB_API_TOKEN" https://api.github.com/repos/aruncsengr/name_directory/statuses/$GIT_COMMIT -d '{"state": "success","target_url": "'"$RUN_DISPLAY_URL"'","description": "Good to go!","context": "Jiffle CI/Unit testing"}'
          '''
        }
        failure{
          sh '''
          curl -XPOST -H "Authorization: token $GITHUB_API_TOKEN" https://api.github.com/repos/aruncsengr/name_directory/statuses/$GIT_COMMIT -d '{"state": "failure","target_url": "'"$RUN_DISPLAY_URL"'","description": "Something went wrong!","context": "Jiffle CI/Unit testing"}'
          '''
        }
      }
    }
  }
}
