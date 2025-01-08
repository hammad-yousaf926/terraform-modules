variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket."
}

variable "acl" {
  type        = string
  description = "The canned ACL to apply. Defaults to 'private'."
  default     = "private"
}

variable "versioning" {
  type        = bool
  description = "A boolean that indicates if versioning should be enabled."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the bucket."
  default     = {}
}
