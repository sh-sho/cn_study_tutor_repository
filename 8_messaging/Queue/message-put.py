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
put_messages_response = queue_client.put_messages(
    queue_id=os.environ['Q'],
    put_messages_details=oci.queue.models.PutMessagesDetails(
        messages=[
            oci.queue.models.PutMessagesDetailsEntry(
                content="content-Value",
                metadata=oci.queue.models.MessageMetadata(
                    channel_id="channel09",
                    custom_properties={"string1": "HELLO"}
                    )
                )
            ]
        ),
    opc_request_id="")

# Get the data from response
print(put_messages_response.data)
