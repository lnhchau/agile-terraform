resource "azurerm_service_plan" "test" {
  name                = "${var.application_type}-${var.resource_type}-plan"
  location            = "eastus"
  resource_group_name = var.resource_group
  os_type             = "Windows"
  sku_name            = "F1"
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