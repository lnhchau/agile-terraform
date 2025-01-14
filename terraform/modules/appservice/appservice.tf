resource "azurerm_service_plan" "test" {
  name                = "myapp-AppService-plan"
  location            = "eastus" # Change to a region with quota
  resource_group_name = "Azuredevops"
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_windows_web_app" "test" {
  name                = "${var.application_type}-${var.resource_type}-chaulnh-prj3"
  location            = var.location
  resource_group_name = var.resource_group
  service_plan_id     = azurerm_service_plan.test.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = 0
  }
  site_config {
    always_on = false
    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v4.0"
    }
  }
}