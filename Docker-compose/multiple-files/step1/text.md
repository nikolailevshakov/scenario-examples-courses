
run docker compose up -d, curl to localhost:80
create compose.prod.yaml file with environment variables BASE_VAR and OVERRIDE_VAR
run docker compose up -d with compose.prod.yaml file
curl to localhost:80

<br>
<details><summary>Info</summary>
<br>

```plain
By default, Compose reads two files, a compose.yml and an optional compose.override.yml file. By convention, the compose.yml contains your base configuration. The override file can contain configuration overrides for existing services or entirely new services. However, you can provide paths to the files by using flag `-f`.

Any matching fields override the previous file. New values, add to services configuration

Documentation - https://docs.docker.com/compose/multiple-compose-files/merge/.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
A common use case for multiple files is changing a development Compose app for a production-like environment (which may be production, staging or CI).
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Create volume:

<br>

```plain
docker volume create sample-volume
```{{exec}}


<br>

Run the container with the mounted directory:

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