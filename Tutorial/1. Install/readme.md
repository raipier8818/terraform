# Terraform Tutorial

## 설치
```zsh
$ brew tap hashicorp/tap
$ brew install hashicorp/tap/terraform
```

## 설치 확인
```zsh
$ terraform -version
$ terraform -help
```

## Auto Completion
```zsh
$ touch ~/.zshrc
$ terraform -install-autocomplete
```

## Docker 예제
```terraform
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8000
  }
}
```

## 초기화
```zsh
$ terraform init
```

## 실행
```zsh
$ terraform apply
```

## 삭제
```zsh
$ terraform destroy
```
