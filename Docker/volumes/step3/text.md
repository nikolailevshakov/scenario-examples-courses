
Check the path on the host where `sample-volume` is mounted.
Append line "<p>Added from the host</p>" to the index.html on the host.
See inners of the index.html file in the container.

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
Use docker volume inspect command to see detailed information about the volume.
Use `>>` to append line to the file.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Inspect sample-volume:

<br>

```plain
docker volume inspect sample-volume
```{{copy}}

<br>

Append line to the index.html on the host:

<br>

```plain
echo "<p>Added from the host</p>" >> /
```{{exec}}

<br>

See inners of the index.html file in the container.

<br>

```plain
docker exec sample-app cat /usr/share/nginx/html/index.html
```{{exec}}

</details>