
Modify `/root/compose.yaml` file that:
- it will be watching `index.html` file using `sync` as an action
- run web service
- add `<h2>Modified from the host</h2>`
- check if the file has been changed in the service

<br>
<details><summary>Info</summary>
<br>

```plain
If action is set to sync, Compose makes sure any changes made to files on your host automatically match with the corresponding files within the service container.
sync is ideal for frameworks that support "Hot Reload" or equivalent functionality.

Documentation - https://docs.docker.com/compose/file-watch/#sync.

There are 2 more action types:
- rebuild, Compose automatically builds a new image with BuildKit and replaces the running service container.
- sync+restart, Compose synchronizes your changes with the service containers and restarts it.
```

</details>

<br>
<details><summary>Tip 1</summary>
<br>

```plain
Add next lines to the compose.yaml file:
develop:
    watch:
    - action: sync
        path: ./index.html
        target: /index.html
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Update /root/compose.yaml file:

<br>

```plain
cat >> /root/compose.yaml <<EOF
services:
  web:
    build: .
    develop:
        watch:
            - action: sync
                path: ./index.html
                target: /index.html
EOF
```{{exec}}


<br>

Run web service:

<br>

```plain
docker compose up -d /root
```{{exec}}

<br>

Modify index.html on the host:

<br>

```plain
cat >> /root/index.html <<EOF
<h1>Hello from the index.html</h1>
<h2>Modified from the host</h2>
EOF
```{{exec}}

<br>

Check if the file has been changed in the web service:

<br>

```plain
docker compose exec web "cat /index.html"
```{{exec}}