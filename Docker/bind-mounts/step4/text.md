
Append line "Added from the host" to the /root/app-data/index.html on the host.
Request localhost:80.

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/storage/bind-mounts/
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use docker volume inspect command to see detailed information about the volume.
Use >> to append line to the file.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Append line to the index.html on the host:

<br>

```plain
echo "Added from the host" >> /root/app-data/index.html
```{{exec}}

<br>

Request localhost:80:

<br>

```plain
curl localhost:80
```{{exec}}

</details>