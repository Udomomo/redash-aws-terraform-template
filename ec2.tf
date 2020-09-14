data "aws_ami" "redash" {
  most_recent     = true
  exectable_users = ["self"]

  filter {
    name   = "image-id"
    values = local.ami_id
  }

  owners = ["465267886299"]
}

resource "aws_instance" "redash-ec2" {
  ami           = data.aws_ami.redash.id
  instance_type = "t2.small"

  tags = {
    name = "redash"
    env  = "dev"
  }
}
