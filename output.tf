
output "DB_Connection_Name" {
  value       = module.db.db_instance_endpoint
  sensitive   = false
  description = "Database connection string"
}

