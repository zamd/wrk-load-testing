# wrk scripts for appliance load testing 

- json.lua: JSON serializer
- ro-n.lua: Cycle through & authenticate `n` users using `/ro` endpoint
- su.lua: Signup bulk users using lock signup apis
- ro: Authenticate a single user. This creates contention and artificial bottleneck when run under load. Only used for functional testing.

The following command runs the signup script to create bulk users. The last number (`9999`) is the range assigned to each thread. In the example below, thread 1 would work on range 1-9999 and the last thread would work on the range `9999*11`-`9999*12`

`wrk -c1000 -d60s -t12 -T15s -s su.lua https://tenant.auth0.com 9999`
