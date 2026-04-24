## 🌐 Live Site
[My Portfolio](https://d37qyga18zwtr2.cloudfront.net/)

# AWS S3 + CloudFront — Static Portfolio Site

This project provisions a static website hosted on Amazon S3 and distributed globally via AWS CloudFront, using Terraform modules and security best practices.

## Architecture

```
User → CloudFront (CDN) → S3 Bucket (private)
         ↓
   HTTPS enforced
   Global edge locations
   OAC (Origin Access Control)
```

## Resources Created

| Resource | Description |
|---|---|
| `aws_s3_bucket` | Private bucket — no public access |
| `aws_s3_bucket_public_access_block` | Blocks all direct public access |
| `aws_cloudfront_origin_access_control` | Secure access from CloudFront to S3 |
| `aws_cloudfront_distribution` | Global CDN with HTTPS redirect |
| `aws_s3_bucket_policy` | Allows only CloudFront to read S3 |

## Prerequisites

- Terraform >= 1.5.0
- AWS CLI configured (`aws configure`)
- AWS account (free tier eligible)

## Usage

### 1. Clone the repository

```bash
git clone https://github.com/Klecloud/aws-s3-cloudfront.git
cd aws-s3-cloudfront
```

### 2. Deploy infrastructure

```bash
terraform init
terraform plan
terraform apply
```

> CloudFront deployment takes 5–10 minutes to propagate globally.

### 3. Upload the site

```bash
aws s3 sync ./site s3://$(terraform output -raw bucket_name)
```

### 4. Access your site

```bash
terraform output cloudfront_url
```

Open the URL in your browser.

### 5. Update the site (after changes)

```bash
aws s3 sync ./site s3://$(terraform output -raw bucket_name)

aws cloudfront create-invalidation \
  --distribution-id $(terraform output -raw cloudfront_distribution_id) \
  --paths "/*"
```

### 6. Destroy

```bash
terraform destroy
```

## Project Structure

```
aws-s3-cloudfront/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── .gitignore
├── site/
│   └── index.html
└── modules/
    ├── s3/
    │   ├── main.tf
    │   ├── variables.tf
    │   ├── outputs.tf
    │   └── versions.tf
    └── cloudfront/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Key Concepts Demonstrated

- **Private S3 bucket** — no direct public access
- **Origin Access Control (OAC)** — modern secure S3-CloudFront integration
- **HTTPS enforced** — HTTP redirects to HTTPS automatically
- **Global CDN** — content served from edge locations worldwide
- **Cache invalidation** — workflow to update content after changes
- **Free tier** — S3 + CloudFront within free tier limits

## Author

Kleber D'Oliveira Filho — [LinkedIn](https://www.linkedin.com/in/kleber-d%E2%80%99oliveira-filho-989608232/) | [GitHub](https://github.com/Klecloud)
