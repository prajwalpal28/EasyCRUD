output "eks_cluster_name" {
value = module.eks.cluster_name
}


output "ecr_repo_url" {
value = aws_ecr_repository.backend.repository_url
}


output "frontend_bucket" {
value = aws_s3_bucket.frontend.bucket
}