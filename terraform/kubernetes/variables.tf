variable "controller_image" {
  type        = string
  description = "Autoneg controller container image"
}

variable "extra_args" {
  type        = list(string)
  default     = []
  description = "Arguments added to the autoneg controller start"
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
  default = {
    limits = {
      cpu    = "100m"
      memory = "30Mi"
    },
    requests = {
      cpu    = "100m"
      memory = "20Mi"
    }
  }
}

variable "controller_security_capabilities" {
  type = object({
    add  = optional(list(string))
    drop = optional(list(string))
  })
  description = "Autoneg controller security capabilities"
  default = {
    add  = []
    drop = ["NET_RAW"]
  }
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

variable "namespace" {
  type        = string
  description = "Autoneg namespace"
  default     = "autoneg-system"
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
  default = {
    limits = {
      cpu    = "100m"
      memory = "30Mi"
    },
    requests = {
      cpu    = "100m"
      memory = "20Mi"
    }
  }
}

variable "proxy_security_capabilities" {
  type = object({
    add  = optional(list(string))
    drop = optional(list(string))
  })
  description = "Autoneg proxy security capabilities"
  default = {
    add  = []
    drop = ["NET_RAW"]
  }
}

variable "seccom_profile" {
  type = object({
    type              = string
    localhost_profile = optional(string)
  })
  description = "Autoneg deployment seccom profile settings"
  default = {
    type = "RuntimeDefault"
  }
}

variable "service_account_email" {
  type        = string
  description = "Autoneg service account email"
}

variable "service_account_id" {
  type        = string
  description = "Autoneg service account"
  default     = "autoneg"
}

variable "toleration" {
  type = object({
    effect   = optional(string)
    key      = optional(string)
    operator = optional(string)
    value    = optional(string)
  })
  description = "Autoneg deployment toleration settings"
  default = {
    effect   = "NoSchedule"
    key      = "kubernetes.io/arch"
    operator = "Equal"
    value    = "amd64"
  }
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
