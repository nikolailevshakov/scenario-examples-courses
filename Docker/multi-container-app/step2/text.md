

Initiate a container named `main-app`: 
* utilize the `main-app-image` image
* attach it to the `app-network` network
* ensure port `3000` on the host is mapped to port `3000` within the container

Make a request to `localhost:3000`.
Make a request to the `date-app` from the `main-app` container.

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/guides/walkthroughs/multi-container-apps/.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Use --network flag to attach container to the network.

Use -d flag to run container in the detached mode.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Run the container:

<br>

```plain
docker run -d --network app-network --name main-app main-app-image
```{{exec}}

<br>

Make a request to `localhost:3000`:

<br>

```plain
curl localhost:3000
```{{exec}}

<br>

Make a request to the `date-app` from the `main-app` container.

<br>

```plain
docker exec main-app sh -c "dig date-app"
```{{exec}}

</details>