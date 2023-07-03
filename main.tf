resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_instance" "oldtechgeek-ec2" {
  ami           = "ami-02d8bad0a1da4b6fd"
  instance_type = var.instance_type
  key_name      = "Tiago AWS" # Adicionado aqui

  tags = {
    Name = "oldtechgeek"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y 
              sudo yum install -y amazon-linux-extras
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              EOF
}

resource "aws_eip" "oldtechgeek-eip" {
  instance = aws_instance.oldtechgeek-ec2.id
}

resource "aws_route53_record" "oldtechgeek" {
  zone_id = var.route53_zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = "300"
  records = [aws_eip.oldtechgeek-eip.public_ip]
}
