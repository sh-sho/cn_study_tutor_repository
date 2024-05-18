import oci
import os
# Create a default config using DEFAULT profile in default location
# Refer to
# https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm#SDK_and_CLI_Configuration_File
# for more info
config = oci.config.from_file()

# Initialize service client with default config file
queue_client = oci.queue.QueueClient(config, service_endpoint=os.environ['E'])

# Send the request to service, some parameters are not required, see API
# doc for more info
delete_message_response = queue_client.delete_message(
    queue_id=os.environ['Q'],
    message_receipt="Aced2v-Tr9SAAK9NsxO-eT3YdmhHPRxriglHIiI-oWUbojzwWuU6Fv_lYodevEjsAyMtXsDtOpD2lrdsKdeOxjZYwicZiIZZpURMFYrEjwea59OHJaQjGbo9YIKJcbowMLYMv_ONpuZ4XpYmevmAaFRuXOMNWU_9KbWu9wx5uTNdoAzKZYgHTB3-NfVS25jh4IVjC7FCt_JXYcTl6z5-gCiF8vdMiBp6ZAcfV1bRDMjdd1v7dOwRCxfQYFqtjqQjNwbOrYywnumQoxk9FFC42jRZ1F-l--tDZbPrwSiKipFX4mV_74y5XNaGH2CMQpbB9QPSBWHEifhY5y9HtvW3tGWJSYRiLL_i6JWunQlyGe9qOw",
    opc_request_id="")

# Get the data from response
print(delete_message_response.headers)
