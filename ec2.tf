resource "aws_instance" "server1" {
  instance_type          = "t2.micro"
  user_data              = file("setup.sh")
  ami                    = "ami-0de716d6197524dd9"
  subnet_id              = module.vpc.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]

  tags = {
    Name = "webserver1"
    env  = "dev"
  }
}

resource "aws_instance" "server2" {
  instance_type          = "t2.micro"
  user_data              = file("setup.sh")
  ami                    = "ami-0de716d6197524dd9"
  subnet_id              = module.vpc.private_subnets[1]
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]

  tags = {
    Name = "webserver2"
    env  = "dev"
  }
}