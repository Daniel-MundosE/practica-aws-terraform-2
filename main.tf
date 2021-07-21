provider "aws" {
  version = "~> 2.7"
  region  = "us-east-1"
}

resource "aws_instance" "web" {  
  count = 2
  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"

  tags = {
    Name = "MundosE-2103-${count.index}"
  }

}

output "public_ip" {
  value = "${aws_instance.web.*.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.web.*.private_ip}"
}
