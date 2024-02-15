
Perform next steps:
- Run web service from `/root/compose.yaml `file
- Create file `/root/data/new-file.txt` in the created container
- Restart the service
- Check if the file exist in the newly created service

<br>
<details><summary>Info</summary>
<br>

```plain
Running docker compose up for the first time creates a volume. Docker reuses the same volume when you run the command subsequently.

Documentation - https://docs.docker.com/storage/volumes/#use-a-volume-with-docker-compose
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
If the volume is empty, volume is populated by data from container. 
Otherwise, the data in the container is going to be replaced by the volume's data.

Check out `Using volume mounts` scenario in Docker course (https://killercoda.com/docker) to get deeper understanding of volumes in Docker.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run web service:

<br>

```plain
docker compose up -d
```{{exec}}

<br>

Create file in the created container:

<br>

```plain
docker compose exec web 'touch /root/data/new-file.txt'
```{{exec}}

<br>

Restart the service:

<br>

```plain
docker compose restart
```{{exec}}

<br>

Check if the file exist in the new service:

<br>

```plain
docker compose exec web 'ls /root/data'
```{{exec}}
