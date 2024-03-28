variable "controller_image" {
  type        = string
  description = "Autoneg controller container image"
  default     = "ghcr.io/googlecloudplatform/gke-autoneg-controller/gke-autoneg-controller:v1.0.0"
}

variable "controller_resources" {
  type = object({
    limits = optional(object({
      cpu               = optional(string)
      ephemeral-storage = optional(string)
      memory            = optional(string)
    }))
    requests = optional(object({
      cpu               = optional(string)
      ephemeral-storage = optional(string)
      memory            = optional(string)
    }))
  })

  description = "Autoneg controller resource settings"
  default     = null
}

variable "controller_security_capabilities" {
  type = object({
    add  = optional(list(string))
    drop = optional(list(string))
  })
  description = "Autoneg controller security capabilities"
  default     = null
}

variable "custom_role_add_random_suffix" {
  type        = bool
  description = "Sets random suffix at the end of the IAM custom role id"
  default     = false
}

variable "extra_args" {
  type        = list(string)
  default     = []
  description = "Arguments added to the autoneg controller start"
}

variable "image_pull_policy" {
  type        = string
  description = "Image pull policy for Autoneg container"
  default     = "IfNotPresent"
}

variable "kube_rbac_proxy_image" {
  type        = string
  description = "kuber-rbac-proxy container image"
  default     = "gcr.io/kubebuilder/kube-rbac-proxy:v0.8.0"
}

variable "priority_class_name" {
  description = "Pod's PriorityClass name"
  type        = string
  default     = null
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "proxy_resources" {
  type = object({
    limits = optional(object({
      cpu               = optional(string)
      ephemeral-storage = optional(string)
      memory            = optional(string)
    }))
    requests = optional(object({
      cpu               = optional(string)
      ephemeral-storage = optional(string)
      memory            = optional(string)
    }))
  })

  description = "Autoneg proxy resource settings"
  default     = null
}

variable "proxy_security_capabilities" {
  type = object({
    add  = optional(list(string))
    drop = optional(list(string))
  })
  description = "Autoneg proxy security capabilities"
  default     = null
}

variable "seccom_profile" {
  type = object({
    type              = string
    localhost_profile = optional(string)
  })
  description = "Autoneg deployment seccom profile settings"
  default     = null
}

variable "service_account_id" {
  description = "Service account id to be created"
  default     = "autoneg"
  type        = string
}

variable "toleration" {
  type = object({
    effect   = optional(string)
    key      = optional(string)
    operator = optional(string)
    value    = optional(string)
  })
  description = "Autoneg deployment toleration settings"
  default     = null
}

variable "workload_identity" {
  description = "Workload identity configuration"
  type = object({
    namespace       = string
    service_account = string
  })
  default = {
    namespace       = "autoneg-system"
    service_account = "autoneg"
  }
}
