Update `/root/compose.yml` file:
- create 2 networks: `network-1` and `network-2`
- make sure that `web-1` service attached only to `network-1 and `web-2` attached to `network-2`
- `web-3` service should use image `app-3` and ports `8005:8006` and be attached to the both networks - `network-1` and `network-2`

Try to curl to the web-1 and web-2 from the web-3 service.
Try to curl to the web-2 and web-3 from the web-1 service


<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/compose/networking/#specify-custom-networks.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
The updated /root/compose.yml file:
services:
  web-1:
    image: app-1
    ports:
      - "8001:8002"
    networks:
      - network-1
  web-2:
    image: app-2
    ports:
      - "8003:8004"
    networks:
      - network-2
  web-3:
    image: app-3
    ports:
      - "8005:8006"
    network:
      - network-1
      - network-2
  networks:
    network-1:
      driver: custom-driver-1
    network-2:
      driver: custom-driver-2
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Update root/compose.yml file:

<br>

```plain
cat >> /root/compose.yml <<EOF
services:
  web-1:
    image: app-1
    ports:
      - "8001:8002"
    networks:
      - network-1
  web-2:
    image: app-2
    ports:
      - "8003:8004"
    networks:
      - network-2
  web-3:
    image: app-3
    ports:
      - "8005:8006"
    network:
      - network-1
      - network-2
  networks:
    network-1:
      driver: custom-driver-1
    network-2:
      driver: custom-driver-2
```
```{{exec}}

<br>

Curl to web-1 and web-2 from web-3:

<br>

```plain
docker exec web-3 sh -c "curl web-1:8002" &&
docker exec web-3 sh -c "curl web-2:8004"
```{{exec}}


<br>

Curl to web-2 and web-3 from web-1:

<br>

```plain
docker exec web-1 sh -c "curl web-2:8004" &&
docker exec web-1 sh -c "curl web-3:8006"
```{{exec}}
