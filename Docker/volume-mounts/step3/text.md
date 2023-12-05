
Run a container `sample-app` with mounted volume (using -v), with image `alpine`.
Host's directory - `/root/files`, container's directory - `/data/files`.

List files inside the container in the mounted directory.

Inspect created volume.


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
Use flag -v when running the container.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the container with mounted volume:

<br>

```plain
docker run -d --name sample-app -v /root/files:/data/files alpine
```

<br>

List files inside the mounted directory in the container:

<br>

```plain
docker exec sample-app ls /data/files
```{{exec}}

<br>

Inspect created volume:

<br>

```plain
docker volume inspect 
```{{exec}}
