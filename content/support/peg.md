---
title: "Peg! A place to hang your (web)hooks."
---

### Design

* AWS API Gateway listens to all requests towards https://api.agilesyndro.me/{tenant}/{service}/{queue}
* When a request is reeived it is immediately saved in a raw form, into s3://bucket/tenant/service/queue/request_id.json
* Once the save is complete, an Amazon Simple Queue service gets a notification with the location of the S3 object.
* Finally, the API Gateway redirects to https://api.agilesyndro.me/handler/{service}/{tenant}/{queue}/{request_id}
* Various service_handlers can now process the request and return data.  See services below.

### Future Work
* The requestId will be logged into DynamoDB
* The appropiate `service_handler` will be called.

### What services are currently supported?

* GitHub WebHooks (Record all data about commits / PRs / etc )
* Twilio (Inbound Voice Call Forwarding)
* Twilio (Inbound SMS)
* Website Analytics ( jQuery.post )
* iPhone Siri Shortcuts

### Why?

* Jenkins currently needs to be exposed to the public internet to allow Github Webhooks to function properly.  THis shouldn't be necessary.  API Gateway can queue up the request and later "re-play" it to a private Jenkins server based on the SQS information.  By saving the record into S3, we can reply it even if the Jenkins server is offline at the time the request comes in.

* Replayable Webhooks for testing

* Replay and Redirect previously sent webhooks at a later date

* GeoFencing - iPhone Shortcuts can ping the web api upon arrival/departure from specified locations. 

* ?? The possibilities are somewhat endless when a versatile recording API
