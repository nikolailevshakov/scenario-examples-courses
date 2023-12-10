
Append line "Added from the host" to the /root/app-data/index.html on the host.

Make a request to `localhost:80`.

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
Use --mount or -v flag to mount volume.

Use -d flag to run container in the detached mode.

Use the command 'curl' for making a request to localhost.

Use >> to append line to the file.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Append line to the `/root/app-data/index.html` on the host:

<br>

```plain
echo "Added from the host" >> /root/app-data/index.html
```{{exec}}

<br>

Make a request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}

</details>