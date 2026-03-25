---
layout: page
title: CV
---

## Education

{% for entry in site.data.cv.education %}
**{{ entry.degree }}** — {{ entry.institution }} ({{ entry.years }})
{% if entry.notes %}{{ entry.notes }}{% endif %}
{% endfor %}

## Experience

{% for role in site.data.cv.experience %}
**{{ role.title }}** — {{ role.company }} *({{ role.dates }})*
{% for bullet in role.bullets %}
- {{ bullet }}
{% endfor %}
{% endfor %}

## Skills

{% for group in site.data.cv.skills %}
**{{ group.category }}:** {{ group.items | join: ", " }}
{% endfor %}

{% if site.data.cv.publications %}
## Publications

{% for pub in site.data.cv.publications %}
[{{ pub.title }}]({{ pub.url }}) — {{ pub.venue }}, {{ pub.year }}
{% endfor %}
{% endif %}
