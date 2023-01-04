#Provides a Target Group resource to use with Load Balancer resources
resource "aws_lb_target_group" "LoadBalancer" {
  name     = "application-LoadBalancer"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.VPC1.id
  
  health_check {
    protocol = "TCP"
  }
}

# Attaching first VM
resource "aws_lb_target_group_attachment" "VM1_AZ1" {
  target_group_arn = aws_lb_target_group.LoadBalancer.arn
  target_id        = aws_instance.VM1_AZ1.id
  port             = 80
}

# Attaching second VM
resource "aws_lb_target_group_attachment" "VM2_AZ2" {
  target_group_arn = aws_lb_target_group.LoadBalancer.arn
  target_id        = aws_instance.VM2_AZ2.id
  port             = 80
}

# Provides a Load Balancer Listener resource
resource "aws_lb_listener" "LoadBalancer_end" {
  load_balancer_arn = aws_lb.LoadBalancer.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.LoadBalancer.arn
  }
}

# Provides a Load Balancer resource
resource "aws_lb" "LoadBalancer" {
  name               = "LoadBalancer"
  internal           = false
  load_balancer_type = "network"
  #security_groups    = [aws_security_group.http-sg.id]
  subnets            = [aws_subnet.SUBNET_AZ1.id, aws_subnet.SUBNET_AZ2.id]

  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true

  tags = {
    Environment = "LoadBalancer"
  }
}