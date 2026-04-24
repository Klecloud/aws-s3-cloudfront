output "cloudfront_url" {
  description = "URL to access your portfolio"
  value       = "https://${module.cloudfront.cloudfront_domain}"
}

output "bucket_name" {
  description = "S3 bucket name"
  value       = module.s3.bucket_id
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID (needed to invalidate cache)"
  value       = module.cloudfront.cloudfront_id
}
