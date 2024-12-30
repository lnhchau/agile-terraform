# Ensuring Quality Releases

In this project, you'll develop and demonstrate your skills in using a variety of industry leading tools, especially Microsoft Azure, to create disposable test environments and run a variety of automated tests with the click of a button. Additionally, you'll monitor and provide insight into your application's behavior, and determine root causes by querying the application’s custom log files.

---

### 1. Create Azure DevOps CI/CD Pipeline

The pipeline includes tasks to execute Terraform scripts and create the following resources:

| **Azure Resources**                                    | **Status** |
| ------------------------------------------------------------ | ---------------- |
| AppService                                                   | ✅               |
| Network                                                      | ✅               |
| Network Security Group                                       | ✅               |
| Public IP                                                    | ✅               |
| Resource Group                                               | ✅               |
| Linux VM*(created using Packer - Standard_B1s for low cost)* | ✅               |

### Execute Test Suites

| **Type** | **Technology** | **Stage in CI/CD Pipeline**        | **Status** |
| -------------- | -------------------- | ---------------------------------------- | ---------------- |
| Integration    | Postman              | Test Stage - runs on Microsoft-hosted VM | ✅               |
| Functional     | Selenium             | Test Stage - runs on custom Linux VM     | ✅               |
| Performance    | JMeter               | Test Stage - runs against the AppService | ✅               |

---

### 2. Azure Monitor

| **Goal**                                                                     | **Status** |
| ---------------------------------------------------------------------------------- | ---------------- |
| Configure an Action Group (email)                                                  | ✅               |
| Configure an alert to trigger based on a condition from the AppService             | ✅               |
| Ensure the alert triggers close to the time the Performance Test executes          | ✅               |
| Direct Selenium Test Suite output to a log file and execute the suite              | ✅               |
| Configure custom logging in Azure Monitor to ingest the Selenium logs*(non-CI/CD)* | ✅               |

---

## Test Suites Execution Details

### 1. Postman

* Create a **Regression Test Suite** using the Starter APIs.
* Use the `Publish Test Results` task to publish test results to Azure Pipelines.
* Create a **Data Validation Test Suite** using the Starter APIs.

### 2. Selenium

* Develop a **UI Test Suite** that:
  * Adds all products to a cart.
  * Removes all products from the cart.
* Include `print()` commands for clear test action logs.
* Deploy the UI Test Suite to the Linux VM and execute it via the CI/CD pipeline.

### 3. JMeter

* Create two Test Suites using the Starter APIs:
  * **Stress Test Suite**
  * **Endurance Test Suite**
* Use variables to reference a dataset (CSV file) for dynamic test data.
* Generate an HTML report  *(non-CI/CD)* .

**Important:**

Since the AppService is on the Basic/Free plan:

* Start with a small load (2 users max).
* For final submission, use up to **30 users** for a maximum duration of  **60 seconds** .

  (Note: The "Data Out" quota for this AppService plan is only 165 MiB.)

---

## Deploy Cloud Infrastructure with Terraform from local PC

### Step 1: Configure Authentication via Service Principal and Client Secret

Follow the [Azure CLI guide](https://learn.microsoft.com/en-us/cli/azure/ad/sp?view=azure-cli-latest) to set up a Service Principal, enabling Terraform to manage resources in your subscription.

Run the command:

```
az ad sp create-for-rbac
```

The command will output the following:

```
{
  "appId": "00000000-0000-0000-0000-000000000000",
  "displayName": "azure-cli-2017-06-05-10-41-15",
  "name": "http://azure-cli-2017-06-05-10-41-15",
  "password": "0000-0000-0000-0000-000000000000",
  "tenant": "00000000-0000-0000-0000-000000000000"
}
```

### Step 2: Export Environment Variables

Export the following variables to allow Terraform to authenticate:

```
export ARM_CLIENT_ID=<appId value>
export ARM_CLIENT_SECRET=<password value>
export ARM_TENANT_ID=<tenant value>
```

### Step 3: Deploy Resources with Terraform

Navigate to the Terraform environment directory, initialize Terraform, and execute the deployment:

```
cd terraform/environment/test
terraform init
terraform plan -out solution.plan
terraform apply "solution.plan"
```

---

This refactored README.md ensures clarity and ease of reading while maintaining logical structure and details.
