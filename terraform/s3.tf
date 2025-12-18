resource "aws_s3_bucket" "frontend" {
bucket = "${var.project_name}-frontend-${random_id.suffix.hex}"
}


resource "random_id" "suffix" {
byte_length = 4
}


resource "aws_s3_bucket_website_configuration" "frontend" {
bucket = aws_s3_bucket.frontend.id


index_document {
suffix = "index.html"
}


error_document {
key = "index.html"
}
}


resource "aws_s3_bucket_public_access_block" "public" {
bucket = aws_s3_bucket.frontend.id


block_public_acls = false
block_public_policy = false
ignore_public_acls = false
restrict_public_buckets = false
}