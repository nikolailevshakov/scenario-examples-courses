
Include another file to compose.yml and declare service there.
Add override to the service.


<br>
<details><summary>Info</summary>
<br>

```plain
If the volume is empty, volume going to be populated by data from container.
Otherwise, the data in the container is going to be replaced by volume's data.

Check the instructions on handling volumes by using `docker volume --help`.

Documentation - https://docs.docker.com/compose/multiple-compose-files/include/.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
include applies recursively so an included Compose file which declares its own include section, results in those other files being included as well.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the container with a mounted volume:
(specifying `type=volume`isn't required, as it's the default behavior)

<br>

```plain
docker run -d -p 80:80 --mount type=volume,src=sample-volume,target=/usr/share/nginx/html --name sample-app nginx:alpine
```{{exec}}
OR
```plain
docker run -d -p 80:80 -v sample-volume:/usr/share/nginx/html --name sample-app nginx:alpine
```{{exec}}

<br>

Send get request to `localhost:80`:

<br>

```plain
curl localhost:80
```{{exec}}
