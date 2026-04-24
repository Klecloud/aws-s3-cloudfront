provider "aws" {
  region = var.aws_region
}

# ─────────────────────────────────────────
# S3 Bucket
# ─────────────────────────────────────────
module "s3" {
  source = "./modules/s3"

  project_name = var.project_name
}

# ─────────────────────────────────────────
# CloudFront Distribution
# ─────────────────────────────────────────
module "cloudfront" {
  source = "./modules/cloudfront"

  project_name        = var.project_name
  bucket_id           = module.s3.bucket_id
  bucket_domain_name  = module.s3.bucket_regional_domain_name
  bucket_arn          = module.s3.bucket_arn
}
