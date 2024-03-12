
Run services defined in `/root/compose.yml` file enabling server profile.
Check which services are running.

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/compose/profiles/#start-specific-profiles.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
docker help - to see docker commands.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run services with server profile:

<br>

```plain
docker compose --profile server up -d
```{{exec}}


<br>

Check which services are running:

<br>

```plain
docker ps
```{{exec}}