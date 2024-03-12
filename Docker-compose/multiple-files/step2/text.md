Using existing compose.yaml file create a new one that extends the service.
In compose.yml file extend web service with additional environment variable.

<br>
<details><summary>Info</summary>
<br>

```plain
Extending services is useful if you have several services that reuse a common set of configuration options. With extends you can define a common set of service options in one place and refer to it from anywhere. You can refer to another Compose file and select a service you want to also use in your own application, with the ability to override some attributes for your own needs.

Documentation - https://docs.docker.com/compose/multiple-compose-files/extends/.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Extending an individual service is useful when you have multiple services that have a common configuration
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

Send get request to `localhost:80`:

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
docker stop sample-app && docker rm sample-app
```{{exec}}