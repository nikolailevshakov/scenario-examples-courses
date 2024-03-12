
- inject secret `my_secret` as an environment variable `SECRET_TOKEN`
- run web service
- check if the secret has been injected

<br>
<details><summary>Info</summary>
<br>

```plain
Documentation - https://docs.docker.com/compose/use-secrets/.
```

</details>

<br>
<details><summary>Tip</summary>
<br>

```plain
Getting a secret into a container is a two-step process. First, define the secret using the top-level secrets element in your Compose file. Next, update your service definitions to reference the secrets they require with the secrets attribute. Compose grants access to secrets on a per-service basis.
```

</details>


<br>
<details><summary>Solution</summary>
<br>

<br>

Update `/root/compose.yaml` file:

<br>

```plain
cat >> /root/compose.yaml <<EOF
services:
  web:
    image: alpine
    environment:
      SECRET_TOKEN: /run/secrets/my_secret
    secrets:
      - my_secret
secrets:
  my_secret:
    file: ./secret.txt
EOF
```{{exec}}


<br>

Run web service:

<br>

```plain
docker compose up -d
```{{exec}}


<br>

Check if the secret was injected:

<br>

```plain
docker compose exec web 'echo $SECRET_TOKEN'
```{{exec}}