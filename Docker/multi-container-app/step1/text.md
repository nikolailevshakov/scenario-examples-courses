
Create network `app-network`.

Initiate a container named `date-app`: 
* utilize the `date-app-image` image
* attach it to the `app-network` network


<br>
<details><summary>Info</summary>
<br>

```plain
Networking in Docker - https://docs.docker.com/network/.
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

Create network:

<br>

```plain
docker network create app-network
```{{exec}}

<br>

Run the container:

<br>

```plain
docker run -d --network app-network --name date-app date-app-image
```{{exec}}

</details>