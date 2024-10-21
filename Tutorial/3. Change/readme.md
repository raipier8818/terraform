# Terraform Tutorial

## 사전 준비
- Terraform CLI 설치 (1. Install 참고)
- AWS CLI 설치 (2. Build 참고)
- AWS 계정 생성 (2. Build 참고)
- 환경 변수 설정 (IAM 사용자의 액세스 키 ID 및 비밀 액세스 키) (2. Build 참고)


## AWS EC2 인스턴스 생성 예제
```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-02c329a4b4aba6a48"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
```

## 실행
```zsh
$ terraform init
$ terraform apply
```

## AMI 변경
```terraform
resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
```

## 실행
```zsh
$ terraform apply
```