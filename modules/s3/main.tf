resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "portfolio" {
  bucket        = "${var.project_name}-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name    = "${var.project_name}-bucket"
    Project = var.project_name
  }
}

resource "aws_s3_bucket_public_access_block" "portfolio" {
  bucket                  = aws_s3_bucket.portfolio.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_website_configuration" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id
  index_document { suffix = "index.html" }
  error_document { key    = "index.html" }
}
