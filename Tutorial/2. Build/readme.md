# Terraform Tutorial

## 사전 준비
- Terraform CLI 설치 (1. Install 참고)
- AWS CLI 설치
```zsh
$ curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
$ sudo installer -pkg AWSCLIV2.pkg -target /
```
- AWS 계정 생성 + IAM 사용자 생성
- 환경 변수 설정 (IAM 사용자의 액세스 키 ID 및 비밀 액세스 키)
```zsh
$ export AWS_ACCESS_KEY_ID=...
$ export AWS_SECRET_ACCESS_KEY=...
```

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

## 분석

### Terraform Block
- `terraform {...}` : Terraform 설정 블록
  - `required_providers {...}` : 사용할 공급자 목록
    - `aws {...}` : AWS 공급자
      - `source` : 공급자 소스
      - `version` : 사용할 버전
  - `required_version` : 사용할 Terraform 버전

### Providers
- `provider "aws" {...}` : AWS 공급자 설정
  - `region` : AWS 리전

### Resources
- `resource "aws_instance" {...}` : AWS EC2 인스턴스 리소스
  - `ami` : 인스턴스에 사용할 AMI ID
  - `instance_type` : 인스턴스 유형
  - `tags` : 인스턴스 태그

## 실행
```zsh
$ terraform init
$ terraform apply
```

## Inspect State
- Apply 후 생성된 리소스 확인 : `terraform.tfstate` 파일
```zsh
$ terraform show
```

