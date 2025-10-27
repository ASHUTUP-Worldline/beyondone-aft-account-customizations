resource "aws_config_config_rule" "r" {
  name = "vpc_flow_log_guardrail"
  source {
    owner             = "AWS"
    source_identifier = "VPC_FLOW_LOGS_ENABLED"
  }
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "account_level_prod_bucket" {
  bucket = "account-prod-bucket-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name        = "Account prod bucket"
  }
}