# Security Group 

resource "aws_security_group" "webserver-sg" {
  name        = "webserver-sg"
  description = "Allow http"
  vpc_id      = module.vpc.vpc_id


  # INBOUND RULES (Ingress)
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]  # Public access
    security_groups = [aws_security_group.webserver-sg2.id] # Reference the other security group
  }




  # OUTBOUND RULES (Egress) #don't need to specify if you want to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}




# Security Group 

resource "aws_security_group" "webserver-sg2" {
  name        = "alb-webserver-sg"
  description = "Allow http and https"
  vpc_id      = module.vpc.vpc_id

  # INBOUND RULES (Ingress)
  ingress {
    description = "SSH from specefic ip"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict to your IP (replace this)
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Public access
  }

  # OUTBOUND RULES (Egress) #don't need to specify if you want to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webserver-sg"
  }
}
