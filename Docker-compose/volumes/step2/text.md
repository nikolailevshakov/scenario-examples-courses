
Modify /root/compose.yaml file to use bind mount instead of volume mount:
- as a source use `./files`, as a target use `/root/data`
- run web service
- create file in the `/root/files` directory
- check if the file exists in the container's `/root/data` directory


<br>
<details><summary>Info</summary>
<br>

```plain


Documentation - https://docs.docker.com/storage/bind-mounts/#use-a-bind-mount-with-compose.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Check out `Using bind mounts` scenario in Docker course (https://killercoda.com/docker) to get deeper understanding of bind mounts in Docker.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Update `/root/compose.yaml `file:

<br>

```plain
cat > /root/compose.yaml <<EOF
services:
  web:
    image: nginx:alpine
    volumes:
      - type: bind
        source: ./files
        target: /root/data
volumes:
  data:
EOF
```{{exec}}


<br>

Run web service:

<br>

```plain
docker compose up -d
```{{exec}}

<br>

Create file in the `/root/data` directory:

<br>

```plain
touch /root/data/sample-file.txt
```{{exec}}

<br>

Check if the file exists in the container's file system:

<br>

```plain
docker compose exec web 'ls /root/data'
```{{exec}}
