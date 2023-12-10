Rewrite `/usr/share/nginx/html/index.html` file with `<h1>Hello from the updated App</h1>`

Make a request to localhost:80.

Remove `sample-app` container.

<br>
<details><summary>Info</summary>
<br>

```plain
Volume is populated by data from container, if the volume is empty - https://docs.docker.com/storage/volumes/#populate-a-volume-using-a-container.
Otherwise, the data in the container is going to be replaced by volume's data.

Use docker volume --help - to see how to work with volumes.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use > to rewrite contents of the file.

Use the command 'curl' for making a request to localhost.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Rewrite index.html file:

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
```{{exec}}
Or
```plain
docker stop sample app && docker rm sample-app
```{{exec}}