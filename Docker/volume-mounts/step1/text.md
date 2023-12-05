
Create a volume `sample-volume`.

Run the docker container named `sample-app` from image `alpine` with mounted volume.
Volume's `type=volume`, host's directory - `/root/files`, container's directory - `/data/files`.

Check if the file exists in the `/data/files` inside the container.


<br>
<details><summary>Info</summary>
<br>

```plain

Docs -https://docs.docker.com/storage/volumes/

Use docker volume --help - to see how to work with volumes.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use --mount flag when running the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create volume:

<br>

```plain
docker volume create sample-volume.
```

<br>

Run the container with the mounted directory:

<br>

```plain
docker run -d --mount type=volume,src=/root/files,target=/data/files --name sample-app alpine
```{{exec}}

<br>

List files in the docker's mounted directory:

<br>

```plain
docker exec sample-app ls /data/files
```{{exec}}
