
Create `/usr/share/nginx/html/index.html` file with `<h1>Hello from the updated App</h1>`

Make a request to `localhost:80`.

Remove `sample-app` container.

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/storage/bind-mounts/.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use --mount or -v flag to mount volume.

Use -d flag to run container in the detached mode.

Use the command 'curl' for making a request to localhost.

Use echo and > to create file.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create index.html file:

<br>

```plain
docker exec sample-app sh -c "echo '<h1>Hello from the updated App</h1>' > /usr/share/nginx/html/index.html"
```{{exec}}

<br>

Make a request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}

<br>

Remove the `sample-app` container:

<br>

```plain
docker rm -f sample-app
```{{exec}}
OR
```plain
docker stop sample-app && docker rm sample-app
```{{copy}}