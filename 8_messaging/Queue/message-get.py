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
get_messages_response = queue_client.get_messages(
    queue_id=os.environ['Q'],
    visibility_in_seconds=10,
    timeout_in_seconds=10,
    limit=2,
    opc_request_id="",
    channel_filter="channel09")

# Get the data from response
print(get_messages_response.data)
