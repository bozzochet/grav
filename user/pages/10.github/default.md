---
menu: GitHub
github: true
process:
    markdown: true
    twig: true
published: false
---

# My GitHub page

% questo non va
{{ github.client.api('user').repositories('bozzochet').description|e }}


<ul>
    <li>Repositories (<strong>{{ github.client.api('user').repositories('bozzochet')|length }}</strong>):
        <ul>
        {% for repo in github.client.api('user').repositories('bozzochet') %}
            <li>{{ repo.name|e }} [<a href="{{ repo.html_url|e }}">link</a> | forks: <strong>{{ repo.forks_count|e }}</strong> | stargazers: <strong>{{ repo.stargazers_count|e }}</strong> | pippo: {{ repo.description|e }}] </li>
        {% endfor %}
        </ul>
    </li>
</ul>