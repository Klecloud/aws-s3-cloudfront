output "cloudfront_domain" {
  value = aws_cloudfront_distribution.portfolio.domain_name
}
output "cloudfront_id" {
  value = aws_cloudfront_distribution.portfolio.id
}
