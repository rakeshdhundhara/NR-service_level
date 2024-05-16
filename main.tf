
resource "newrelic_service_level" "service_level01" {
  guid        = var.service_level_config.guid
  name        = var.service_level_config.name
  description = var.service_level_config.description

  events {
    account_id = var.service_level_config.account_id
    valid_events {
      from = "SystemSample"
      select {
        function = "COUNT"
      }
    }
    good_events {
      from = "StorageSample"
      select {
        function = "COUNT"
      }
    }
  }

  objective {
    target = var.service_level_config.target
    time_window {
      rolling {
        count = var.service_level_config.time_window_count
        unit  = var.service_level_config.time_window_unit
      }
    }
  }
}
