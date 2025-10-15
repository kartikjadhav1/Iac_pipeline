terraform {
    backend "s3" {
      bucket = "iac-pipeline-backend"
      key = "remote-backend.tfstate"
      region = "us-east-1"
      dynamodb_table = "iac-pipeline-locker"
    }
}
