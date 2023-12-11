
ssh to the host ubuntu-2

Make a request to `ubuntu-1:80` and to `ubuntu-1:81`


<br>
<details><summary>Info</summary>
<br>

```plain
To ssh use `ssh host-name` command.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use -d (detached) flag when running the container.
Documentation - https://docs.docker.com/network/#published-ports.

If you include the localhost IP address (127.0.0.1) with the publish flag, only the Docker host can access the published container port.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Make a request to `ubuntu-1:80`:

<br>

```plain
curl ubuntu-1:80
```

<br>

Make a request to `ubuntu-1:81`:

<br>

```plain
curl ubuntu-1:81
```{{exec}}

</details>