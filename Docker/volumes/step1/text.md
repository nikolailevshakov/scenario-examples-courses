
Create a volume `sample-volume`.

Run the docker container named `sample-app` from image `nginx:alpine` with mounted volume.
Volume's `type=volume`, src - `sample-volume`, container's directory - `/home/files`.

Create `container-data.txt` inside the container `/home/files` directory.

Remove the `sample-app` container.

Create the `sample-app` container with the same mounted volume.

Check if the file exists in the `/home/files` inside the container.


<br>
<details><summary>Info</summary>
<br>

```plain
Docs - https://docs.docker.com/storage/volumes/

Use `docker volume --help` - to see how to work with volumes.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use `--mount` flag when running the container.

If you want to see where on the host the created volume is mounted use:
`docker volume inspect sample-volume` command.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create volume:

<br>

```plain
docker volume create sample-volume
```{{exec}}


<br>

Run the container with the mounted directory:

<br>

```plain
docker run -d --mount type=volume,src=sample-volume,target=/home/files --name sample-app nginx:alpine
```{{exec}}

<br>

Create `container-data.txt` inside the container's /home/files directory:

<br>

```plain

docker exec sample-app touch /home/files/container-data.txt

```

<br>

Remove the `sample-app` container:

<br>

```plain
docker rm -f sample-app
Or
docker stop sample app && docker rm sample-app
```{{exec}}

<br>

Run the container `sample-app` again with the same mounted volume:

<br>

```plain
docker run -d --mount type=volume,src=sample-volume,target=/home/files --name sample-app nginx:alpine
```{{exec}}

<br>

List files in the mounted `/home/files` directory inside the container `sample-app`:

<br>

```plain
docker exec sample-app ls /home/files
```{{exec}}