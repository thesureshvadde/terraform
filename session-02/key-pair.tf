resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/suresh.pub")
  # public_key = local.public_key
}