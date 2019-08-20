
## Body
```
{
  "PartitionKey": "@{triggerBody()?['ContentData']}",
  "id": "@{triggerBody()?['ContentData']}",
  "Offset": "@triggerBody()?['SystemProperties']?['Offset']",
  "SeqNumber": "@triggerBody()?['SystemProperties']?['SequenceNumber']"
}
```

## Headers
```
Partitionkey: "\"@{triggerBody()?['ContentData']}\"" //Don't forget the quotes! 
```

## Event Hubs Connections
* Name: eventhubs
* Connection String: Endpoint=sb://bjdgeopair001.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=RVU3cAhsUGk3OI/FJKVDcQd1kZpZo7heErsgNkrY+2k=
* Hub Name: hub001