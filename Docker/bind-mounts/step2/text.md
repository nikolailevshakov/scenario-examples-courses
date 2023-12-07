
Create /usr/share/nginx/html/index.html file with `<h1>Hello from the updated App</h1>`

Request localhost:80.

Remove sample-app container.

<br>
<details><summary>Info</summary>
<br>

```plain
Bind mount is not populated by data from container - https://docs.docker.com/storage/bind-mounts/#mount-into-a-non-empty-directory-on-the-container.

```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
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

Request localhost:80:

<br>

```plain
curl localhost:80
```{{exec}}

<br>

Remove the `sample-app` container:

<br>

```plain
docker rm -f sample-app
Or
docker stop sample app && docker rm sample-app
```{{copy}}