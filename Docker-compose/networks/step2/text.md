
Add alias to the `web-1` service as `app-1.`
Curl to the `app-1` from the `web-2` service.

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/compose/networking/#link-containers.
```

</details>

<br>
<details><summary>Solution</summary>
<br>

<br>

Modify /root/compose.yml file.

<br>

```plain
cat >> /root/compose.yml <<EOF
services:
  web-1:
    image: app-1
    ports:
      - "8001:8002"
  web-2:
    image: app-2
    ports:
      - "8003:8004"
    links:
      - "web-1:app-1"
EOF
```{{exec}}

<br>

Curl to the app-1 service from web-2:

<br>

```plain
docker exec web-2 sh -c "curl app-1:8002"
```{{exec}}
