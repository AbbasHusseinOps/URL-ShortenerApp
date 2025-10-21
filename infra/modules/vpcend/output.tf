output "ecr_api_endpoint_ids" {
  value = aws_vpc_endpoint.ecr_api.id 
}
output "ecr_dkr_endpoint_ids" {
  value = aws_vpc_endpoint.ecr_dkr.id
}
output "s3_endpoint_ids" {
 value = aws_vpc_endpoint.s3.id
}
output "dynamodb_enpoint_ids" {
  value = aws_vpc_endpoint.dynamodb.id
}
output "logs_endpoint_id" {
  value = aws_vpc_endpoint.logs.id
  
}