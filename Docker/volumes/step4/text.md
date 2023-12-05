
Run the docker container named `sample-app` from image `nginx:alpine` with mounted bind.
Volume's `type=bind`, src - `/home/files`, container's directory - `/home/files`.

Create `container-data.txt` inside the container `/home/files` directory.

Create `host-data.txt` on the host mounted directory `/root/files`.

Remove the `sample-app` container.

Create the `sample-app` container with the same mounted volume.

Check if the files exists in the `/home/files` inside the container or on the host directory `/root/files`.

<br>
<details><summary>Info</summary>
<br>

```plain
Docs https://docs.docker.com/storage/volumes/

Volume - allow to persist container's data.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use -f flag to force deletion of the running container.

Use `>>` to append line to the file.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the container:

<br>

```plain
docker run -d --mount type=bind,src=/root/files,target=/home/files --name sample-app nginx:alpine
```{{exec}}

<br>

Create `container-data.txt` inside the container `/home/files` directory.

<br>

```plain
docker exec sample-app touch /home/files/container-data.txt
```{{exec}}

<br>

Create `host-data.txt` on the host mounted directory `/root/files`:

<br>

```plain
touch /root/files/host-data.txt
```{{exec}}

<br>

Remove sample-app container

<br>

```plain
docker exec sample-app cat /data/files/file1.txt
```{{exec}}

<br>

Remove sample-app container:

<br>

```plain
docker rm -f sample-app

Or

docker stop sample-app && docker rm sample-app
```{{exec}}

<br>

Cat `file1.txt` on the host:

<br>

```plain
cat /root/files/file1.txt
```{{exec}}


</details>